
"Les données à entrer dans la base de données ont été créées dans Excel, 
puis insérées de manière aléatoire avec la méthode d'insertion et l'aide de ChatGPT version 3."



Après l'entrée des données, si une correction est apportée à une saisie erronée, 
l'ordre des ID continue là où il s'est arrêté. 
Avec ce code, l'ID a été remis à zéro pour permettre une nouvelle saisie de données. 
Il est possible de réinitialiser le compteur d'une colonne IDENTITY dans une table SQL Server (dans ce cas, l'ID). 
Pour ce faire, il faut d'abord supprimer toutes les données de la table (dans ce cas, la table features), 
puis utiliser la commande DBCC CHECKIDENT pour réinitialiser le compteur de la colonne IDENTITY.


Tout d'abord, pour supprimer toutes les données de la table features :

--DELETE FROM <TABLE NAME>;
--DBCC CHECKIDENT ('<TABLE NAME>', RESEED, 0);

--DELETE FROM features;
--DBCC CHECKIDENT ('features', RESEED, 0);


Cette commande définit la prochaine valeur IDENTITY pour la colonne ID de la table features à 1 (si vous souhaitez commencer à 0, réglez la valeur RESEED sur -1)."





SELECT * FROM categories;
SELECT * FROM chains;
SELECT * FROM customers;
SELECT * FROM features;
SELECT * FROM features_has_hotels;
SELECT * FROM hotels;
SELECT * FROM images;
SELECT * FROM reservations;
SELECT * FROM rooms;
SELECT * FROM rooms_has_reservations;





--CATEGORIES INSERT

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO categories (type) VALUES ('Luxury');
	INSERT INTO categories (type) VALUES ('Budget');
	INSERT INTO categories (type) VALUES ('Family');
	INSERT INTO categories (type) VALUES ('Business');
	INSERT INTO categories (type) VALUES ('Romantic');
	INSERT INTO categories (type) VALUES ('Boutique');
	INSERT INTO categories (type) VALUES ('Adventure');
	
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH



--CHAINS INSERT AND RANDOM INSERT

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO chains (name, websites, rating, description) VALUES ('Global Hotels', 'www.globalhotels.com', '5-star', 'International hotel chain with properties worldwide');
	INSERT INTO chains (name, websites, rating, description) VALUES ('City Comfort Inns', 'www.citycomfortinns.com', '4-star', 'Comfortable and convenient locations in major cities');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Luxury Living Hotels', 'www.luxurylivinghotels.com', '5-star', 'Exquisite luxury experiences in top destinations');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Budget Beds', 'www.budgetbeds.com', '3-star', 'Affordable and friendly accommodations for travelers');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Family Getaways', 'www.familygetaways.com', '4-star', 'Family-friendly resorts with activities for all ages');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Eco Retreats', 'www.ecoretreats.com', '4-star', 'Sustainable and eco-friendly lodging options');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Historic Stays', 'www.historicstays.com', '4-star', 'Hotels with historic significance and charm');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Seaside Escapes', 'www.seasideescapes.com', '5-star', 'Luxurious beachfront properties in exotic locations');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Mountain Lodges', 'www.mountainlodges.com', '4-star', 'Beautiful lodges located in scenic mountain areas');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Urban Adventures', 'www.urbanadventures.com', '4-star', 'Modern and chic hotels in vibrant cities');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Countryside Comforts', 'www.countrysidecomforts.com', '3-star', 'Relaxing stays in the tranquility of the countryside');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Business Boutique', 'www.businessboutique.com', '4-star', 'Elegant hotels tailored for business travelers');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Airport Access', 'www.airportaccess.com', '3-star', 'Conveniently located near major airports for easy travel');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Health and Well Resorts', 'www.healthwellnessresorts.com', '5-star', 'Resorts focused on health, wellness, and relaxation');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Pet-Friendly Stays', 'www.petfriendlystays.com', '4-star', 'Hotels that welcome pets and offer pet services');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Romantic Retreats', 'www.romanticretreats.com', '5-star', 'Idyllic destinations perfect for romantic getaways');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Backpackers Haven', 'www.backpackershaven.com', '2-star', 'Affordable and social hostels for backpackers');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Adventure Resorts', 'www.adventureresorts.com', '4-star', 'Resorts offering adventure sports and activities');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Cultural Experiences', 'www.culturalexperiences.com', '4-star', 'Hotels offering unique cultural experiences');
	INSERT INTO chains (name, websites, rating, description) VALUES ('Winter land Hotels', 'www.winterwonderlandhotels.com', '4-star', 'Cozy hotels in popular winter destinations');

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

SELECT * FROM  chains;

