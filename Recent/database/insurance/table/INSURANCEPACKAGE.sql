PUBLIC.INSURANCEPACKAGE is a synonym of ATHENA1.INSURANCEPACKAGE.
-- Rows cannot be cancelled
+------------------------------+--------+------+--------+
|Column                        |Type    |Prec. |Null?   |
+------------------------------+--------+------+--------+
|ID                            |NUMBER  |  12.0|Not null|
|CREATED                       |DATE    |   7  |        |
|CREATEDBY                     |VARCHAR2|  20  |        |
|NAME                          |VARCHAR2| 200  |        |
|ADJUDICATIONPROGRAMID         |VARCHAR2|   2  |        |
|FEESCHEDULECATEGORYID         |VARCHAR2|  10  |        |
|INSURANCEREPORTINGCATEGORYID  |NUMBER  |  22.0|        |
|PROVIDERNUMBERCATEGORYID      |VARCHAR2|  10  |        |
|CLAIMRULECATEGORYID           |NUMBER  |  22.0|        |
|ORDERING                      |NUMBER  |  22.0|        |
|COPAYBASE                     |NUMBER  |  22.2|        |
|COPAYPERCENTAGE               |NUMBER  |  22.2|        |
|COPAYCAP                      |NUMBER  |  22.2|        |
|PIGGYBACKYN                   |VARCHAR2|   1  |        |
|CLAIMFORMAT                   |VARCHAR2|  12  |        |
|ADDRESS                       |VARCHAR2| 100  |        |
|ADDRESS2                      |VARCHAR2| 100  |        |
|CITY                          |VARCHAR2|  50  |        |
|STATE                         |VARCHAR2|  10  |        |
|ZIP                           |VARCHAR2|  10  |        |
|CONTACTNAME                   |VARCHAR2|  50  |        |
|PHONE                         |VARCHAR2|  20  |        |
|FAX                           |VARCHAR2|  20  |        |
|STATUS                        |VARCHAR2|  10  |        |
|OTHERID                       |VARCHAR2|  20  |        |
|EMCCODE                       |VARCHAR2|  20  |        |
|EMCRECEIVERTYPE               |VARCHAR2|  20  |        |
|EMCOFFICECODE                 |VARCHAR2|   5  |        |
|NUMPATIENTSWITHTHISINSURANCE  |NUMBER  |  22.0|        |
|INCLUDEINOPTIONS              |VARCHAR2|   1  |        |
|EMCRECEIVERID                 |NUMBER  |  22.0|        |
|MEDIGAP                       |VARCHAR2|  20  |        |
|ACCEPTASSIGNMENTYN            |VARCHAR2|   1  |        |
|NOTES                         |VARCHAR2|2000  |        |
|DELETED                       |DATE    |   7  |        |
|LASTMODIFIED                  |DATE    |   7  |        |
|LASTMODIFIEDBY                |VARCHAR2|  20  |        |
|ELIGIBILITYCLASS              |VARCHAR2|  20  |        |
|SUPPRESSADDRESSYN             |VARCHAR2|   1  |        |
|ALTNAMES                      |VARCHAR2| 100  |        |
|IDNUMBERFORMAT                |VARCHAR2| 200  |        |
|KICKREASONCATEGORYID          |NUMBER  |  22.0|        |
|EXPECTEDDAYSTOEOB             |NUMBER  |  11.0|        |
|PENDINGYN                     |VARCHAR2|   1  |        |
|CHANGEREQUEST                 |VARCHAR2|1000  |        |
|REQUESTEDBYPHONE              |VARCHAR2|  20  |        |
|FIRSTPATIENTID                |NUMBER  |  22.0|        |
|DELETEDBY                     |VARCHAR2|  20  |        |
|BENEFITSPHONE                 |VARCHAR2|  20  |        |
|BILLINGPHONE                  |VARCHAR2|  20  |        |
|OTHERPHONE                    |VARCHAR2| 100  |        |
|ACCEPTPATIENTSYN              |VARCHAR2|   1  |        |
|OLDIDNUMBERFORMAT             |VARCHAR2| 100  |        |
|PROJECTEDCATEGORYID           |NUMBER  |  22.0|        |
|EXPECTEDCATEGORYID            |NUMBER  |  12.0|        |
|NONINSURANCETYPEID            |VARCHAR2|  20  |        |
|IDERRORTEXT                   |VARCHAR2| 500  |        |
|RECEPTIONISTNOTES             |VARCHAR2|1000  |        |
|INSURANCEPRODUCTTYPEID        |VARCHAR2|  10  |        |
|USUALSEQUENCENUMBER           |VARCHAR2|  25  |        |
|CLAIMSUBMISSIONCATEGORYID     |NUMBER  |  12.0|        |
|SOURCEPRACTICEID              |NUMBER  |  22.0|        |
|CONTEXTID                     |NUMBER  |      |        |
|COINSURANCEYN                 |VARCHAR2|   1  |        |
|PRINTZERODOLLARCHARGESYN      |VARCHAR2|   1  |        |
|REFERRALCLASS                 |VARCHAR2|  20  |        |
|REFERRALRULECATEGORYID        |NUMBER  |      |        |
|CSICLASS                      |VARCHAR2|  20  |        |
|ALLOWABLECATEGORYID           |NUMBER  |  12.0|        |
|APPEALSADDRESS                |VARCHAR2|  50  |        |
|APPEALSADDRESS2               |VARCHAR2|  50  |        |
|APPEALSCITY                   |VARCHAR2|  50  |        |
|APPEALSSTATE                  |VARCHAR2|   2  |        |
|APPEALSZIP                    |VARCHAR2|  10  |        |
|APPEALSCONTACTNAME            |VARCHAR2|  50  |        |
|APPEALSPHONE                  |VARCHAR2|  20  |        |
|APPEALSFAX                    |VARCHAR2|  20  |        |
|AUTOASSIGNONLYYN              |VARCHAR2|   1  |        |
|PICKERSERVICECLASS            |VARCHAR2|  30  |        |
|INSURANCENETWORKCATEGORYID    |NUMBER  |  12.0|        |
|COUNTRY                       |VARCHAR2|  20  |        |
|ALLOWADDRESSOVERRIDEYN        |VARCHAR2|   1  |        |
|COUNTRYID                     |NUMBER  |  12.0|        |
|NOATHENAFOLLOWUPYN            |VARCHAR2|   1  |        |
|INSURANCEPACKAGEMASSUPDATEID  |NUMBER  |  12.0|        |
|ORIGINALREQUESTBY             |VARCHAR2|  20  |        |
|ORIGINALREQUESTDATE           |DATE    |   7  |        |
|CMSPLANID                     |VARCHAR2|  80  |        |
|INSURANCETYPEID               |VARCHAR2|  20  |        |
|CURRENTLYMAPPEDTOID           |NUMBER  |  12.0|        |
|GENERATETRACELETTERSYN        |VARCHAR2|   1  |        |
|ANSICLAIMFILINGINDICATORID    |NUMBER  |  12.0|        |
|EFFECTIVEDATE                 |DATE    |   7  |        |
|EXPIRATIONDATE                |DATE    |   7  |        |
|INVALIDIDNUMBERFORMAT         |VARCHAR2| 200  |        |
|WEBSITE                       |VARCHAR2| 100  |        |
|ENROLLMENTCATEGORYID          |NUMBER  |  12.0|        |
|APPEALSNAME                   |VARCHAR2|  50  |        |
|APPEALSATTENTION              |VARCHAR2|  50  |        |
|APPEALSCOUNTRYID              |NUMBER  |  12.0|        |
|GOVERNMENTFUNDEDYN            |VARCHAR2|   1  |        |
|ROUTINGPROGRAMID              |NUMBER  |  12.0|        |
|CSICLASSID                    |NUMBER  |  12.0|        |
|ATTENTION                     |VARCHAR2| 100  |        |
|ATTACHMENTFAX                 |VARCHAR2|  20  |        |
|APPEALSATTACHMENTFAX          |VARCHAR2|  20  |        |
|STANDALONECLINICALSYN         |VARCHAR2|   1  |        |
|SENDPATIENTASSUBSCRIBERYN     |VARCHAR2|   1  |        |
|HSRCLASSID                    |NUMBER  |  12.0|        |
|PARENTINSURANCEPACKAGEID      |NUMBER  |  12.0|        |
|COORDINATORINSURANCECATEGORYID|NUMBER  |  12.0|        |
|CHECKMEDICALNECESSITYYN       |VARCHAR2|   1  |        |
|STANDALONECOORDINATORYN       |VARCHAR2|   1  |        |
|INVOICECOVERSHEETYN           |VARCHAR2|   1  |        |
|INVOICESUBMITOVERDUEYN        |VARCHAR2|   1  |        |
|INVOICESUBMITCORRECTEDYN      |VARCHAR2|   1  |        |
|INVOICEOVERDUEDAYS            |NUMBER  |   3.0|        |
|INVOICESENDVIAEMAILYN         |VARCHAR2|   1  |        |
|INVOICEEMAILADDRESS           |VARCHAR2|1000  |        |
|INVOICESHOWADJUSTMENTSYN      |VARCHAR2|   1  |        |
|INVOICECONTACTINFO            |VARCHAR2| 300  |        |
|INVOICEPURCHASEORDERNUMBER    |VARCHAR2|  20  |        |
|PRODUCTTYPEID                 |NUMBER  |  12.0|        |
|GOVERNMENTFUNDEDTYPEID        |NUMBER  |  12.0|        |
|DEFINSURANCEPACKAGEADDRESSID  |NUMBER  |  12.0|        |
|DEFINSURANCEPACKAGEPHONEID    |NUMBER  |  12.0|        |
|STATEOFCOVERAGE               |VARCHAR2|  30  |        |
|REQUESTREASONID               |NUMBER  |  12.0|        |
|FORMERNAME                    |VARCHAR2| 200  |        |
|SUPERPACKAGENAME              |VARCHAR2| 200  |        |
|PACKAGECREATEREASONID         |NUMBER  |  12.0|        |
|PACKAGECREATEREASONNOTES      |VARCHAR2|4000  |        |
|PRACTICENOTES                 |VARCHAR2|2000  |        |
|INVSUBCORRECTEDDATE           |DATE    |   7  |        |
|INVSUBOVERDUEDATE             |DATE    |   7  |        |
+------------------------------+--------+------+--------+

-- Table Joins 
from INSURANCEPACKAGE 
inner join PATIENTINSURANCE on PATIENTINSURANCE.INSURANCEPACKAGEID = INSURANCEPACKAGE.ID
inner join NONINSURANCETYPE on NONINSURANCETYPE.ID = INSURANCEPACKAGE.NONINSURANCETYPEID
