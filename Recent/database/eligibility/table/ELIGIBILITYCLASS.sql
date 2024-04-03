PUBLIC.ELIGIBILITYCLASS is a synonym of ATHENA1.ELIGIBILITYCLASS.
+--------------------------+--------+------+--------+
|Column                    |Type    |Prec. |Null?   |
+--------------------------+--------+------+--------+
|ID                        |VARCHAR2|  50  |Not null| -- Same as NAME
|CREATED                   |DATE    |   7  |        |
|CREATEDBY                 |VARCHAR2|  20  |        |
|NAME                      |VARCHAR2|  20  |        | -- Same as ID
|ELIGIBLEPOSITIVEREGEXP    |VARCHAR2|  30  |        |
|ELIGIBLENEGATIVEREGEXP    |VARCHAR2|  30  |        |
|LASTMODIFIED              |DATE    |   7  |        |
|LASTMODIFIEDBY            |VARCHAR2|  20  |        |
|ORDERING                  |NUMBER  |  12.0|        |
|DELETED                   |DATE    |   7  |        |
|RUNHOUR                   |NUMBER  |  12.0|        |
|NOTE                      |VARCHAR2|4000  |        |
|DELETEDBY                 |VARCHAR2|  20  |        |
|ANSIHEADERID              |NUMBER  |  12.0|        |
|RECEIVERNAME              |VARCHAR2|  30  |        |
|THROTTLINGTCPPROXYID      |NUMBER  |  12.0|        |
|RETRYATTEMPTS             |NUMBER  |  12.0|        |
|RERUNYN                   |VARCHAR2|   1  |        |
|AVAILABILITY              |VARCHAR2|  20  |        |
|AVAILABILITYLASTMODIFIED  |DATE    |   7  |        |
|AVAILABILITYLASTMODIFIEDBY|VARCHAR2|  20  |        |
|CACHETHRESHOLD            |VARCHAR2|  20  |        |
|ANSIVERSIONID             |NUMBER  |  12.0|        |
|SENDPATIENTASSUBSCRIBERYN |VARCHAR2|   1  |        |
|CLASSOVERRIDEYN           |VARCHAR2|   1  |        |
|MEMBERIDOVERWRITEYN       |VARCHAR2|   1  |        |
|DATEOFSERVICEPASTLIMIT    |NUMBER  |  12.0|        |
|DATEOFSERVICEFUTURELIMIT  |NUMBER  |  12.0|        |
|WIZARDELIGCLASSYN         |VARCHAR2|   1  |        |
|ENROLLMENTCATEGORYID      |NUMBER  |  12.0|        |
|GROUPNUMBEROVERWRITEYN    |VARCHAR2|   1  |        |
|INDIRECTYN                |VARCHAR2|   1  |        |
|ISSUEDATEOVERWRITEYN      |VARCHAR2|   1  |        |
|GRACEPERIODYN             |VARCHAR2|   1  |        |
|DEPMEMBERIDOVERWRITEYN    |VARCHAR2|   1  |        |
|DEPGROUPNUMBEROVERWRITEYN |VARCHAR2|   1  |        |
|INTERPRETEBU              |VARCHAR2|  20  |        |
|OTHERPAYERYN              |VARCHAR2|   1  |        |
|SENDGROUPNUMBERYN         |VARCHAR2|   1  |        |
|GENERICINSURANCEPACKAGEID |NUMBER  |  12.0|        |
|SENDSSNASMEMBERIDYN       |VARCHAR2|   1  |        |
|SHOWDEMOGRAPHICDIFFYN     |VARCHAR2|   1  |        |
|PAYERID                   |VARCHAR2|  15  |        |
|SENDMEDICALGROUPYN        |VARCHAR2|   1  |        |
|SENDSSNYN                 |VARCHAR2|   1  |        |
|ALLENROLLMENTSTATUSESYN   |VARCHAR2|   1  |        |
|ALTERNATERECEIVERYN       |VARCHAR2|   1  |        |
|SHOWINSURANCEPLANNAMEYN   |VARCHAR2|   1  |        |
|SENDGROUPIDTOSELFYN       |VARCHAR2|   1  |        |
+--------------------------+--------+------+--------+
