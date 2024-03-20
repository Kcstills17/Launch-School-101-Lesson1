When should we usually use the HAVING clause over the Where clause?

A- In order to filter rows that are grouped with GROUP BY we need to use a HAVING clause rather than a WHERE clause,
since we are targeting aggregate rows instead of a single row at a time.

Cardinality vs Modality.


What are some common Subquery Operators?
The most common ones are IN, NOT IN, ANY, SOME, and ALL.

What is Normalization?
Normalization is the process of designing schema that minimize or eliminate
the possible occurrence of anomalies such as insertion anomalies, delete anomalies, and update anomalies. The basic procedure of normalization
involves extracting data into additional tables and using foreign keys to tie
it back to its associated data.

What is the main purpose of a Primary key?
A primary key is a unique indentifier for a row of data.


DDL VS DML VS DCL. What do these stand for and an example of each type.
1. Data Definition Language - (deals with schema) ALTER
2. Data Manipulation Language (deals with data) SELECT
3. Data Control Language (deals with user priviledge) GRANT and REVOKE

What is the difference between a relation and a relationship
  A relation usually refers to a table
  A relationship refers to the association between the data within a particular reference.


What is the difference between a conceptual and physical schema? and how does a logical schema fit in?
When you are dealing with a high level, more abstract idea of your relationships this usually represents a conceptual schema.
The actual implementation details and low level design is what represents a physical schema.
A logical schema usually fits  in somewhere between both schemas.


what is a sequence? What is a sequence typically used for in a table? What datatype is typically associated with a sequence?
A **sequence** is a set of integers that are generated such that each "next" value that is generated produces some kind of unique value
 that can be used as an identifier or *key* for individual records in a database.

 A sequence is usually defined as part of a relation''s *schema*, most commonly with the PostgreSQL datatype `serial`. This allows us to generate
  a unique value for each row in any particular table, and that unique value can be used as the record's *primary key*. It's typical for us to name
   the column holding sequence values `id`.


