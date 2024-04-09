alter user "eligsvcdb-prod-eligsvc_ad" rename to "eligibility-service-aurora-prod_ad";
alter user "eligibility-service-aurora-prod_ad" with password 'RandomString12#';

alter user "eligsvcdb-prod-eligsvc_sc" rename to "eligibility-service-aurora-prod_sc";
alter user "eligibility-service-aurora-prod_sc" with password 'RandomString12#';

alter user "eligsvcdb-prod-eligsvc_rw" rename to "eligibility-service-aurora-prod_rw";
alter user "eligibility-service-aurora-prod_rw" with password 'RandomString12#';

alter user "eligsvcdb-prod-eligsvc_ro" rename to "eligibility-service-aurora-prod_ro";
alter user "eligibility-service-aurora-prod_ro" with password 'RandomString12#';

alter user "eligsvcdb-prod-eligsvc_mdip" rename to "eligibility-service-aurora-prod_mdip";
alter user "eligibility-service-aurora-prod_mdip" with password 'RandomString12#';

alter user "dfterraform" with password '?';

drop user "dfterraform_clone";