/*
BEGIN TRY
    BEGIN TRANSACTION
    DECLARE @i INT = 0;
    WHILE @i < 20
    BEGIN
        INSERT INTO chains (name, websites, rating, description)
        VALUES (
            CONCAT('Chain', @i),
            CONCAT('www.chain', @i, '.com'),
            CASE WHEN @i % 5 = 0 THEN '5-star' 
                 WHEN @i % 5 = 1 THEN '4-star'
                 WHEN @i % 5 = 2 THEN '3-star'
                 WHEN @i % 5 = 3 THEN '2-star'
                 ELSE '1-star' END,
            CONCAT('Description for Chain', @i)
        );
        SET @i = @i + 1;
    END
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH
*/



--CUSTOMERS INSERT AND RANDOM INSERT

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO customers(name, surname, phone, email, street, building_number, city, postal_code, country, created_date, updated_date) 
	VALUES ('John' ,'Doe', '123456789','johndoe@gmail.com', 'Main Street', '123', 'Cityville' , ' 10001', 'Countryland', GETDATE(), GETDATE());	
	
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH										


SELECT * FROM customers;

/*
BEGIN TRY
	BEGIN TRANSACTION
	DECLARE @i INT = 0  
	WHILE @i <299 
	BEGIN
		INSERT INTO customers (name, surname, phone, email, street, building_number, city, postal_code, country, created_date, updated_date) 
		VALUES(CONCAT('Name', @i ),CONCAT('Surname', @i),CAST(RAND()*100000000 AS INT),CONCAT('email', @i, 'example.com' ),'Random Street',CAST(RAND()*100 AS int),'Random City',CAST(RAND()*10000 AS int),'Random Country',GETDATE(),GETDATE());
		SET @i = @i + 1;
	END 
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH
*/




--FEATURES INSERT 

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO features (title) VALUES ('Free WiFi');
	INSERT INTO features (title) VALUES ('24-Hour Reception');
	INSERT INTO features (title) VALUES ('Swimming Pool');
	INSERT INTO features (title) VALUES ('Spa Services');
	INSERT INTO features (title) VALUES ('Fitness Center');
	INSERT INTO features (title) VALUES ('Room Service');
	INSERT INTO features (title) VALUES ('Pet Friendly');
	INSERT INTO features (title) VALUES ('Airport Shuttle');
	INSERT INTO features (title) VALUES ('Parking');
	INSERT INTO features (title) VALUES ('Restaurant');
	INSERT INTO features (title) VALUES ('Bar/Lounge');
	INSERT INTO features (title) VALUES ('Laundry Service');
	INSERT INTO features (title) VALUES ('Meeting Facilities');
	INSERT INTO features (title) VALUES ('Non-Smoking Rooms');
	INSERT INTO features (title) VALUES ('Suites');
	INSERT INTO features (title) VALUES ('Family Rooms');
	INSERT INTO features (title) VALUES ('Accessible Rooms');
	INSERT INTO features (title) VALUES ('Business Center');
	INSERT INTO features (title) VALUES ('Concierge Service');
	INSERT INTO features (title) VALUES ('Outdoor Terrace');

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH


SELECT * FROM features;




--FEATURES_HAS_HOTELS INSERT 

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (1, 1);
	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (2, 1);
	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (15, 2);
	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (4, 2);
	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (5, 3);
	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (1, 3);
	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (2, 4);
	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (3, 4);
	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (4, 5);
	INSERT INTO features_has_hotels (feature_id, hotel_id) VALUES (17, 5);

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

SELECT * FROM features_has_hotels;



