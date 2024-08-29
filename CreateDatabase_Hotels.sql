/*




Création de la base de données et des TABLES

EACH TABLE IS organized according to the NO ACTION option.


*/
USE master
GO


USE master;
GO
IF (DB_ID('bdd_hotel_akyuz') IS NOT NULL) -- First delete the database if it exists
BEGIN
    ALTER DATABASE bdd_hotel_akyuz SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
    DROP DATABASE bdd_hotel_akyuz;
END
GO
CREATE DATABASE bdd_hotel_akyuz;
GO
USE bdd_hotel_akyuz;
GO



CREATE TABLE customers (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(25) NOT NULL,
    surname VARCHAR(25) NOT NULL,
    phone INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    street VARCHAR(25) NOT NULL,
    building_number VARCHAR(15) NOT NULL,
    city VARCHAR(15) NOT NULL,
    postal_code VARCHAR(15) NOT NULL,
    country VARCHAR(25) NOT NULL,
    created_date DATETIME NOT NULL,
    updated_date DATETIME NOT NULL
);

CREATE TABLE reservations (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    check_in DATETIME NOT NULL,
    check_out DATETIME NOT NULL,
    adults_number INT NOT NULL,
    children_number INT NOT NULL,
    payment_date DATETIME NOT NULL,
    breakfasts_per_day INT,
    lunches_per_day INT,
    dinners_per_day INT,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


CREATE TABLE chains (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(25) NOT NULL,
    websites VARCHAR(45) NOT NULL,
    rating VARCHAR(10) NOT NULL,
    description VARCHAR(250) NOT NULL
);

CREATE TABLE categories (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    type VARCHAR(15) NOT NULL
);


CREATE TABLE hotels (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(25) NOT NULL,
    street VARCHAR(45) NOT NULL,
    building_number VARCHAR(15) NOT NULL,
    city VARCHAR(15) NOT NULL,
    postal_code VARCHAR(15) NOT NULL,
    country VARCHAR(25) NOT NULL,
    phone1 INT NOT NULL,
    phone2 BIGINT NOT NULL,
    email VARCHAR(255) NOT NULL,
    description VARCHAR(250) NOT NULL,
    category_id INT NOT NULL,
    chain_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (chain_id) REFERENCES chains(id)
);


CREATE TABLE rooms (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    room_number VARCHAR(15) NOT NULL,
    price FLOAT NOT NULL,
    adults_number INT NOT NULL,
    children_number INT NOT NULL,
    description VARCHAR(250) NOT NULL,
    hotel_id INT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);


CREATE TABLE rooms_has_reservations (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	room_id INT NOT NULL,
	reservation_id INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES rooms(id),
	FOREIGN KEY (reservation_id) REFERENCES reservations(id)
);


CREATE TABLE features(
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	title VARCHAR(25) NOT NULL,
	
);

CREATE TABLE features_has_hotels (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	feature_id INT NOT NULL,
	hotel_id INT NOT NULL,
    FOREIGN KEY (feature_id) REFERENCES features(id),
	FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE images (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    img_name VARCHAR(25) NOT NULL,
    img_url VARCHAR(45) NOT NULL,
    img_description VARCHAR(45),
    hotel_id INT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);




