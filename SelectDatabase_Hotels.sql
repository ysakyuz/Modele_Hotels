USE bdd_hotel_akyuz;


--Liste des h�tels pour chaque cat�gorie

SELECT cat.type AS CategoryType, h.name AS HotelName
FROM categories cat
JOIN hotels h ON cat.id = h.category_id;


--Liste des h�tels pour chaque cha�ne

SELECT c.name AS ChainName, h.name AS HotelName
FROM chains c
JOIN hotels h ON c.id = h.chain_id;


--R�pertorier les d�tails de la r�servation pour chaque client
SELECT cus.name, cus.surname, res.check_in, res.check_out
FROM customers cus
JOIN reservations res ON cus.id = res.customer_id;


--Pour lister les propri�t�s et les h�tels qui leur sont associ�s
SELECT f.title AS FeatureTitle, h.name AS HotelName
FROM features f
JOIN features_has_hotels fhh ON f.id = fhh.feature_id
JOIN hotels h ON fhh.hotel_id = h.id;


--Pour r�pertorier les caract�ristiques de l'h�tel
SELECT f.*, h.name FROM features_has_hotels fh
JOIN features f ON fh.feature_id = f.id
JOIN hotels h ON fh.hotel_id = h.id;


--Pour chaque h�tel, r�pertoriez les h�tels dot�s de cette fonctionnalit� et les chambres de ces h�tels
SELECT h.name AS HotelName, f.title AS Feature, ro.room_number
FROM hotels h
JOIN features_has_hotels fhh ON h.id = fhh.hotel_id
JOIN features f ON fhh.feature_id = f.id
JOIN rooms ro ON h.id = ro.hotel_id;


--Pour lister les photos et les descriptions des chambres d'h�tel
SELECT i.*, h.name FROM images i
JOIN hotels h ON i.hotel_id = h.id;


--Requ�te unifi�e pour les r�servations et les informations client associ�es
SELECT r.*, c.name, c.surname FROM reservations r
JOIN customers c ON r.customer_id = c.id;



--Liste des r�servations de chambres pour chaque chambre
SELECT ro.room_number, ro.description, res.check_in, res.check_out
FROM rooms ro
JOIN rooms_has_reservations rhr ON ro.id = rhr.room_id
JOIN reservations res ON rhr.reservation_id = res.id;


--Pour v�rifier les chambres et leur relation avec les r�servations
SELECT rh.*, ro.room_number, res.check_in, res.check_out FROM rooms_has_reservations rh
JOIN rooms ro ON rh.room_id = ro.id
JOIN reservations res ON rh.reservation_id = res.id;













