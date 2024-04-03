<!-- Env Variables -->

# EligibilityApplication
AWS_PROFILE=saml;LOGICAL_ENV_NAME=local;IAM_CLIENT_ID=0oas1td7wz2iecSRD1t7;IAM_CLIENT_SECRET=YLUy8tAZ0Lbql5Yho0UJbYw1VoieJy0QbauXdTEn;DB_HOST=localhost;DB_PORT=5432;DB_NAME=eligsvcdb;DB_USERNAME=localuser;DB_PASSWORD=localpassword;BENEFITS_BUCKET_ROLE_ARN=arn:aws:iam::922056656510:role/eligsvc-percya-dev-benefits-bucket_rw;BENEFITS_BUCKET_ID=eligsvc-percya-dev-benefits-bucket;VIS_URL=https://app-dental-integration-service-001.azurewebsites.net/api/Eligibility;VIS_API_KEY=48487AA00D604AEBA2DA0D043DB768AF;
**default**
AWS_PROFILE=saml;
LOGICAL_ENV_NAME=local;
**okta**
IAM_CLIENT_ID=0oas1td7wz2iecSRD1t7;
IAM_CLIENT_SECRET=YLUy8tAZ0Lbql5Yho0UJbYw1VoieJy0QbauXdTEn;
**rds**
DB_HOST=localhost;
DB_PORT=5432;
DB_NAME=eligsvcdb;
DB_USERNAME=localuser;
DB_PASSWORD=localpassword;
**s3**
BENEFITS_BUCKET_ROLE_ARN=arn:aws:iam::922056656510:role/eligsvc-percya-dev-benefits-bucket_rw;
BENEFITS_BUCKET_ID=eligsvc-percya-dev-benefits-bucket;
**vis**
VIS_URL=https://app-dental-integration-service-001.azurewebsites.net/api/Eligibility;
VIS_API_KEY=48487AA00D604AEBA2DA0D043DB768AF;

# CostEstimateApplication
AWS_PROFILE=saml;LOGICAL_ENV_NAME=local;IAM_CLIENT_ID=0oaqsgasvvjBaEYuq1t7;IAM_CLIENT_SECRET=RL5zx_taMUZD_CYslWC1w5eYGmB8r-DLRBH6XISf;DB_HOST=localhost;DB_PORT=5433;DB_NAME=estimatedb;DB_USERNAME=localuser;DB_PASSWORD=localpassword;
**default**
AWS_PROFILE=saml;
LOGICAL_ENV_NAME=local;
**okta**
IAM_CLIENT_ID=0oaqsgasvvjBaEYuq1t7;
IAM_CLIENT_SECRET=RL5zx_taMUZD_CYslWC1w5eYGmB8r-DLRBH6XISf;
**rds**
DB_HOST=localhost;
DB_PORT=5433;
DB_NAME=estimatedb;
DB_USERNAME=localuser;
DB_PASSWORD=localpassword;

# SqsHandler
FILECLOUD_RO_ROLE_ARN=arn:aws:iam::922056656510:role/coltec-filecloud-eligibilityevents_nonprod;FILECLOUD_ENVIRONMENT=dtest;FILECLOUD_ZONE=dev;ELIGIBILITY_S3_BUCKET=eligsvc-percya-dev-benefits-bucket
**fcc**
FILECLOUD_RO_ROLE_ARN=arn:aws:iam::922056656510:role/coltec-filecloud-eligibilityevents_nonprod;
FILECLOUD_ENVIRONMENT=dtest;
FILECLOUD_ZONE=dev;
**s3**
ELIGIBILITY_S3_BUCKET=eligsvc-percya-dev-benefits-bucket;
