ELIGIBILITYBENEFIT is a table.
-- Rows cannot be deleted
+------------------+--------+-----+--------+
|Column            |Type    |Prec.|Null?   |
+------------------+--------+-----+--------+
|ID                |NUMBER  | 12.0|Not null|
|CREATED           |DATE    |  7  |        |
|CREATEDBY         |VARCHAR2| 20  |        |
|ELIGIBILITYTRACKID|NUMBER  | 12.0|Not null|
|BENEFITINFO       |VARCHAR2|  3  |        | -- EB01: Eligibility Benefit Inf
|COVERAGELEVEL     |VARCHAR2|  3  |        | -- EB02: Coverage Level Code
|SERVICETYPECODE   |VARCHAR2|300  |        | -- EB03: Service Type Code
|INSURANCETYPE     |VARCHAR2|  3  |        | -- EB04: Insurance Type Code
|PLANCOVERAGEDESC  |VARCHAR2| 50  |        | -- EB05: Plan Coverage Description
|TIMEPERIODTYPE    |VARCHAR2|  3  |        | -- EB06: Time Period Qualifier
|MONETARYAMOUNT    |VARCHAR2| 18  |        | -- EB07: Monetary Amount
|PERCENTAGE        |VARCHAR2| 10  |        | -- EB08: Percent
|QUANTITYTYPE      |VARCHAR2|  3  |        | -- EB09: Quantity Qualifier
|QUANTITY          |VARCHAR2| 15  |        | -- EB10: Quantity
|AUTHORIZATIONREQ  |VARCHAR2|  1  |        | -- EB11: Yes/No Cond Resp Code
|PLANNETWORK       |VARCHAR2|  1  |        | -- EB12: Yes/No Cond Resp Code
|MEDICALPROCEDURE  |VARCHAR2|200  |        | -- EB13: Comp. Med Proced. ID
|DIAGNOSIS         |VARCHAR2|  8  |        | -- EB14: Comp. Diag. Code Code Point.
|LASTMODIFIED      |DATE    |  7  |        |
|LASTMODIFIEDBY    |VARCHAR2| 20  |        |
+------------------+--------+-----+--------+