--HOTELS INSERT AND RANDOM INSERT

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Hotel Sunshine', 'Sunset Blvd', '11', 'Beachtown', '20002', 'Tropicalia', 1876543210, 1122334455, 'contact@hotelsunshine.com', 'A sunny beachfront hotel', 1, 1);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Mountain Retreat', 'Alpine Rd', '22', 'Hillside', '30003', 'Alpines', 1111543211, 1122334456, 'contact@mountainretreat.com', 'Peaceful retreat in the mountains', 2, 2);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Urban Hotel', 'City Center Sq', '33', 'Metropolis', '40004', 'Metroland', 1876543212, '1122334457', 'contact@urbanhotel.com', 'Luxury urban hotel with modern amenities', 3, 3);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Country Inn', 'Rural Route', '44', 'Countryside', '50005', 'Ruralia', 1876543213, '1122334458', 'contact@countryinn.com', 'Charming inn in the countryside', 4, 4);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Lakeside Lodge', 'Lakeshore Dr', '55', 'Lakeview', '60006', 'Lakeland', 1876543214, '1122334459', 'contact@lakesidelodge.com', 'Cozy lodge by the lake', 5, 5);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Hotel Sunshine', 'Sunset Blvd', '11', 'Beachtown', '20002', 'Tropicalia', 1876543210, 1122334455, 'contact@hotelsunshine.com', 'A sunny beachfront hotel', 1, 3);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Mountain Retreat', 'Alpine Rd', '22', 'Hillside', '30003', 'Alpines', 1876543211, 1122334456, 'contact@mountainretreat.com', 'Peaceful retreat in the mountains', 2, 2);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('City Hotel 39', 'City Center Rd', '39', 'Cityscape', '39039', 'Urbania', 1876543339, 1122334479, 'contact@cityhotel39.com', 'Modern city hotel', 7, 19);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Lakeside Lodge 40', 'Lake Ave', '40', 'Lakefront', '40040', 'Lakeside', 1876543340, 1122334480, 'contact@lakesidelodge40.com', 'Lodge with stunning lake views', 1, 20);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Garden View Inn', 'Rose Blvd', '41', 'Floraville', '41041', 'Gardenia', 1876543341, 1122334481, 'contact@gardenviewinn.com', 'A beautiful inn with garden views', 3, 3);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Urban Space Hotel', 'Metropolis St', '42', 'Urbantown', '42042', 'Cityland', 1876543342, 1122334482, 'contact@urbanspacehotel.com', 'A stylish hotel in the city center', 4, 4);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Coastal Escape Resort', 'Shoreline Dr', '43', 'Coastcity', '43043', 'Coastal', 1876543343, 1122334483, 'contact@coastalescape.com', 'Luxury resort on the coastline', 5, 5);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Grand Heritage Hotel', 'Heritage Rd', '44', 'Oldtown', '44044', 'Historia', 1876543344, 1122334484, 'contact@grandheritagehotel.com', 'Experience the history and elegance', 6, 6);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('City Lights Hotel', 'Bright Ave', '45', 'Cityscape', '45045', 'Brightland', 1876543345, 1122334485, 'contact@citylightshotel.com', 'Modern hotel with stunning city views', 7, 7);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Sunset Boutique', 'Sunset Blvd', '46', 'Sunnyville', '46046', 'Sunland', 1876543346, 1122334486, 'contact@sunsetboutique.com', 'Boutique hotel with sunset views', 1, 8);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Mountain Peak Hotel', 'Highland St', '47', 'Mountainview', '47047', 'Peaktop', 1876543347, 1122334487, 'contact@mountainpeakhotel.com', 'Stay at the peak of comfort', 2, 9);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Lakeside B&B', 'Lakefront Rd', '48', 'Lakecity', '48048', 'Lakeland', 1876543348, 1122334488, 'contact@lakesidebnb.com', 'Charming B&B by the lake', 3, 10);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Royal Palace Hotel', 'Regal Rd', '49', 'Royaltown', '49049', 'Regalia', 1876543349, 1122334489, 'contact@royalpalacehotel.com', 'Royal treatment in our luxury hotel', 4, 11);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Adventure Base Camp', 'Explorer Ave', '50', 'Adventuretown', '50050', 'Exploria', 1876543350, 1122334490, 'contact@adventurebasecamp.com', 'Your base for outdoor adventures', 5, 12);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Green Valley Inn', 'Nature Rd', '51', 'Greenville', '51051', 'Greenland', 1876543351, 1122334491, 'contact@greenvalleyinn.com', 'Eco-friendly inn in a serene valley', 6, 13);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Artistic Suites', 'Gallery Blvd', '52', 'Artville', '52052', 'Artland', 1876543352, 1122334492, 'contact@artisticsuites.com', 'Unique suites with artistic decor', 7, 14);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Harbor View Hotel', 'Harbor St', '53', 'Portcity', '53053', 'Harborland', 1876543353, 1122334493, 'contact@harborviewhotel.com', 'Stunning views of the harbor', 1, 15);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Space Traveler Inn', 'Cosmos Ave', '54', 'Spaceville', '54054', 'Spaceland', 1876543354, 1122334494, 'contact@spacetravelerinn.com', 'Futuristic inn for space enthusiasts', 2, 16);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Oceanfront Resort', 'Ocean Dr', '55', 'Oceanville', '55055', 'Oceanland', 1876543355, 1122334495, 'contact@oceanfrontresort.com', 'Luxurious resort on the oceanfront', 3, 17);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Historic Downtown Hotel', 'History St', '56', 'Oldtown', '56056', 'Historyland', 1876543356, 1122334496, 'contact@historicdowntownhotel.com', 'Experience history in the heart of the city', 4, 18);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Safari Adventure Lodge', 'Safari Rd', '57', 'Wildtown', '57057', 'Safariland', 1876543357, 1122334497, 'contact@safariadventurelodge.com', 'Unique lodge experience in the wild', 5, 19);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Sky High Hotel', 'Skyline Blvd', '58', 'Cloudcity', '58058', 'Skycity', 1876543358, 1122334498, 'contact@skyhighhotel.com', 'Hotel with breathtaking skyline views', 6, 20);
	INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id) VALUES ('Mystic Forest Retreat', 'Forest Path', '59', 'Mysticville', '59059', 'Forestland', 1876543359, 1122334499, 'contact@mysticforestretreat.com', 'Tranquil retreat in the heart of the forest', 7, 1);

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

