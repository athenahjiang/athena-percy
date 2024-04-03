APPOINTMENT is a table.
+-----------------------------+--------+------+--------+
|Column                       |Type    |Prec. |Null?   |
+-----------------------------+--------+------+--------+
|ID                           |NUMBER  |  12.0|Not null|
|CREATED                      |DATE    |   7  |        |
|CREATEDBY                    |VARCHAR2|  20  |        |
|APPOINTMENTDATE              |DATE    |   7  |Not null|
|STATUS                       |VARCHAR2|   1  |Not null|
|DEPARTMENTID                 |NUMBER  |  12.0|Not null|
|STAFFUSERNAME                |VARCHAR2|  20  |Not null|
|STARTTIME                    |DATE    |   7  |        |
|DURATION                     |NUMBER  |   4.0|        |
|PARENTAPPOINTMENTID          |NUMBER  |  12.0|        |
|PATIENTID                    |NUMBER  |  12.0|        |
|APPOINTMENTTYPEID            |NUMBER  |  12.0|        |
|TEMPLATEAPPOINTMENTTYPEID    |NUMBER  |  12.0|        |
|APPOINTMENTCANCELREASONID    |NUMBER  |  12.0|        |
|CANCELLED                    |DATE    |   7  |        |
|CANCELLEDBY                  |VARCHAR2|  20  |        |
|RESCHEDULED                  |DATE    |   7  |        |
|RESCHEDULEDBY                |VARCHAR2|  20  |        |
|CHECKEDINBY                  |VARCHAR2|  20  |        |
|CHECKINTIME                  |DATE    |   7  |        |
|CHECKOUTTIME                 |DATE    |   7  |        |
|PRIMARYPATIENTINSURANCEID    |NUMBER  |  12.0|        |
|SECONDARYPATIENTINSURANCEID  |NUMBER  |  12.0|        |
|BILLINGSLIPNUMBER            |NUMBER  |  12.0|        |
|PROVIDERID                   |NUMBER  |  12.0|        |
|REFERRINGPROVIDERID          |NUMBER  |  12.0|        |
|REQUIRESAUTH                 |VARCHAR2|   1  |        |
|AUTHTRACKINGNUMBER           |VARCHAR2|  20  |        |
|AUTHNUMBER                   |VARCHAR2|  20  |        |
|BILLINGSLIPVOIDREASON        |VARCHAR2|  10  |        |
|BILLINGNOTES                 |VARCHAR2| 200  |        |
|FROZENYN                     |VARCHAR2|   1  |        |
|DESCRIPTION                  |VARCHAR2| 100  |        |
|LASTMODIFIED                 |DATE    |   7  |        |
|LASTMODIFIEDBY               |VARCHAR2|  20  |        |
|BILLABLEYN                   |VARCHAR2|   1  |        |
|SCHEDULED                    |DATE    |   7  |        |
|SCHEDULEDBY                  |VARCHAR2|  20  |        |
|CLAIMID                      |NUMBER  |  12.0|        |
|NOBILLINGSLIPSIGNOFF         |VARCHAR2|  20  |        |
|NOBILLINGSLIPCANCELREASON    |VARCHAR2|  20  |        |
|PRECERTLEADDAYS              |NUMBER  |  12.0|        |
|REQUIRESCANCELLATIONYN       |VARCHAR2|   1  |        |
|REFERRALAUTHID               |NUMBER  |  12.0|        |
|RELATEDTOEMPLOYMENTYN        |VARCHAR2|   1  |        |
|RELATEDTOAUTOACCIDENTYN      |VARCHAR2|   1  |        |
|RELATEDTOOTHERACCIDENTYN     |VARCHAR2|   1  |        |
|AUTOACCIDENTSTATE            |VARCHAR2|   2  |        |
|TEMPLATEAPPOINTMENTID        |NUMBER  |  12.0|        |
|ANOTHERPARTYRESPONSIBLEYN    |VARCHAR2|   1  |        |
|CHECKEDOUTBY                 |VARCHAR2|  20  |        |
|GROUPCHECKINAPPOINTMENTID    |NUMBER  |  12.0|        |
|SLOTACTIONID                 |NUMBER  |      |        |
|RECURRINGAPPOINTMENTSTUBID   |NUMBER  |  12.0|        |
|FOREIGNAPPOINTMENTID         |VARCHAR2| 200  |        |
|APPOINTMENTCONFIRMATIONID    |NUMBER  |  12.0|        |
|APPOINTMENTSLOTFREEZEREASONID|NUMBER  |  12.0|        |
|STARTCHECKIN                 |DATE    |   7  |        |
|STOPCHECKIN                  |DATE    |   7  |        |
|STOPINTAKE                   |DATE    |   7  |        |
|STOPEXAM                     |DATE    |   7  |        |
|STOPCHECKOUT                 |DATE    |   7  |        |
|STOPSIGNOFF                  |DATE    |   7  |        |
|EPAYMENTCONTRACTID           |NUMBER  |  12.0|        |
|STARTCHECKOUT                |DATE    |   7  |        |
|REFERRALAUTHLASTCHECKED      |DATE    |   7  |        |
|INSTANTAPPOINTMENTYN         |VARCHAR2|   1  |        |
|DEFERINSURANCEYN             |VARCHAR2|   1  |        |
|SUPERVISINGPROVIDERID        |NUMBER  |  12.0|        |
|RESCHEDULEDAPPOINTMENTID     |NUMBER  |  12.0|        |
|ACCIDENTDATE                 |DATE    |   7  |        |
|MSPINSURANCETYPEID           |NUMBER  |  12.0|        |
|TREATMENTSERIESAPPOINTMENTID |NUMBER  |  12.0|        |
|PERSISTENCEYN                |VARCHAR2|   1  |        |
|AIRLOCKYN                    |VARCHAR2|   1  |        |
|MSPINSURANCETYPESETYN        |VARCHAR2|   1  |        |
|STOPINTAKEBY                 |VARCHAR2|  20  |        |
|TERTIARYPATIENTINSURANCEID   |NUMBER  |  12.0|        |
|QUATERNARYPATIENTINSURANCEID |NUMBER  |  12.0|        |
|COVERAGESCANYN               |VARCHAR2|   1  |        |
|OUTSTANDINGP                 |NUMBER  |  12.2|        |
|OUTSTANDINGPCOLLECTED        |NUMBER  |  12.2|        |
|COLLECTIONS                  |NUMBER  |  12.2|        |
|COLLECTIONSCOLLECTED         |NUMBER  |  12.2|        |
|UNAPPLIED                    |NUMBER  |  12.2|        |
|UNAPPLIEDCOLLECTED           |NUMBER  |  12.2|        |
|PAYMENTPLANID                |NUMBER  |  11.0|        |
|PREPAYMENTPLANID             |NUMBER  |  11.0|        |
|OUTSTANDINGPCHOICEID         |NUMBER  |  12.0|        |
|URGENTYN                     |VARCHAR2|   1  |        |
|FAMILYOUTSTANDINGP           |NUMBER  |  12.2|        |
|FAMILYOUTSTANDINGPCOLLECTED  |NUMBER  |  12.2|        |
|FAMILYCOLLECTIONS            |NUMBER  |  12.2|        |
|FAMILYCOLLECTIONSCOLLECTED   |NUMBER  |  12.2|        |
|SICKVISITYN                  |VARCHAR2|   1  |        |
|APPOINTMENTREASONNOTE        |VARCHAR2|4000  |        |
|OUTSTANDINGPCHOICEREASON     |VARCHAR2| 100  |        |
|INITIALEPAYMENTCONTRACTID    |NUMBER  |  12.0|        |
|PATIENTLIABILITYESTIMATE     |NUMBER  |  12.2|        |
|SHOWAPPTTYPENOTEONSCHEDULEYN |VARCHAR2|   1  |        |
|VISITID                      |NUMBER  |  12.0|        |
|SCHEDULINGTEMPLATEID         |NUMBER  |  12.0|        |
|APPTTYPEBLOCKID              |NUMBER  |  12.0|        |
|APPOINTMENTTYPEBLOCKID       |NUMBER  |  12.0|        |
|SUGGESTEDOVERBOOKING         |NUMBER  |  12.0|        |
|ALTERNATIVEPAYMENTMODELID    |NUMBER  |  12.0|        |
|SMARTSLOTYN                  |VARCHAR2|   1  |        |
|FORCEDYN                     |VARCHAR2|   1  |        |
|IDVERIFYOPTOUTREASONID       |NUMBER  |  12.0|        |
+-----------------------------+--------+------+--------+
