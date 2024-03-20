    CREATE TABLE devices (
      id serial PRIMARY KEY,
      name text NOT NULL,
      created_at timestamp  DEFAULT NOW()
    );


    CREATE TABLE parts (
      id serial PRIMARY KEY,
      part_number INTEGER UNIQUE NOT NULL,
      device_id INTEGER REFERENCES
      devices(id)
    );
