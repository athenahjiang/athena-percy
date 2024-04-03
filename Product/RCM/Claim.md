# Claim Preparation & Submission

**Charge Entry**
putting the charges onto the claim itself
pulling info from the medical record
mapping the services rendered to procedure/diagnosis code
*Diagnosis Codes* classify reasons for patient encounters
*Procedure Codes* classify medical services provided to patients

**Claim Preparation**
combining all (payer; provider; patient;) info collected during visit into claim

**Claim Scrubbing**
rule engine compares claim data to known payer guidelines

*Rules Engine*
store standard formatting requirements for claim creation
store validation rules based on collected payer knowledge
during claim scrubbing

**Claim Action**
while claim scrubbing
various attributes of claim trigger rules
might change claim status to hold (or some sort of hold)
claim can be re-scrubbed after resolving claim action issues

*Rules*
check claims for known points of failure
can be triggered by any claim data

*Claim Status*
alert customers that something on the claim needs to be reviewed
recommendations to fix the errors will be provided

**Claim Submission**
submit claim to payer once any errors are fixed

**Clearing House**
intermediaries for electronic connections for claim submission

**Claim Rejection**
by clearing house or payer prior to adjudication
