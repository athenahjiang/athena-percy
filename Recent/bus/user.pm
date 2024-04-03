BusCall::User::RecentUserDataSet($dbh, { USERNAME => 'pjiang4', KEY => 'ELIGIBILITY_FAVORITE_STCCODE', VALUE => undef, });

BusCall::User::RecentUserDataSet($dbh, { USERNAME => 'pjiang4', KEY => 'ELIGIBILITY_FAVORITE_STCCODE', VALUE => '[]', });

# 30
BusCall::User::RecentUserDataSet($dbh, { USERNAME => 'pjiang4', KEY => 'ELIGIBILITY_FAVORITE_STCCODE', VALUE => '[{"code":"30","definition":"Health Benefit Plan Coverage","description":"Health Benefit Plan Coverage","isEmptyBenefit":false,"dateOfService":"07/23/2023","isFavorite":true,"ordering":0}]', });

# 30,OBI,98
BusCall::User::RecentUserDataSet($dbh, { USERNAME => 'pjiang4', KEY => 'ELIGIBILITY_FAVORITE_STCCODE', VALUE => '[{"code":"30","definition":"Health Benefit Plan Coverage","description":"Health Benefit Plan Coverage","isEmptyBenefit":false,"dateOfService":"09/27/2023","isFavorite":true,"ordering":0},{"code":"OBI","definition":"Other Benefit Information","description":"Other Benefit Information","isEmptyBenefit":false,"dateOfService":"09/27/2023","isFavorite":true,"ordering":1},{"code":"98","definition":"Professional (Physician) Visit - Office","description":"Professional (Physician) Visit - Office","isEmptyBenefit":false,"dateOfService":"11/14/2022","isFavorite":true,"ordering":2}]', });

BusCall::User::RecentUserDataGet($dbh, { USERNAME => 'pjiang4', KEY => 'ELIGIBILITY_FAVORITE_STCCODE' });
