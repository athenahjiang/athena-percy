# Eligibility Track
an American National Standards Institute (ANSI) standard electronic format
a transaction set consisting of an Inquiry (270) and a Response (271)

## request (270)
obtain validation of coverage from a patient insurance

**handlers**
*payers* direct connections to the payers and receive information from payers' databases
*clearing house* connections to multiple payers and handles the eligibility check on behalf of the payers
*manual* in case payer doesn't support 270/271 or the provider doesn't register with the payer

## response (271)
eligibility status (result & benefits) for coverage in the patient insurance

## trigger criteria
upcoming appointments (nightly sweeps and/or short-notice sweeps)
new patient insurance policies provided
change to an existing patient insurance policy
claim creation
manually started view quickview
requeue-msg 6.4
