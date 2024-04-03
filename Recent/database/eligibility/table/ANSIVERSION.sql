athena432@ptest52 > desc ansiversion;
PUBLIC.ANSIVERSION is a synonym of ATHENA1.ANSIVERSION.
+--------------+--------+-----+--------+
|Column        |Type    |Prec.|Null?   |
+--------------+--------+-----+--------+
|ID            |NUMBER  |12.0 |Not null| -- 1, 2, 3, 21
|NAME          |VARCHAR2|50   |Not null| -- 004010/A, 005010/A
|CREATED       |DATE    | 7   |        | -- Metadata
|CREATEDBY     |VARCHAR2|20   |        | -- Metadata
|DELETED       |DATE    | 7   |        | -- Metadata
|DELETEDBY     |VARCHAR2|20   |        | -- Metadata
|LASTMODIFIED  |DATE    | 7   |        | -- Metadata
|LASTMODIFIEDBY|VARCHAR2|20   |        | -- Metadata
|ORDERING      |NUMBER  |12.0 |        | -- 1, 2, 3, 4
|ELIGIBILITYYN |VARCHAR2| 1   |        |
|CLAIMSTATUSYN |VARCHAR2| 1   |        |
|CLAIMSYN      |VARCHAR2| 1   |        |
+--------------+--------+-----+--------+