SELECT * from hotels;

/*
BEGIN TRY
    BEGIN TRANSACTION
    DECLARE @i INT = 0;
    WHILE @i < 199
    BEGIN
        INSERT INTO hotels (name, street, building_number, city, postal_code, country, phone1, phone2, email, description, category_id, chain_id)
        VALUES (
            CONCAT('Hotel', @i),
            CONCAT('Street', @i),
            CAST(RAND()*100 AS VARCHAR(10)),
            CONCAT('City', @i),
            CONCAT('P', RIGHT('0000' + CAST(CAST(RAND()*10000 AS INT) AS VARCHAR(4)), 4)),
            CONCAT('Country', @i),
            CAST(RAND()*100000000 AS INT),
            CAST(RAND()*1000000000 AS BIGINT),
            CONCAT('contact@hotel', @i, '.com'),
            CONCAT('Description for Hotel', @i),
            CAST(RAND()*(7-1)+1 AS INT),
            CAST(RAND()*(20-1)+1 AS INT) 
        );
        SET @i = @i + 1;
    END
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
  
END CATCH
*/


--IMAGES INSERT AND RANDOM INSERT

BEGIN TRY
    BEGIN TRANSACTION

	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image1', 'www.examplehotel.com/images/image1.jpg', 'Beautiful view of Hotel 1', 1);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image2', 'www.examplehotel.com/images/image2.jpg', 'Elegant interior of Hotel 2', 2);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image3', 'www.examplehotel.com/images/image3.jpg', 'Luxurious amenities of Hotel 3', 3);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image4', 'www.examplehotel.com/images/image4.jpg', 'Scenic surroundings of Hotel 4', 4);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image5', 'www.examplehotel.com/images/image5.jpg', 'Comfortable and cozy Hotel 5', 5);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image6', 'www.examplehotel.com/images/image6.jpg', 'Exquisite dining at Hotel 6', 6);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image7', 'www.examplehotel.com/images/image7.jpg', 'Relaxing spa experience of Hotel 7', 7);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image8', 'www.examplehotel.com/images/image8.jpg', 'Modern architecture of Hotel 8', 8);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image9', 'www.examplehotel.com/images/image9.jpg', 'Splendid poolside of Hotel 9', 9);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image10', 'www.examplehotel.com/images/image10.jpg', 'Magnificent lobby of Hotel 10', 10);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image11', 'www.examplehotel.com/images/image11.jpg', 'Stunning rooftop view of Hotel 11', 11);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image12', 'www.examplehotel.com/images/image12.jpg', 'Historic charm of Hotel 12', 12);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image13', 'www.examplehotel.com/images/image13.jpg', 'Cozy suite of Hotel 13', 13);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image14', 'www.examplehotel.com/images/image14.jpg', 'Grand entrance of Hotel 14', 14);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image15', 'www.examplehotel.com/images/image15.jpg', 'Peaceful garden of Hotel 15', 15);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image16', 'www.examplehotel.com/images/image16.jpg', 'Stylish bar at Hotel 16', 16);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image17', 'www.examplehotel.com/images/image17.jpg', 'Spacious conference room of Hotel 17', 17);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image18', 'www.examplehotel.com/images/image18.jpg', 'Classic elegance of Hotel 18', 18);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image19', 'www.examplehotel.com/images/image19.jpg', 'Breathtaking balcony view of Hotel 19', 19);
	INSERT INTO images (img_name, img_url, img_description, hotel_id) VALUES ('Image20', 'www.examplehotel.com/images/image20.jpg', 'Gorgeous night view of Hotel 20', 20);


	COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION 
END CATCH

SELECT * from images;

