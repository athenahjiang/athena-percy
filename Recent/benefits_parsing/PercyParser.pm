package Athena::Eligibility::API::PatientEligibility;

use AthenaUtils;
use Athena::Policy;
use Athena::ServiceBus::Attributes;
use Athena::ServiceBus::Dispatcher;
use Athena::Util::Assert qw/AssertFields AssertAtMostOneFields AssertAtLeastOneFields/;
use Athena::Conf::AthenaNet;
use Eligibility::Template;
use Try::Tiny;
use Eligibility::ResponseCodes;

sub PercyParseRawEligibilityResponse: ExposeAPIMethod(+{ALLOWMDP => 1}) {
	
}

sub PercyParseEbLoops: ExposeAPIMethod(+{ALLOWMDP => 1}) {
	my ($dbh, $args) = @_;

	my $results = Eligibility::Template::_GetResultsFromEligibilityTrack($dbh, { ELIGIBILITYTRACKID => $args->{ELIGIBILITYTRACKID}, PATIENTINSURANCE => { PATIENTID => $args->{PATIENTID}, }, });
	my $ebloops = $results->{CANONICAL}->{EBLOOPS} || [];

	my @benefitarray;
	for my $loop (@$ebloops) {
		push (@benefitarray , PercyParseSingleEbLoop($dbh, {
			LOOP => $loop,
			ELIGIBILITYCLASS => $args->{ELIGIBILITYCLASS},
		}));
	}

	return @benefitarray;
}

