CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age INTEGER,
  species varchar(15)
);

CREATE TABLE people (
  id serial PRIMARY KEY,
  name varchar(50),
  age INTEGER,
  occupation VARCHAR(50)
);

INSERT INTO people (name,age, occupation)
VALUES ('Abbby',34, 'biologist' ),
('Mu''nisah', 26, NULL),
('Mirabelle', 40, 'contractor');


CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(100),
  length NUMERIC(4, 1),
  wingspan NUMERIC(4,1),
  family text,
  extinct boolean

);

  INSERT INTO birds (name, length, wingspan, family, extinct) VALUES
  ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
  ('American Robin', 25.5, 36.0, 'Turdidae', false),
  ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
  ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
  ('Common Kestrel', 35.5, 73.5, 'Falconidae', false);



CREATE TABLE  menu_items (
  serial id PRIMARY KEY,
  item text
  prep_time integer,
  ingredient_cost NUMERIC(4,2),
  sales integer,
  menu_price NUMERIC(4, 2)
);

INSERT INTO menu_items (item, prep_time, ingredient_cost, sales, menu_price) VALUES
('omelette', 10, 1.50, 182, 7.99),
('tacos', 5, 2.00, 254, 8.99),
('oatmeal', 1, 0.50, 79, 5.99);


 SELECT item, prep_time, menu_price, ingredient_cost,
      round( (prep_time::numeric / 60 * 13), 2) AS labor,
      round( (menu_price - ((prep_time::numeric / 60 * 13) + ingredient_cost)),2) AS profit;


  ('2016-03-02', 32, 44),
  ('2016-03-03', 31, 47),
  ('2016-03-04', 33, 42),
  ('2016-03-05', 39, 46),
  ('2016-03-06', 32, 43),
  ('2016-03-07', 29, 32),
  ('2016-03-08', 23, 31),
 ('2016-03-09', 17, 28);
