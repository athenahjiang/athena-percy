<!-- Transactions -->

how do they vary by each eb segment?
https://alertmanager-eligibility.us-east-1.dev.eligibility.aws.athenahealth.com/api/v2
https://alertmanager-eligibility-internal.us-east-1.dev.eligibility.aws.athenahealth.com/api/v2

# Copay

A fixed amount per visit

# Deductible

A fixed amount per year, cumulative adding everything paid by patient so far (sometimes including copay). Once the amount is reached, payer starts sharing cost by co-insurance.

# Co-Insurance

A fixed percentage per visit, payer starts sharing cost by this percentage after deductible is reached.

# Out of Pocket Max

A fixed amount per year, cumulative adding everything paid by patient so far (copay, deductible, and coinsurance). Payer starts paying all cost for service once this amount is reached (no more copay).