sub PercyParseSingleEbLoop {
	my ($dbh, $args) = @_;

	my $loop = $args->{LOOP};
	my $eligibility_class = $args->{ELIGIBILITYCLASS};
	my $eligibilityreceiver = InList($eligibility_class, 'MEDICARE_A', 'MEDICARE_B', 'MEDICARE_B_NY_EMPIRE', 'MEDICARE_B_OH') ? "Medicare" : "";

	# EB - SUBSCRIBER Eligibility OR BENEFIT INFORMATION
	my $segment_eb = $loop->{EB};
	my $benefit = {
		benefitInfoCode => $Eligibility::ResponseCodes::BENEFIT_EB01{$segment_eb->{FIELD01}} || "Standard",
		coverageLevelCode => $Eligibility::ResponseCodes::BENEFIT_EB02{$segment_eb->{FIELD02}} || 'Standard',
		serviceTypeCode => $Eligibility::ResponseCodes::BENEFIT_EB03{$segment_eb->{FIELD03}} || "Standard",
		insuranceTypeCode => $Eligibility::ResponseCodes::BENEFIT_EB04{$segment_eb->{FIELD04}},
		planCoverageDescription => $segment_eb->{FIELD05},
		timePeriodQualifier => $Eligibility::ResponseCodes::BENEFIT_EB06{$segment_eb->{FIELD06}},
		monetaryAmount => $segment_eb->{FIELD07} ne '' ? Eligibility::Template::FormatCurrency($segment_eb->{FIELD07},'$') : '',
		percent => Eligibility::Template::_FormatPercent($segment_eb->{FIELD08}),
		quantityQualifier => $Eligibility::ResponseCodes::BENEFIT_EB09{$segment_eb->{FIELD09}},
		quantity => $segment_eb->{FIELD10},
		authRequired => $Eligibility::ResponseCodes::BENEFIT_EB11{$segment_eb->{FIELD11}},
		planNetwork => $segment_eb->{FIELD12},
		compMedProcedId => $segment_eb->{FIELD13},
		compDiagCodePoint => $segment_eb->{FIELD14},
	};
	$benefit->{procedureIdentifier} = {
		name => $Eligibility::ResponseCodes::BENEFIT_EB13F1{$loop->{EB}{FIELD13}{COMPONENT00}} || 'Unknown Product/Service ID',
		value => $segment_eb->{FIELD13}{COMPONENT01},
	};

	# HSD - HEALTH CARE SERVICES DELIVERY
	my @segments_hsd = @{$loop->{HSD} ||= []};		
	my @healthCareServicesDelivery;
	for my $segment (@segments_hsd) {
		my $translated_hsd = Eligibility::Template::_TranslateHSD($segment, $eligibilityreceiver);
		if ($translated_hsd) {
			push (@healthCareServicesDelivery, { 
				name => 'Delivery', 
				value => $translated_hsd, 
			});
		}
	}
	$benefit->{healthCareServicesDelivery} = \@healthCareServicesDelivery;

	# REF - SUBSCRIBER/DEPENDENT ADDITIONAL IDENTIFICATION
	my @segments_ref = @{$loop->{REF} ||= []};
	my @additionalIdentification;
	for my $segment (@segments_ref) {
		push @additionalIdentification, {
			name => $Eligibility::ResponseCodes::BENEFIT_REF01{$segment->{FIELD01}} || 'Reference',
			value => $segment->{FIELD03} ne '' ? " $segment->{FIELD02} ($segment->{FIELD03})" : $segment->{FIELD02},
		};
	}
	$benefit->{additionalIdentification} = \@additionalIdentification;

	# DTP - SUBSCRIBER/DEPENDENT ELIGIBILITY/BENEFIT DATE
	my @segments_dtp = @{$loop->{DTP} ||= []};
	my @benefitDate;
	for my $segment (@segments_dtp) {
		push (@benefitDate, {
			dateTimeQualifier => $Eligibility::ResponseCodes::BENEFIT_DTP01{$segment->{FIELD01}} || 'Date',
			dateTimePeriodFormatQualifier => $segment->{FIELD02},
			dateTimePeriod => Eligibility::Template::_FormatDate($segment->{FIELD03}),
		});
	}
	$benefit->{benefitDate} = \@benefitDate;

	# AAA - SUBSCRIBER/DEPENDENT REQUEST VALIDATION
	my @segments_aaa = @{$loop->{AAA} ||= []};
	my @requestValidation;
	for my $segment (@segments_aaa) {
		if ($segment->{FIELD01} || $segment->{FIELD03}) {
			push @requestValidation, {
				name => 'Validation',
				value => $Eligibility::ResponseCodes::SOURCE_AAA01{$segment->{FIELD01}} . ' ' . $Eligibility::ResponseCodes::BENEFIT_AAA03{$segment->{FIELD03}},
			};
		}
	}
	$benefit->{requestValidation} = \@requestValidation;

	# MSG - MESSAGE TEXT
	my @segments_msg = @{$loop->{MSG} ||= []};
	my @messageText;
	for my $segment (@segments_msg) {
		push (@messageText, $segment->{FIELD01});
	}
	$benefit->{messageText} = \@messageText;

	# Does 2115 loop and III segment only repeat once?
	# III - DEPENDENT ELIGIBILITY OR BENEFIT ADDITIONAL INFORMATION
	my @segments_iii = (@{$loop->{'2115C'} ||= []}, @{$loop->{'2115D'} ||= []});
	my @benefitAdditionalInfo;
	for my $segment (@segments_iii) {
		if ($Eligibility::ResponseCodes::BENEFIT_III02{$segment->{III}{FIELD02}}) {
			push (@benefitAdditionalInfo, {
				name => $Eligibility::ResponseCodes::BENEFIT_III01{$segment->{III}{FIELD01}},
				value => $Eligibility::ResponseCodes::BENEFIT_III02{$segment->{III}{FIELD02}},
			});
		}
	}
	$benefit->{benefitAdditionalInfo} = \@benefitAdditionalInfo;

	# Does 2120 loop only repeat once? (legacy parsing returns list)
	####
	#### Loop 2120 C/D
	####
	my (@benefitRelatedEntityName, @benefitRelatedEntityAddress, @benefitRelatedEntityCityStateZip, @benefitRelatedEntityContactInfo, @benefitRelatedEntityProviderInfo);
	for my $loop (@{$loop->{'2120C'}}, @{$loop->{'2120D'}}) {

		# NM1 - DEPENDENT BENEFIT RELATED ENTITY NAME
		my $translated_nm1 = Eligibility::Template::_TranslateNM1($loop->{NM1});
		if ($translated_nm1) {
			push (@benefitRelatedEntityName, {
				name => $Eligibility::ResponseCodes::BENEFIT_ENTITY_NM101{$loop->{NM1}{FIELD01}} || "Entity Name",
				value => $translated_nm1,
			});
		}
		if ($loop->{NM1}{FIELD09}) {
			push (@benefitRelatedEntityName, {
				name => $Eligibility::ResponseCodes::BENEFIT_ENTITY_NM108{$loop->{NM1}{FIELD08}} || "Entity ID",
				value => $loop->{NM1}{FIELD09},
			});
		}

		# Can we combine N3 and N4 but into a plain array without hash? Address is just a string
		# N3 - DEPENDENT BENEFIT RELATED ENTITY ADDRESS
		if ($loop->{N3}{FIELD01} || $loop->{N3}{FIELD02}) {
			my $address = join(' ',$loop->{N3}{FIELD01},$loop->{N3}{FIELD02});
			push (@benefitRelatedEntityAddress, {
				name => "Address", value => $address,
			});
		}

		# Can we combine N3 and N4 but into a plain array without hash? Address is just a string
		if ($loop->{N4}{FIELD01} || $loop->{N4}{FIELD02} || Eligibility::Template::_FormatZIP($loop->{N4}{FIELD03}) || $loop->{N4}{FIELD04}) {
			my $cityStateZip = join(' ',$loop->{N4}{FIELD01},$loop->{N4}{FIELD02},Eligibility::Template::_FormatZIP($loop->{N4}{FIELD03}),$loop->{N4}{FIELD04});
			push (@benefitRelatedEntityCityStateZip, {
				name => "City State Zip", value => $cityStateZip,
			});
		}

		# PER - DEPENDENT BENEFIT RELATED ENTITY CONTACT INFORMATION
		my @segments_per = @{$loop->{PER} ||=[]};
		push (@benefitRelatedEntityContactInfo, Eligibility::Template::_FormatContactInfo({
			CONTACTS => \@segments_per
		}));
		@segments_per = map {{
			name => $_->{NAME}, 
			value => $_->{VALUE}
		}} grep {$_->{NAME} && $_->{VALUE}} @segments_per;

		# PRV - DEPENDENT BENEFIT RELATED PROVIDER INFORMATION
		if ($loop->{PRV}{FIELD01}) {
			push (@benefitRelatedEntityProviderInfo, {
				name =>  $Eligibility::ResponseCodes::BENEFIT_ENTITY_PRV01{$loop->{PRV}{FIELD01}},
				value => join(': ', 
					$Eligibility::ResponseCodes::BENEFIT_ENTITY_PRV02{$loop->{PRV}{FIELD02}},
					$loop->{PRV}{FIELD03},
				),
			});
		}
	}
	$benefit->{benefitRelatedEntityName} = \@benefitRelatedEntityName;
	$benefit->{benefitRelatedEntityAddress} =  \@benefitRelatedEntityAddress;
	$benefit->{benefitRelatedEntityCityStateZip} = \@benefitRelatedEntityCityStateZip;
	$benefit->{benefitRelatedEntityContactInfo} = \@benefitRelatedEntityContactInfo;
	$benefit->{benefitRelatedEntityProviderInfo} = \@benefitRelatedEntityProviderInfo;

	return $benefit;
}
