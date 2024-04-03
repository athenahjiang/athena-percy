FEESCHEDULE is a table.
+-----------------------------+--------+------+--------+
|Column                       |Type    |Prec. |Null?   |
+-----------------------------+--------+------+--------+
|ID                           |NUMBER  |  12.0|Not null|
|CREATED                      |DATE    |   7  |        |
|CREATEDBY                    |VARCHAR2|  20  |        |
|LASTMODIFIED                 |DATE    |   7  |        |
|LASTMODIFIEDBY               |VARCHAR2|  20  |        |
|NAME                         |VARCHAR2|  35  |        |
|NOTES                        |VARCHAR2|4000  |        |
|EFFECTIVEDATE                |DATE    |   7  |        |
|EXPIRATIONDATE               |DATE    |   7  |        |
|DELETED                      |DATE    |   7  |        |
|AUTOTRACKALLOWABLEYN         |VARCHAR2|   1  |        |
|TYPE                         |VARCHAR2|  20  |        |
|AUTOWRITEDOWNCONTRACTUALFLAG |VARCHAR2|   1  |        |
|INSURANCEREPORTINGCATEGORYID |NUMBER  |  12.0|        |
|INSURANCEPACKAGEID           |NUMBER  |  12.0|        | -- always null?
|DELETEDBY                    |VARCHAR2|  20  |        |
|USEMEDICAREYN                |VARCHAR2|   1  |        |
|MEDICARERATIO                |NUMBER  |  12.2|        |
|MEDICARESCHEDULEDATE         |DATE    |   7  |        |
|MEDICAREGPCILOCATIONID       |NUMBER  |  12.0|        |
|MEDICAREFACILITYSCHEDULEYN   |VARCHAR2|   1  |        |
|MEDICAREPARTICIPATINGYN      |VARCHAR2|   1  |        |
|MEDICAREACCEPTASSIGNMENTYN   |VARCHAR2|   1  |        |
|MEDICAREDMERATIO             |NUMBER  |  12.2|        |
|MEDICAREDMESTATE             |VARCHAR2|   2  |        |
|MEDICAREDMESCHEDULEDATE      |DATE    |   7  |        |
|MEDICAREDMEPARTICIPATINGYN   |VARCHAR2|   1  |        |
|MEDICAREDMEACCEPTASSIGNMENTYN|VARCHAR2|   1  |        |
|PROVIDERSELECTTYPE           |VARCHAR2|  20  |        |
|ALLOWABLECATEGORYSELECTTYPE  |VARCHAR2|  30  |        |
|EVERGREENDAYS                |NUMBER  |   3.0|        |
|MEDICARERVUCONVERSIONFACTOR  |NUMBER  |  14.4|        |
|WORKCOMPSTATE                |VARCHAR2|   2  |        |
|HASPROVIDERFILTERYN          |VARCHAR2|   1  |        |
|HASSPECIALTYFILTERYN         |VARCHAR2|   1  |        |
|HASDEPARTMENTFILTERYN        |VARCHAR2|   1  |        |
|HASMEDICALGROUPFILTERYN      |VARCHAR2|   1  |        |
|HASALLOWABLECATEGORYFILTERYN |VARCHAR2|   1  |        |
|HASLOCALALLOWABLECATFILTERYN |VARCHAR2|   1  |        |
|HASPROVIDERTYPEFILTERYN      |VARCHAR2|   1  |        |
|HOSPITALYN                   |VARCHAR2|   1  |        |
|AUTOWRITEUPCONTRACTUALFLAG   |VARCHAR2|   1  |        |
+-----------------------------+--------+------+--------+
