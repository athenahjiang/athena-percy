ELIGIBILITYADDITIONALINFO is a table.
-- Rows cannot be deleted
+--------------------+--------+-----+--------+
|Column              |Type    |Prec.|Null?   |
+--------------------+--------+-----+--------+
|ID                  |NUMBER  | 12.0|Not null|
|CREATED             |DATE    |  7  |        |
|CREATEDBY           |VARCHAR2| 20  |        |
|ELIGIBILITYBENEFITID|NUMBER  | 12.0|Not null|
|CODEQUALIFIER       |VARCHAR2|  3  |        | -- Always 'ZZ'?
|CODE                |VARCHAR2| 30  |        | -- Place of service?
|CODECATEGORY        |VARCHAR2|  3  |        | -- Always null?
|DESCRIPTION         |VARCHAR2|264  |        | -- Always null?
|LASTMODIFIED        |DATE    |  7  |        |
|LASTMODIFIEDBY      |VARCHAR2| 20  |        |
+--------------------+--------+-----+--------+

/* Common Cols */
ADDITIONALINFO.CODE

/* Table Joins */
from
ELIGIBILITYADDITIONALINFO ADDITIONALINFO

/* Where Args */
ADDITIONALINFO.CODE in ()
