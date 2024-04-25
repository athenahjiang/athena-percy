####
#### fee schedule
####
BusCall::Claim::FeeScheduleLookUpCodes($dbh, { searchTerms =>[{ procedureCode=> '00170', departmentID=> 52, date => "04/24/2024" }], insurancePackageID => 0, });
use FeeSchedule;
FeeSchedule::LookUpCodes($dbh, { searchTerms =>[{ procedureCode=> '90210', departmentID=> 103, date => "04/24/2024" }], insurancePackageID => 0, });

####
#### sliding fee
####
BusCall::SlidingFeeSchedule::GetPatientResponsibilityWithExclusion($dbh, {slidingFeePlanId=>43,slidingFeeProgramId=>43,departmentId=>103,renderingProviderId=>123,procedures=>[{cost=>500,units=>1,procedureWithModifier=>"TEST",}],});
# get program and maybe plan
BusCall::Appointment::GetAppointmentSlidingFeeInfo($dbh,{ APPOINTMENTID => 1314345, });
# get plan from program
BusCall::SlidingFeeSchedule::DetermineSlidingFeePlanID($dbh,{ PATIENTID => 31495, SLIDINGFEEPROGRAMID => 1, ASOFDATE=>'09/12/2022', });
# get program and plan from pi
BusCall::PatientInsurance::GetPatientInsuranceBySQL($dbh,{ SQLWHEREARGS=>{ 'PATIENTINSURANCE.ID=?' => 21423, 'PATIENTINSURANCE.PATIENTID=?' => 1561457, }, SQLSELECTARGS => [ 'patientinsurance.SLIDINGFEEPROGRAMID', 'patientinsurance.SLIDINGFEEPLANID', ] });
# get exclusions from program
use FeeSchedule::SlidingFee;
FeeSchedule::SlidingFee::GetSlidingFeeExclusions($dbh, { SLIDINGFEEPROGRAMID => 83, });
# remove exclusions
FeeSchedule::SlidingFee::RemoveExcludedCharges($dbh, { SLIDINGFEEPROGRAMID => $slidingfeeprogramid, CHARGES => \@patienttransfers, });
# calculate patient pay
FeeSchedule::SlidingFee::CalculatePatientResponsibility($dbh, { TOTALCHARGE => 200, SLIDINGFEEPLAN => $slidingfeeplan, });
