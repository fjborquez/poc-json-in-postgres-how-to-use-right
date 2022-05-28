SELECT rooms.name,
       people.name
FROM rooms
   JOIN reservations AS r ON r.room_id = rooms.id
   JOIN people ON r.people_id = people.id;

INSERT INTO reservations VALUES
   (3, 2, '[2021-06-01 11:00:00,2021-06-01 12:00:00)');

SELECT room_id
FROM reservations
WHERE reserved @> TIMESTAMP '2021-06-01 15:30:00';
