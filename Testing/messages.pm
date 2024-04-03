# generic eligibility messages
%Message = (
 1   => q{<b class='successtext'>Member is eligible.</b>},
 2   => q{<b><font color=red>Member is ineligible.</font></b> Patient found on payor's files, but not covered on date of inquiry.},
 2.1 => q{This member could not be found in the payer's files. Please verify coverage and all member demographic information.},
 2.2 => q{Insurance package review needed.},
 3   => q{Could not determine eligibility. Please call the insurance company to verify eligibility or try again later.},
 3.1 => q{Could not determine eligibility. Please call the insurance company to verify eligibility or try again later.},
 # 3.1 is when we get a bad response back from an ANSI997
 3.2 => q{Could not determine eligibility because the member has multiple policies with the same ID for this payer. Please try entering the member's group if it isn't already on the policy and resubmit the check. Otherwise, the member needs to contact the payer to resolve this issue.},
 # 3.3 is for when there is an error connecting to the proxy channel, or the
 # proxy channel's response couldn't be understood by the Eligibility code
 3.3 => q{Could not determine eligibility. Please call the insurance company to verify eligibility or try again later.},
 # 3.4 is for when a user marks and eligibility result as ineligible
 3.4 => q{Invalid eligbility response.},
 4   => q{Per the payer, the provider is not authorized to make eligibility inquiries. Please contact the payer to verify eligibility.},
 5   => q{Electronic eligibility checking is not available for the provider due to an enrollment or credentialing issue. Please call the payer to verify eligibility.},
 # 5.1 is an enrollment problem reported by the clearinghouse
 5.1 => q{Per the payer, the provider is not authorized to make eligibility inquiries. Please contact the payer to verify eligibility.},
 # 5.2 is an enrollment problem reported by the payor
 5.2 => q{Per the payer, the provider is not authorized to make eligibility inquiries. Please contact the payer to verify eligibility.},
 5.3 => q{Electronic eligibility checking is not available for the provider due to an enrollment or credentialing issue. Please call the payer to verify eligibility.},
 5.4 => q{Electronic eligibility checking is not available for the provider due to an enrollment or credentialing issue. Please call the payer to verify eligibility.},
 5.5 => q{Electronic eligibility checking is not available for the provider due to an enrollment or credentialing issue. Please call the payer to verify eligibility.},
 5.6 => q{Electronic eligibility checking is not available for the provider due to an enrollment or credentialing issue. Please call the payer to verify eligibility.},
 6   => q{Eligibility cannot be verified due to incorrect member demographic information. Please confirm all information is accurate with both the member and the payer and resubmit.},
 6.1 => q{The date of service is outside the payer's allowable inquiry period.},
 6.2 => q{The date of service is outside the payer's allowable inquiry period.},
 6.3 => q{The member's DOB does not match the payer's file. Please confirm the DOB with the member and payer and resubmit.},
 6.4 => q{The member ID does not match the payer's file. Please confirm the member ID with the member and the payer and resubmit.},
 6.5 => q{The member's name does not match the payer's file. Please confirm the correct spelling with the member and payer and resubmit.},
 6.6 => q{The member's gender does not match the payer's file. Please confirm the gender with the member and the payer and resubmit.},
 6.7 => q{The member ID does not include the alpha prefix. This payer requires the correct alpha prefix on all ID numbers. Please correct and resubmit.},
 6.8 => q{The member's Social Security number is missing. Please update the information and resubmit.},
 6.9 => q{The patient's relationship to policy holder should be set to "Self" for this payer. Please correct and resubmit.},
 6.11 => q{Electronic eligibility information is not provided for this plan by the payer's eligibility system. Please call the payer to verify eligiblity.},
 6.12 => q{No Eligibility Status Returned. Please view benefit details for more information.},
 6.13 => q{Electronic eligibility information is not provided for this plan by the payer's eligibility system. Please call the payer to verify eligiblity.},
 6.14 => q{Electronic eligibility information is not provided for this plan by the payer's eligibility system. Please go to the View Detail page for the member's managed care organization information.},
 6.15 => q{The member ID does not match the expected format for the selected package and/or payer. Please confirm package selection and the member ID and resubmit.},
 7   => q{The payer is currently unavailable. Please try again later.},
 # 7.1 is for when the payor does not respond to the clearinghouse
 7.1 => q{The payer is currently unavailable. Please try again later.},
 # 7.2 is a "your call is important to us... please continue to hold..."
 7.2 => q{The payor has indicated a delay in processing this eligibility request. Please check this account later for updated eligibility information},
 # 7.3 is used when an eligibilitytrack row in state 'C' has been stopped from being sent as the eligibility is up to date
 7.3 => q{The payer did not respond to the eligibility request. Please click "Perform eligibility check" from the Patient Quickview.},
 # 7.4 is used for an eligibilitytrack row in state 'C' that has not received
 # a response in the 12-hour period following its creation
 7.4 => q{The payer did not respond to the eligibility request. Please click "Perform eligibility check" from the Patient Quickview.},
 7.5 => q{Could not determine eligibility. Please call the payer to verify eligibility or try again later.},
 7.6 => q{The maximum daily number of eligibility inquires for this patient has been reached, please wait 24 hours before resubmitting},
 # 8 is used, primarily, for a null eligibilityclass
 8   => q{Electronic eligibility information is not provided for this plan by the payer's eligibility system. Please call the payer to verify eligiblity.},
 # 8.1 is used only for the -NONE- class
 8.1 => q{Electronic eligibility information is not provided for this plan by the payer's eligibility system. Please call the payer to verify eligiblity.},
 # 9 is used for cases where there SHOULD be elig coverage, but for some reason, there isn't
 9   => q{Electronic eligibility information is not provided for this plan by the payer's eligibility system. Please call the payer to verify eligiblity.},
 10  => q{Electronic eligibility could not be completed because this patient has no rendering or usual provider assigned. Please call the insurance company to verify eligibility.},
 11  => q{Medicare, BCBS_SC and TRICARE eligibility can only be checked from production! They lock us out if we make a mistake. For more information, talk to an eligibility developer.},
 12  => q{Electronic eligibility status not available. This is due to missing patient information such as the Member ID, Patient Name, DOB, and SSN. Please check that this information is accurate, update the patient's records, and resubmit request. If this message persists, please call the insurance company to verify eligibility.},
 # 13 is for a suspected PHI violation
 13  => q{Eligibility cannot be verified due to incorrect member demographic information. Please confirm all information is accurate with both the member and the payer and resubmit.},
 13.1 => q{The payer indicated that this patient is eligible; however, due to demographic diffs, we consider this patient ineligible.},
 14  => q{Eligibility cannot be verified due to incorrect member demographic information. Please confirm all information is accurate with both the member and the payer and resubmit.},
 EBLACKOUT => q{The payor has indicated that it is currently unavailable for eligibility transactions due to scheduled downtime or other outage event.},
);
