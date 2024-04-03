<!-- JWT -->

```bash
# eligibility-service
$AX_HOME/fhir/fhir create-anet-jwt --username pjiang4 --scopes athena/user/CollectorEligibility.EligibilityService.read,athena/user/CollectorEligibility.EligibilityService.write

# cost-estimate-service
$AX_HOME/fhir/fhir create-anet-jwt --username pjiang4 --scopes athena/user/CostEstimate.CostEstimateService.read,athena/user/CostEstimate.CostEstimateService.write

# practitioner
$AX_HOME/fhir/fhir create-anet-jwt --username pjiang4 --scopes athena/service/Directory.Practitioner.read
```

```js
// jwt
window.AH.jwt = require('static:/jwt');

// athenanet
window.AH.jwt.getJWT({ scopes: ['athena/service/Athenanet.*'] }).then((jwt) => console.log(jwt)).catch((err) => console.log(err));

// eligibility-service
window.AH.jwt.getJWT({ scopes: ['athena/user/CollectorEligibility.EligibilityService.read', 'athena/user/CollectorEligibility.EligibilityService.write'] }).then((jwt) => console.log(jwt));

// practitioner
window.AH.jwt.getJWT({ scopes: ['athena/service/Directory.Practitioner.read'] }).then((jwt) => console.log(jwt));
```

```perl
use Athena::Driver::IdentityAccessManagement;

# eligibility-service
Athena::Driver::IdentityAccessManagement::GetTwoLeggedOAuthAccessToken($dbh, { SCOPES => [ qw( athena/user/CollectorEligibility.EligibilityService.read ) ] });

# practitioner
Athena::Driver::IdentityAccessManagement::GetTwoLeggedOAuthAccessToken($dbh, { SCOPES => [ qw(athena/service/Directory.Practitioner.read) ] });
Athena::Driver::IdentityAccessManagement::GetTwoLeggedOAuthAccessToken($dbh, { SCOPES => [ qw(system/Practitioner.read) ] });
```

```java
// anet
ServiceTokenManager stm =
    new ServiceTokenManager(
        "0oamt6arrbIPTt5Mg1t7",
        "K9omzrRILORoGtb3YInH_Pw1dnz3i4VS3iMzy1sY",
        "athena/service/Athenanet.*",
        "https://athenahealthpoc.okta.com/oauth2/aus13kbtj4HAdI3451t7/v1/token");
try {
  String token = stm.getAccessToken();
} catch (ServiceTokenException e) {
  throw new RuntimeException(e);
}
```