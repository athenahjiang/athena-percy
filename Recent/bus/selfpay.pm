####
#### fee schedule
####
BusCall::Claim::FeeScheduleLookUpCodes($dbh, { searchTerms =>[{ procedureCode => '00170', date => "06-02-2022", departmentID => 52, }], insurancePackageID => 131462, });
BusCall::Claim::FeeScheduleLookUpCodes($dbh, { searchTerms =>[{ procedureCode=> '00170', departmentID=> 5480, date => "01-09-2023" }], insurancePackageID => 692810, });
# example? ip id always null?

####
#### sliding fee
####
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
