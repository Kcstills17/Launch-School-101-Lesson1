CREATE TABLE orders (
    id integer,
    customer_name text,
    burger text,
    side text,
    drink text
);

INSERT INTO orders VALUES (1, 'Todd Perez', 'LS Burger', 'Fries', 'Lemonade');
INSERT INTO orders VALUES (2, 'Florence Jordan', 'LS Cheeseburger', 'Fries', 'Chocolate Shake');
INSERT INTO orders VALUES (3, 'Robin Barnes', 'LS Burger', 'Onion Rings', 'Vanilla Shake');
INSERT INTO orders VALUES (4, 'Joyce Silva', 'LS Double Deluxe Burger', 'Fries', 'Chocolate Shake');
INSERT INTO orders VALUES (5, 'Joyce Silva', 'LS Chicken Burger', 'Onion Rings', 'Cola');



CREATE TABLE animals (
  id serial,
  name varchar(100) NOT NULL,
  binomial_name varchar(100) NOT NULL,
  maxweight DECIMAL(8, 3),
  max_age_years integer,
  conservation_status char(2)

);


CREATE TABLE orders (
  id serial PRIMARY KEY,
  customer_name varchar(100) NOT NULL,
  burger varchar(50),
  side varchar(50),
  drink varchar(50),
  order_total DECIMAL(4, 2) NOT NULL
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  customer_name VARCHAR(100)
);

CREATE TABLE email_addresses (
  id SERIAL PRIMARY KEY,
  customer_email VARCHAR(50) UNIQUE,
  customer_id INTEGER UNIQUE,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE products (
  id serial PRIMARY KEY,
  product_name varchar(50),
  product_cost DECIMAL(4, 2) DEFAULT 0,
  product_type varchar(20),
  product_loyalty_points INTEGER
);

CREATE TABLE continents (
  id serial,
  continent_name varchar(50),
  PRIMARY KEY (id)

);

CREATE TABLE albulms (
  id serial PRIMARY KEY,
  album_name varchar(50),
  Relased_date date,
  genre varchar(50),
  label varchar(50),
  singer_id int,
  FOREIGN KEY(singer_id)
     REFERENCES singers(id)
);


 id            | integer                |           | not null | nextval('famous_people_id_seq'::regclass)
 first_name    | character varying(80)  |           | not null |
 occupation    | character varying(150) |           |          |
 date_of_birth | date                   |           | not null |
 deceased      | boolean                |           |          | false
 last_name     | character varying(100) |           | not null |


 customer_name           | character varying(100) |           | not null |
 burger                  | character varying(50)  |           |          |
 side                    | character varying(50)  |           |          |
 drink                   | character varying(50)  |           |          |
 customer_email          | character varying(50)  |           |          |
 customer_loyalty_points | integer                |           |          | 0
 burger_cost             | numeric(4,2)           |           |          | 0
 side_cost               | numeric(4,2)           |           |          | 0
 drink_cost              | numeric(4,2)           |           |          | 0

encyclopedia=# SELECT * FROM continents;
 id | continent_name
----+----------------
  1 | Africa
  2 | Asia
  3 | Europe
  4 | North America
  5 | South America


----
  1 | Bruce      | Singer/Songwriter       | 1949-09-23    | f        | Springsteen
  2 | Frank      | Singer, Actor           | 1915-12-15    | t        | Sinatra
  4 | Elvis      | Singer, Musician, Actor | 1935-08-01    | t        | Presley
  5 | Prince     | Singer                  | 1958-06-07    | t        |
  6 | Madonna    | Singer                  | 1958-08-17    | f        |
(5 rows)
