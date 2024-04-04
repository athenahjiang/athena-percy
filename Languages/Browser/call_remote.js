// sample
globalThis.CallRemote({ SUB: "BusCall::PatientDemographics::GetPatient", ARGS: { PATIENTID: 1561424, RETURNASHASH: 1 }, ONFINISH: (response) => console.log(response), ONERROR: (response) => console.error(response) });
globalThis.CallRemote({ SUB: "BusCall::EPayment::GetSelfServicePaymentPlanTiers", ARGS: {}, ONFINISH: (response) => console.log(response), ONERROR: (response) => console.error(response) });

// recent user data
globalThis.CallRemote({ SUB: "BusCall::Eligibility::SetUserPreference", ARGS: {"KEY":"ELIGIBILITY_FAVORITE_STCCODE","VALUE":"[{\"code\":\"30\",\"isFavorite\":true,\"ordering\":1}]","USERNAME":"pjiang4"}, ONFINISH: (response) => console.log(response), ONERROR: (response) => console.error(response) });
globalThis.CallRemote({ SUB: "BusCall::Eligibility::SetUserPreference", ARGS: {"KEY":"COLLECTOR.ELIGIBILITY_ATTRIBUTES","VALUE":"{\"eligibilityDisplayPage\":\"newEligPage\"}","USERNAME":"pjiang4"}, ONFINISH: (response) => console.log(response), ONERROR: (response) => console.error(response) });
globalThis.CallRemote({ SUB: "BusCall::Eligibility::SetUserPreference", ARGS: {"KEY":"COLLECTOR.ELIGIBILITY_ATTRIBUTES","VALUE":"{\"eligibilityDisplayPage\":\"legacyEligPage\"}","USERNAME":"pjiang4"}, ONFINISH: (response) => console.log(response), ONERROR: (response) => console.error(response) });
