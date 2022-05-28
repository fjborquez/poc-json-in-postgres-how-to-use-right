CREATE DATABASE fixed_schema;
\connect fixed_schema;   

CREATE TABLE people (
   id bigint PRIMARY KEY,
   name text NOT NULL
);
 
INSERT INTO people VALUES
   (1, 'laurenz'),
   (2, 'julian'),
   (3, 'ants'),
   (4, 'kaarel');
  
CREATE TABLE rooms (
	id bigint primary key,
	name text not null
);

INSERT INTO rooms VALUES
   (1, 'Room 1'),
   (2, 'Room 2');
  
CREATE TABLE reservations (
   people_id bigint REFERENCES people NOT NULL,
   room_id   bigint REFERENCES rooms  NOT NULL,
   reserved  tsrange                  NOT NULL,
   PRIMARY KEY (room_id, people_id)
);

CREATE EXTENSION IF NOT EXISTS btree_gist;
 
ALTER TABLE reservations ADD EXCLUDE USING gist (
   reserved WITH &&,
   room_id WITH =
);
 
INSERT INTO reservations values
   (1, 1, '[2021-06-01 09:00:00,2021-06-01 10:00:00)'),
   (3, 1, '[2021-06-01 10:00:00,2021-06-01 11:30:00)'),
   (2, 1, '[2021-06-01 13:15:00,2021-06-01 14:45:00)'),
   (2, 2, '[2021-06-01 09:30:00,2021-06-01 10:30:00)');
