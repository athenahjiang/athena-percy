ELIGIBILITYTRACK is a table.
+---------------------------+--------+------+--------+
|Column                     |Type    |Prec. |Null?   |
+---------------------------+--------+------+--------+
|ID                         |NUMBER  |  12.0|Not null|
|ORIGINALID                 |NUMBER  |  12.0|        |
|STATE                      |VARCHAR2|   1  |        |
|ATTEMPTSREMAINING          |NUMBER  |      |        |
|ELIGIBILITYCLASS           |VARCHAR2|  50  |        |
|RECEIVERNAME               |VARCHAR2|  20  |        |
|PATIENTINSURANCEID         |NUMBER  |  12.0|        |
|ALTPATIENTINSURANCEID      |NUMBER  |  12.0|        |
|DOCUMENTINSURANCEID        |NUMBER  |  12.0|        |
|PATIENTID                  |NUMBER  |  12.0|        |
|ALTPATIENTID               |NUMBER  |  12.0|        |
|INFORMATIONTYPE            |VARCHAR2|  20  |        | -- MEDICAL | PHARMACY
|PROVIDERID                 |NUMBER  |  12.0|        |
|REFERENCEKEY               |VARCHAR2|  40  |        |
|TRANSACTIONYN              |VARCHAR2|  40  |        |
|INQUIRYREASON              |VARCHAR2|  20  |        | -- USER-REQUESTED (for manual check)
|OUTGOINGTRANSACTION        |CLOB    |4000  |        |
|OUTGOINGTRANSACTIONDATE    |DATE    |   7  |        |
|INCOMINGTRANSACTION        |CLOB    |4000  |        |
|INCOMINGTRANSACTIONDATE    |DATE    |   7  |        |
|ACKNOWLEDGEMENT            |CLOB    |4000  |        |
|ACKNOWLEDGEMENTDATE        |DATE    |   7  |        |
|MESSAGERESULT              |VARCHAR2|  20  |        |
|SYNCHRONOUSYN              |CHAR    |   1  |        |
|VERIFICATIONNOTE           |VARCHAR2|4000  |        |
|ELIGIBILITYWARNING         |VARCHAR2|4000  |        |
|DEBUG                      |CLOB    |4000  |        |
|FULLOUTGOINGDATA           |CLOB    |4000  |        |
|FULLINCOMINGDATA           |CLOB    |4000  |        |
|ELAPSEDTIME                |NUMBER  |  12.3|        |
|TESTYN                     |VARCHAR2|   1  |        |
|USERNAME                   |VARCHAR2|  20  |Not null| -- Athena User
|DEPARTMENTID               |NUMBER  |  12.0|        |
|APPOINTMENTID              |NUMBER  |  12.0|        |
|INSURANCEPACKAGEID         |NUMBER  |  12.0|        |
|IDNUMBER                   |VARCHAR2|  25  |        |
|POLICYNUMBER               |VARCHAR2|  30  |        |
|RELATIONSHIPTOINSUREDID    |NUMBER  |  12.0|        |
|DATEOFSERVICE              |DATE    |   7  |        |
|INFORMATIONSOURCENAME      |VARCHAR2|  60  |        |
|PCPNAME                    |VARCHAR2|  50  |        |
|OUTGOINGANSIVERSIONID      |NUMBER  |  12.0|        |
|INCOMINGANSIVERSIONID      |NUMBER  |  12.0|        |
|ELIGIBILITYSEARCHCRITERIAID|NUMBER  |  12.0|        |
|CREATED                    |DATE    |   7  |        |
|CREATEDBY                  |VARCHAR2|  20  |        |
|LASTMODIFIED               |DATE    |   7  |        |
|LASTMODIFIEDBY             |VARCHAR2|  20  |        |
|ENROLLMENTPERIODID         |NUMBER  |  12.0|        |
|PROVIDERSOURCE             |VARCHAR2|  30  |        |
|NPITYPE                    |VARCHAR2|  30  |        |
|ITERATIVEMESSAGEMAPID      |NUMBER  |  12.0|        |
|SERVICETYPECODE            |VARCHAR2| 300  |        |
|ISSUECATEGORY              |VARCHAR2|  50  |        |
|PARENTELIGIBILITYTRACKID   |NUMBER  |  12.0|        |
|ELIGIBILITYBATCHID         |NUMBER  |  12.0|        |
|RULELOCATION               |VARCHAR2|  10  |        |
|RULEID                     |NUMBER  |  12.0|        |
|PATIENTMATCHSCORE          |NUMBER  |   4.2|        |
|ELIGIBLERESULT             |VARCHAR2|   1  |        |
|UNVERIFIED                 |VARCHAR2|   1  |        |
|INCORRECTPACKAGE           |VARCHAR2|   1  |        |
|DEMOGRAPHICMISMATCH        |VARCHAR2|  50  |        |
|HIXGRACEPERIOD             |VARCHAR2|   1  |        |
|INCORRECTPATIENTPHI        |VARCHAR2|   1  |        |
|EDIBATCHID                 |NUMBER  |  12.0|        |
|LIMITEDCOVERAGEYN          |VARCHAR2|   1  |        |
|CACHEDELIGIBILITYTRACKID   |NUMBER  |  12.0|        |
|OTHERPAYERFLAG             |VARCHAR2|   1  |        |
|USECACHINGLOGICFLAG        |VARCHAR2|   1  |        |
|ELIGIBLEINSTITUTIONALFLAG  |VARCHAR2|   1  |        |
|INSURANCEPRODUCTTYPECODE   |VARCHAR2|  12  |        |
|NPI                        |VARCHAR2|  30  |        |
+---------------------------+--------+------+--------+

-- Table Joins 
from ELIGIBILITYTRACK TRACK

-- one to many
inner join ELIGIBILITYBENEFIT BENEFIT on BENEFIT.ELIGIBILITYTRACKID = TRACK.ID

-- many to one
inner join PATIENTINSURANCE on PATIENTINSURANCE.PATIENTID = TRACK.PATIENTID
inner join PROVIDER on PROVIDER.ID = TRACK.PROVIDERID
