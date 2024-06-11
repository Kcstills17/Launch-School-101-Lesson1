/*1. SQL consists of 3 different sublanguages. For example, one of these sublanguages is called the Data Control Language (DCL) component of SQL.
 It is used to control access to a database; it is responsible for defining the rights and roles granted to individual users. Common SQL DCL
  statements include:

GRANT
REVOKE

Name and define the remaining 2 sublanguages, and give at least 2 examples of each.*/


First is DML. This is Data Manipulation Language. THis is where we are dealing with the actual data involved in tables of databases  We can
add, create, modify, and delete the actual data of our databases. .   Common SQL statements include:
INSERT
UPDATE
SELECT
DELETE


Next IS DDL. This is Data Definiton Language. This is the schema or the logical structure of our tables in our databases that we work with. With DDL we can
create, modify, and remove the structure of our databases.
 Common SQL statements include

ALTER
DROP
CREATE

/* 2. Does the following statement use the Data Definition Language (DDL) or the Data Manipulation Language (DML) component of SQL?

SELECT column_name FROM my_table; */

 In this case we are using the SELECT sql command to access the data available in the column column_name from within the table my_table. SELECT is  a DML statement and acceses
 the data of the column which means this is a DML component of SQL.



/* Does the following statement use the DDL or DML component of SQL?

CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);
*/

This uses a DDL component of SQL. We usethe CREATE SQL command which is responsible for setting up the schema of a particular table in this case. That is exemplified more when
you see the contents of the table being created. Datatypes such as serial and constraints such as PRIMARY KEY or NOT NULL are key components of schema.

/*

4. Does the following statement use the DDL or DML component of SQL?

ALTER TABLE things
DROP CONSTRAINT things_item_key; */

DDL. ALTER is a SQL command responsible for making changes to the schema of a particular database here. And we are altering the schema by removving the constraint things_item_key
through the use of the command DROP CONSTRAINT.

/* 5. Does the following statement use the DDL or DML component of SQL?

INSERT INTO things VALUES (3, 'Scissors', 'Metal'); */

DML. INSERT is a DML SQL command. It involves adding new data, or rows,  to the current table things.


/*
6. Does the following statement use the DDL or DML component of SQL?

UPDATE things
SET material = 'plastic'
WHERE item = 'Cup'; */

DML. UPDATE is a DML SQL command. we are modifying the contents of the row of data material to 'plastic' based on a particular condition.

/* 7. Does the following statement use the DDL, DML, or DCL component of SQL?

\d things  */

This is none of the 3 languages of SQL. This is a command within the PSQL command line.

/* 8. Does the following statement use the DDL or DML component of SQL?

DELETE FROM things WHERE item = 'Cup';  */

DML. DELETE is a DML SQL command. We are removing the row of data, item, when the data is equal to the string value 'cup'


/* 9. Does the following statement use the DDL or DML component of SQL?

DROP DATABASE xyzzy;  */

DDL. DROP is a DDL SQL command. Through DROP DATABASE we can delete the entire databases schema. In doing this the data contents of the database is also deleted.
Although one may view this as using DML. The main factor is you are erasing the schema or the logical structure of the database. Therefore this is a DDL action.


/* 10. Does the following statement use the DDL or DML component of SQL?

CREATE SEQUENCE part_number_sequence; */

DDL. CREATE is a DDL SQL command.





Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'.
 The report should include the event name and starts_at and the seat's section name, row, and seat number.

Expected Output

        event        |      starts_at      |    section    | row | seat
--------------------+---------------------+---------------+-----+------
  Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   10
  Kool-Aid Man       | 2016-06-14 20:00:00 | Lower Balcony | H   |   11
  Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   14
  Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   15
  Green Husk Strange | 2016-02-28 18:00:00 | Orchestra     | O   |   16
  Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    7
  Ultra Archangel IX | 2016-05-23 18:00:00 | Upper Balcony | G   |    8
(7 rows)

insert_data=# SELECT events.name, events.starts_at,
 sections.name,
seats.row. seats.id
 FROM events

Mapping relationships between tables
Grouping by event names
Ordering by starts_at
1. A customer usually can have multiple tickets so we can compare the two with customers.id = tickets.customer_id
2. Usually there is a ticket to a specific event.  we can tell using tickets.event_id = events.id
3. A section will always contain seats. we can use seats.section_id = section.id
4. each seat is usually linked to a ticket. so we can use tickets.seat_id = seats.id
