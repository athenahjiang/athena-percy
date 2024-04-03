<!-- Provider -->

# practice settings

## Provider-Group-Based Data Permissions
practice with multiple provider groups

<a enterprise>
a single human patient can have multiple copies
1 client.enterpriseid -> multiple client.id
1 patientinsurance.patiententerpriseid -> multiple patientinsurance.enterpriseid
1 patientinsurance.patientid -> multiple patientinsurance.id

## CPI Shared Patient Fields
determines which patient demographic fields are force-synchronized across provider-groups

# Common Patient Index (CPI) Sync
whenever a patient record is updated
all copies of patient are then updated to match
happens on every patient update via perl subsystem

# share
cpi sync = share
share != cpi sync

## share tracks among provider groups
from qv get a client id
from a client id get a client enterprise id
from a client enterprise id get multiple client id (same client across pgs)
from multiple client id get multiple track
make all track visible for the client id got from qv (share track among pgs)

## pgs share chart groups
client.providergroupid
department.providergroupid
department.CHARTSHARINGGROUPID

# GetLastEligibilityCheck
