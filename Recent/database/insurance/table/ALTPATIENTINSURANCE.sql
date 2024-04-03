ALTPATIENTINSURANCE is a table.
+------------------------------+--------+------+--------+
|Column                        |Type    |Prec. |Null?   |
+------------------------------+--------+------+--------+
|ID                            |NUMBER  |  12.0|Not null|
|PATIENTID                     |NUMBER  |  12.0|        |
|INSUREDID                     |NUMBER  |  12.0|        |
|RELATIONSHIPTOINSUREDID       |NUMBER  |  12.0|        |
|RELATIONSHIPTOPATIENT         |VARCHAR2|  30  |        |
|INSURANCEPACKAGEID            |NUMBER  |  12.0|        |
|SHORTNAME                     |VARCHAR2|  10  |        |
|POLICYNUMBER                  |VARCHAR2|  30  |        |
|IDNUMBER                      |VARCHAR2|  25  |        |
|REFERRALNUMBER                |VARCHAR2|  25  |        |
|SEQUENCENUMBER                |VARCHAR2|  25  |        |
|ISSUEDATE                     |DATE    |   7  |        |
|EXPIRATIONDATE                |DATE    |   7  |        |
|INSUREDLASTNAME               |VARCHAR2| 100  |        |
|PLCINSUREDLASTNAME            |VARCHAR2| 100  |        |
|INSUREDFIRSTNAME              |VARCHAR2|  35  |        |
|PLCINSUREDFIRSTNAME           |VARCHAR2|  35  |        |
|INSUREDMIDDLEINITIAL          |VARCHAR2|  25  |        |
|PLCINSUREDMIDDLEINITIAL       |VARCHAR2|  25  |        |
|INSUREDSEX                    |VARCHAR2|   1  |        |
|INSUREDDOB                    |DATE    |   7  |        |
|INSUREDSSN                    |VARCHAR2|   9  |        |
|INSUREDADDRESS                |VARCHAR2| 100  |        |
|PLCINSUREDADDRESS             |VARCHAR2| 100  |        |
|INSUREDZIP                    |VARCHAR2|  10  |        |
|INSUREDSTATE                  |VARCHAR2|  10  |        |
|INSUREDHOMEPHONE              |VARCHAR2|  20  |        |
|CANCELLED                     |DATE    |   7  |        |
|CANCELLEDBY                   |VARCHAR2|  20  |        |
|INSURANCENAME                 |VARCHAR2|  80  |        |
|INSURANCECOPAY                |NUMBER  |  12.0|        |
|INSURANCEADDRESS              |VARCHAR2| 100  |        |
|INSURANCECITY                 |VARCHAR2|  50  |        |
|INSURANCESTATE                |VARCHAR2|   2  |        |
|INSURANCEZIP                  |VARCHAR2|  10  |        |
|INSURANCECONTACTNAME          |VARCHAR2|  50  |        |
|INSURANCEPHONE                |VARCHAR2|  20  |        |
|DEFINSURANCEPACKAGEADDRESSID  |NUMBER  |  12.0|        |
|DELETED                       |DATE    |   7  |        |
|ELIGIBILITYMESSAGE            |VARCHAR2|  20  |        |
|VERIFICATIONNOTE              |VARCHAR2|4000  |        |
|NOTES                         |VARCHAR2|1000  |        |
|COPAY                         |NUMBER  |  12.2|        |
|ELIGIBLEYN                    |VARCHAR2|   1  |        |
|ELIGIBILITYREASONID           |VARCHAR2|  20  |        |
|ORIGINALPATIENTINSURANCEID    |NUMBER  |  12.0|        |
|OLDINSURANCEPACKAGEID         |NUMBER  |  12.0|        |
|DELETEDNOTE                   |VARCHAR2| 400  |        |
|DEFAULTPACKAGEYN              |VARCHAR2|   1  |        |
|ELIGIBILITYLASTCHECKED        |DATE    |   7  |        |
|ELIGIBILITYLASTCHECKEDBY      |VARCHAR2|  20  |        |
|COPAYSOURCE                   |VARCHAR2| 100  |        |
|INSUREDEMPLOYERNAME           |VARCHAR2|  30  |        |
|VERIFICATIONNOTELONG          |VARCHAR2|4000  |        |
|EMPLOYERID                    |NUMBER  |      |        |
|ENTERPRISEID                  |NUMBER  |  12.0|        |
|PENDINGINSURANCEPACKAGEID     |VARCHAR2|  22  |        |
|COINSURANCEPERCENT            |NUMBER  |  11.2|        |
|REFERRINGPROVIDERID           |NUMBER  |      |        |
|INSURANCEPRODUCTCODE          |VARCHAR2|  20  |        |
|GATEKEEPERFLAGYN              |VARCHAR2|   1  |        |
|INSURANCENETWORKCATEGORYID    |NUMBER  |      |        |
|PCPNAME                       |VARCHAR2| 150  |        |
|PCPPROVIDERNUMBER             |VARCHAR2|  30  |        |
|CASEINJURYDATE                |DATE    |   7  |        |
|INSURANCEOVERRIDEADDRESS      |VARCHAR2|  50  |        |
|INSURANCEOVERRIDEADDRESS2     |VARCHAR2|  50  |        |
|INSURANCEOVERRIDECITY         |VARCHAR2|  50  |        |
|INSURANCEOVERRIDESTATE        |VARCHAR2|   2  |        |
|INSURANCEOVERRIDEZIP          |VARCHAR2|  10  |        |
|INSURANCEOVERRIDECONTACTNAME  |VARCHAR2|  50  |        |
|INSURANCEOVERRIDECOUNTRY      |VARCHAR2|  50  |        |
|INSURANCEOVERRIDEPHONE        |VARCHAR2|  20  |        |
|INSURANCEOVERRIDENAME         |VARCHAR2| 200  |        |
|PAYMENTPLANID                 |NUMBER  |  11.0|        |
|RELATEDTOEMPLOYMENTYN         |VARCHAR2|   1  |        |
|RELATEDTOAUTOACCIDENTYN       |VARCHAR2|   1  |        |
|RELATEDTOOTHERACCIDENTYN      |VARCHAR2|   1  |        |
|AUTOACCIDENTSTATE             |VARCHAR2|   2  |        |
|WORKCOMPSTATE                 |VARCHAR2|   2  |        |
|ACCIDENTDATE                  |DATE    |   7  |        |
|CASENUMBER                    |VARCHAR2|  25  |        |
|WCBNUMBER                     |VARCHAR2|  30  |        |
|INJUREDBODYPART               |VARCHAR2|  20  |        |
|INJURYDESCRIPTION             |VARCHAR2|4000  |        |
|ADJUSTERLASTNAME              |VARCHAR2|  30  |        |
|PLCADJUSTERLASTNAME           |VARCHAR2|  30  |        |
|ADJUSTERFIRSTNAME             |VARCHAR2|  30  |        |
|PLCADJUSTERFIRSTNAME          |VARCHAR2|  30  |        |
|ADJUSTERPHONE                 |VARCHAR2|  50  |        |
|ADJUSTERFAX                   |VARCHAR2|  50  |        |
|INSUREDCOUNTRYID              |NUMBER  |  12.0|        |
|INSUREDCITY                   |VARCHAR2|  30  |        |
|PLCINSUREDCITY                |VARCHAR2|  30  |        |
|PATIENTENTERPRISEID           |NUMBER  |  12.0|        |
|INSUREDNAMESUFFIX             |VARCHAR2|  10  |        |
|INSUREDADDRESS2               |VARCHAR2| 100  |        |
|PLCINSUREDADDRESS2            |VARCHAR2| 100  |        |
|INSUREDHIPAAID                |VARCHAR2|  80  |        |
|INSUREDENTITYTYPEID           |NUMBER  |  22.0|        |
|PRIMARYCAREPROVIDERID         |NUMBER  |  12.0|        |
|ANOTHERPARTYRESPONSIBLEYN     |VARCHAR2|   1  |        |
|REPRICERNAME                  |VARCHAR2| 100  |        |
|REPRICERPHONE                 |VARCHAR2|  50  |        |
|MSPINSURANCETYPEID            |NUMBER  |  12.0|        |
|MSPINSURANCETYPESETYN         |VARCHAR2|   1  |        |
|SLIDINGFEEPROGRAMID           |NUMBER  |  12.0|        |
|SLIDINGFEEPLANID              |NUMBER  |  12.0|        |
|DIAGNOSISCODES                |VARCHAR2| 100  |        |
|DIAGNOSISCODESICD10           |VARCHAR2| 100  |        |
|INSURANCEPRODUCTTYPEID        |VARCHAR2|  10  |        |
|INSUREDIDNUMBER               |VARCHAR2|  25  |        |
|ELIGIBILITYTRACKID            |NUMBER  |  12.0|        |
|INTERFACEVENDORID             |VARCHAR2| 255  |        |
|FOREIGNID                     |VARCHAR2|2000  |        |
|FOREIGNINSURANCEPACKAGENAME   |VARCHAR2| 100  |        |
|FOREIGNINSURANCEPACKAGECODE   |VARCHAR2|  50  |        |
|FOREIGNINSURANCEPACKAGEADDRESS|VARCHAR2| 200  |        |
|FOREIGNINSURANCEPACKAGECITY   |VARCHAR2|  50  |        |
|FOREIGNINSURANCEPACKAGESTATE  |VARCHAR2|   2  |        |
|FOREIGNINSURANCEPACKAGEZIP    |VARCHAR2|  10  |        |
|FOREIGNINSURANCEPACKAGEPHONE  |VARCHAR2|  20  |        |
|SOURCEERARECORDID             |NUMBER  |  12.0|        |
|ELIGIBILITYUPDATEREASON       |VARCHAR2|  30  |        |
|ELIGIBILITYUPDATETIMESTAMP    |DATE    |   7  |        |
|UPDATEELIGIBILITYTRACKID      |NUMBER  |  12.0|        |
|ELIGIBILITYSERVICEDATE        |DATE    |   7  |        |
|HEALTHEXCHANGETYPEID          |NUMBER  |  12.0|        |
|HASCASENUMBERYN               |VARCHAR2|   1  |        |
|PATIENTINSURANCEID            |NUMBER  |  12.0|        |
|ALTPATIENTID                  |NUMBER  |  12.0|        |
|SOURCE                        |VARCHAR2|  20  |Not null|
|LASTRECONCILED                |DATE    |   7  |        |
|CREATED                       |DATE    |   7  |        |
|CREATEDBY                     |VARCHAR2|  20  |        |
|LASTMODIFIED                  |DATE    |   7  |        |
|LASTMODIFIEDBY                |VARCHAR2|  20  |        |
+------------------------------+--------+------+--------+
