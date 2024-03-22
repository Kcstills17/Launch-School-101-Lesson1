/* create two tables list and todos
a list can have many todos.
a todo belongs to a list
this will be a one-many relationship
*/

CREATE TABLE list (
  id serial PRIMARY KEY,
  name text UNIQUE NOT NULL
);

CREATE TABLE todo (
  id serial PRIMARY KEY,
  name text NOT NULL,
  list_id integer NOT NULL REFERENCES list(id) ON DELETE CASCADE,
  completed boolean DEFAULT false
);
