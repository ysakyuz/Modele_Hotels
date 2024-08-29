--21) 


CREATE VIEW View_TableCounts AS
SELECT 
  'categories' AS Table_Name, COUNT(*) AS Record_Count FROM categories
UNION ALL
SELECT 
  'chains' AS Table_Name, COUNT(*) AS Record_Count FROM chains
UNION ALL
SELECT 
  'customers' AS Table_Name, COUNT(*) AS Record_Count FROM customers
UNION ALL
SELECT 
  'features' AS Table_Name, COUNT(*) AS Record_Count FROM categories
UNION ALL
SELECT 
  'features_has_hotels' AS Table_Name, COUNT(*) AS Record_Count FROM chains
UNION ALL
SELECT 
  'hotels' AS Table_Name, COUNT(*) AS Record_Count FROM customers
UNION ALL
SELECT 
  'images' AS Table_Name, COUNT(*) AS Record_Count FROM categories
UNION ALL
SELECT 
  'reservations' AS Table_Name, COUNT(*) AS Record_Count FROM chains
UNION ALL
SELECT 
  'rooms' AS Table_Name, COUNT(*) AS Record_Count FROM customers
UNION ALL
SELECT 
  'rooms_has_reservations' AS Table_Name, COUNT(*) AS Record_Count FROM customers


SELECT * FROM View_TableCounts;



--22) 

ALTER TABLE features_has_hotels
ADD CONSTRAINT FK_features_has_hotels_hotel_id
FOREIGN KEY (hotel_id)
REFERENCES hotels (id)
ON DELETE CASCADE;

ALTER TABLE rooms_has_reservations
ADD CONSTRAINT FK_rooms_has_reservations_room_id
FOREIGN KEY (room_id)
REFERENCES rooms (id)
ON DELETE CASCADE;






--23)
SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'reservations';


ALTER TABLE reservations
ADD CONSTRAINT CHK_reservations_adults_number CHECK (adults_number >= 1 AND adults_number <= 10);

ALTER TABLE reservations
DROP CONSTRAINT CHK_reservations_adults_number;



SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'rooms';

ALTER TABLE rooms
ADD CONSTRAINT CHK_rooms_adults_number CHECK (adults_number >= 1 AND adults_number <= 5);

ALTER TABLE rooms
DROP CONSTRAINT CHK_rooms_adults_number;







