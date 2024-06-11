CREATE TABLE stars (
  id serial  PRIMARY KEY,
    name varchar(25) UNIQUE  NOT NULL,
    distance integer CHECK (distance > 0) NOT NULL,
    spectral_type char(1),
    companions integer CHECK (companions >= 0) NOT NULL
);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass integer
);

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation INTEGER CHECK(designation > 0) NOT NULL,
  semi_major_axis numeric CHECK(semi_major_axis > 0.0),
  mass numeric CHECK (mass > 0.0),
  planet_id INTEGER REFERENCES
  planets(id) NOT NULL
);
