BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('1275','Kinnear Rd','Columbus','OH','43212');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('801','Polaris Pkwy','Columbus','OH','43240');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('913','Carpenter St','Columbus','OH','43206');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('925','Mayfield Pl','Columbus','OH','43209');

INSERT INTO repair (status,repair_date) VALUES ('false','2045-03-06 10:03:04');
INSERT INTO repair (status,repair_date) VALUES ('true','2022-05-07 9:02:04');
INSERT INTO repair (status,repair_date) VALUES ('false','2019-02-01 8:02:01');
INSERT INTO repair (status,repair_date) VALUES ('false',null);

Insert INTO pothole (address_id, repair_id, direction,severity,discovery_date,description) VALUES ('1', '2', 'East','3','2000-01-02 11:04:05','This pothole has been here for 22 years, its become somewhat of a landmark. My son is now 22 and we ran over this pothole on the way to his birth.');
Insert INTO pothole (address_id, repair_id, direction,severity,discovery_date,description) VALUES ('2', '3', 'West','7','2021-05-08 9:08:21','I got pulled over for drunk driving when I was just trying to avoid this pothole, and I wasnt drunk I just had a buzz');
Insert INTO pothole (address_id, repair_id, direction,severity,discovery_date,description) VALUES ('3', '4', 'South','2','2018-07-03 5:07:40','');
Insert INTO pothole (address_id, repair_id, direction,severity,discovery_date,description) VALUES ('4', '1', 'North','9','2022-03-04 1:06:25','This customers comment was censored for explicit content');

COMMIT TRANSACTION;
