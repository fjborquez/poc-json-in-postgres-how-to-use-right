CREATE DATABASE bad_schema;
\connect bad_schema;

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
   id bigint PRIMARY KEY,
   data jsonb
);
 
INSERT INTO rooms VALUES
   (1,
    '{ "name": "Room 1",
       "reservations": [
           { "who": 1, "from": "2021-06-01 09:00:00", "to": "2021-06-01 10:00:00" },
           { "who": 3, "from": "2021-06-01 10:00:00", "to": "2021-06-01 11:30:00" },
           { "who": 2, "from": "2021-06-01 13:15:00", "to": "2021-06-01 14:45:00" },
           { "who": 1, "from": "2021-06-01 15:00:00", "to": "2021-06-01 16:00:00" }
        ]
     }'),
   (2,
    '{ "name": "Room 2",
       "reservations": [
           { "who": 2, "from": "2021-06-01 09:30:00", "to": "2021-06-01 10:30:00" }
        ]
     }');
