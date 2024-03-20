CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text  NOT NULL,
  payment_token char(8) UNIQUE NOT NULL CHECK(length(payment_token) = 8  AND upper(payment_token) = payment_token)
);


CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10,2) NOT NULL CHECK(numeric >= 0.00)
)
