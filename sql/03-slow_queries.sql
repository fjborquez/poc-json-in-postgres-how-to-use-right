SELECT rooms.data ->> 'name',
       people.name
FROM rooms
   CROSS JOIN LATERAL jsonb_array_elements(
                         rooms.data -> 'reservations'
                      ) AS res(j)
   JOIN people
      ON res.j ->> 'who' = people.id::text;

UPDATE rooms
SET data = jsonb_set(
              data,
              '{reservations,100000}',
              '{"who": 3, "from": "2021-06-01 11:00:00", "to": "2021-06-01 12:00:00"}',
              TRUE
           )
WHERE id = 2;

SELECT id
FROM rooms
   CROSS JOIN LATERAL jsonb_array_elements(
                         rooms.data -> 'reservations'
                      ) AS elem(j)
WHERE CAST(elem.j ->> 'from' AS timestamp) <= TIMESTAMP '2021-06-01 15:30:00'
  AND CAST(elem.j ->> 'to'   AS timestamp) >  TIMESTAMP '2021-06-01 15:30:00';
