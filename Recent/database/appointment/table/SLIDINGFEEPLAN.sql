SLIDINGFEEPLAN is a table.
+---------------------------+--------+------+--------+
|Column                     |Type    |Prec. |Null?   |
+---------------------------+--------+------+--------+
|ID                         |NUMBER  |  12.0|Not null|
|NAME                       |VARCHAR2| 100  |Not null|
|SLIDINGFEEPROGRAMID        |NUMBER  |  12.0|Not null|
|FLATFEERESPONSIBILITY      |NUMBER  |  11.2|        |
|PERCENTAGERESPONSIBILITY   |NUMBER  |  11.2|        |
|SLIDINGFEECALCULATIONTYPEID|NUMBER  |  12.0|        |
|CUSTOMTRANSACTIONCODEID    |VARCHAR2|  50  |        |
|CREATED                    |DATE    |   7  |        |
|CREATEDBY                  |VARCHAR2|  20  |        |
|LASTMODIFIED               |DATE    |   7  |        |
|LASTMODIFIEDBY             |VARCHAR2|  20  |        |
|DELETED                    |DATE    |   7  |        |
|DELETEDBY                  |VARCHAR2|  20  |        |
|ORDERING                   |NUMBER  |  12.0|        |
|NOTE                       |VARCHAR2|4000  |        |
|TRANSACTIONREASONID        |VARCHAR2|  20  |        |
|POVERTYLEVELLOWERBOUND     |NUMBER  |  12.0|        |
|POVERTYLEVELUPPERBOUND     |NUMBER  |  12.0|        |
+---------------------------+--------+------+--------+
