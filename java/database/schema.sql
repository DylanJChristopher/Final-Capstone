BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS pothole;
DROP TABLE IF EXISTS repair;
DROP TABLE IF EXISTS address;




CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE address (
	address_id SERIAL,
	street_number varchar(10) NOT NULL,
	street_name varchar(50) NOT NULL,
	city varchar(20) NOT NULL,
	state_abbreviation varchar(2) NOT NULL,
	zipcode varchar(5) NOT NULL,
	CONSTRAINT PK_address PRIMARY KEY (address_id)	
);

CREATE TABLE repair (
	repair_id SERIAL,
	status boolean NOT NULL,
	repair_date timestamp,
	CONSTRAINT PK_repair PRIMARY KEY (repair_id)
);
CREATE TABLE pothole (
	pothole_id SERIAL,
	repair_id int NOT NULL,
	address_id int NOT NULL,
	direction varchar(10)NOT NULL,
	severity varchar(2)NOT NULL,
	discovery_date timestamp NOT NULL,
	description varchar(300),
	CONSTRAINT PK_pothole PRIMARY KEY (pothole_id),
	CONSTRAINT FK_address FOREIGN KEY (address_id) REFERENCES address (address_id),
	CONSTRAINT FK_repair FOREIGN KEY (repair_id) REFERENCES repair (repair_id)
);
COMMIT TRANSACTION;