/*BEGIN TRY
    BEGIN TRANSACTION

    DECLARE @hotel_id INT = 1;

    WHILE @hotel_id <= 227
    BEGIN
        INSERT INTO images (img_name, img_url, img_description, hotel_id)
        VALUES (
            CONCAT('ImageH', @hotel_id),
            CONCAT('www.example.com/hotel', @hotel_id, '/image.jpg'),
            CONCAT('Description for image ', @hotel_id),
            @hotel_id
        );

        SET @hotel_id = @hotel_id + 1;
    END

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    
END CATCH
*/



--RESERVATIONS INSERT AND RANDOM INSERT

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-01', '2023-01-05', 2, 1, '2022-12-15', 2, 1, 1, 1);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-10', '2023-02-15', 2, 0, '2023-01-20', 2, 0, 1, 2);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-03-15', '2023-03-20', 1, 2, '2023-02-28', 3, 2, 0, 3);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-04-05', '2023-04-10', 3, 1, '2023-03-25', 1, 1, 1, 4);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-05-20', '2023-05-25', 2, 2, '2023-05-10', 2, 2, 2, 5);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-06-01', '2023-06-06', 1, 0, '2023-05-15', 1, 0, 0, 6);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-07-10', '2023-07-15', 2, 1, '2023-07-01', 3, 1, 1, 7);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-08-15', '2023-08-20', 2, 0, '2023-08-05', 2, 2, 2, 8);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-09-01', '2023-09-05', 1, 1, '2023-08-20', 1, 1, 0, 9);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-10-10', '2023-10-15', 3, 0, '2023-10-01', 2, 0, 1, 10);
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-11-05', '2023-11-10', 2, 2, '2023-10-25', 1, 1, 1, 11);

	--RANDOM

	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-01-15', '2023-01-20', 2, 0, '2023-01-10', 2, 1, 1, CAST(RAND() * 299 + 1 AS INT));
	INSERT INTO reservations (check_in, check_out, adults_number, children_number, payment_date, breakfasts_per_day, lunches_per_day, dinners_per_day, customer_id) VALUES ('2023-02-05', '2023-02-10', 1, 1, '2023-01-30', 1, 0, 1, CAST(RAND() * 299 + 1 AS INT));
	
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

SELECT * from reservations;




--ROOMS INSERT AND RANDOM INSERT

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO rooms (room_number, price, adults_number, children_number, description, hotel_id) VALUES ('101', 100.0, 2, 0, 'Standard double room with garden view', 1);
	INSERT INTO rooms (room_number, price, adults_number, children_number, description, hotel_id) VALUES ('102', 150.0, 2, 1, 'Deluxe room with sea view', 1);
	INSERT INTO rooms (room_number, price, adults_number, children_number, description, hotel_id) VALUES ('103', 120.0, 2, 0, 'Standard double room with city view', 1);
	INSERT INTO rooms (room_number, price, adults_number, children_number, description, hotel_id) VALUES ('201', 130.0, 2, 1, 'Family room with balcony', 2);
	INSERT INTO rooms (room_number, price, adults_number, children_number, description, hotel_id) VALUES ('202', 200.0, 2, 0, 'Executive suite with mountain view', 2);
	INSERT INTO rooms (room_number, price, adults_number, children_number, description, hotel_id) VALUES ('301', 90.0, 1, 0, 'Single room with modern amenities', 3);
	INSERT INTO rooms (room_number, price, adults_number, children_number, description, hotel_id) VALUES ('302', 110.0, 2, 0, 'Double room with comfortable beds', 3);


	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

SELECT * from rooms;

/*
BEGIN TRY
	BEGIN TRANSACTION

    DECLARE @room_id INT = 1;

    WHILE @room_id <= 70
    BEGIN
        INSERT INTO rooms (room_number, price, adults_number, children_number, description, hotel_id)
        VALUES (
            CONCAT('Room', @room_id),
            ROUND(50.0 + RAND() * 150.0, 2),  
            CAST(RAND()*2 + 1 AS INT),        
            CAST(RAND()*2 AS INT),            
            CONCAT('Description for room ', @room_id),
            CAST(RAND()*(227-1)+1 AS INT)     
        );

        SET @room_id = @room_id + 1;
    END

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH
*/




BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (1, 1);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (2, 2);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (3, 3);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (4, 4);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (5, 5);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (6, 6);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (7, 7);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (8, 8);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (9, 9);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (10, 10);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (11, 11);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (12, 12);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (13, 13);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (14, 14);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (15, 15);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (16, 16);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (17, 17);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (18, 18);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (19, 19);
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (20, 20);

	--RANDOM

	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));
	INSERT INTO rooms_has_reservations (room_id, reservation_id) VALUES (CAST(RAND() * (77-1) + 1 AS INT), CAST(RAND() * (31-1) + 1 AS INT));

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH


SELECT * FROM rooms_has_reservations;











