BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('1275','Kinnear Rd','Columbus','OH','43212');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('801','Polaris Pkwy','Columbus','OH','43240');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('913','Carpenter St','Columbus','OH','43206');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('925','Mayfield Pl','Columbus','OH','43209');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('1414','Crisfield Dr','Columbus','OH','43204');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('1881','High St','Columbus','OH','43207');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('1771','Broad St','Columbus','OH','43203');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('4356','Langport Rd','Columbus','OH','43220');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('965','Bethel Rd','Columbus','OH','43214');
INSERT INTO address (street_number,street_name,city,state_abbreviation,zipcode) VALUES ('1810','4th St','Columbus','OH','43201');


Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('1','East','10','2000-01-02 11:04:05', 'https://res.cloudinary.com/tipsindia/image/upload/v1660661745/alligator.png','This pothole has been here for 22 years, its become somewhat of a landmark. My son is now 22 and we ran over this pothole on the way to his birth.');
Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('2','West','9','2021-05-08 9:08:21', 'https://res.cloudinary.com/tipsindia/image/upload/v1660662270/fix-this-please.jpg','I got pulled over when I was just trying to avoid this pothole, its a menace two society');
Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('3','South','2','2018-07-03 5:07:40', 'https://res.cloudinary.com/tipsindia/image/upload/v1660760324/No-image.jpg','');
Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('4','North','5','2022-03-04 1:06:25', 'https://res.cloudinary.com/tipsindia/image/upload/v1660662155/ohio-pothole.webp','This customers comment was censored for explicit content');
Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('5','North','8','2022-04-01 00:01:00', 'https://res.cloudinary.com/tipsindia/image/upload/v1660760990/danger-pothole.jpg','Pothole is a danger to our kids on bikes');
Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('6','South','9','2022-08-20 00:11:00', 'https://res.cloudinary.com/tipsindia/image/upload/v1660761235/bad-pothole.jpg','This is making the mosquitoes worse!');
Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('7','South','2','2022-05-15 12:12:00', 'https://res.cloudinary.com/tipsindia/image/upload/v1660761226/pothole-flowerspg.jpg','Should be easy to spot!');
Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('8','West','1','2022-02-14 12:12:00', 'https://res.cloudinary.com/tipsindia/image/upload/v1660761460/heart-pothole.jpg','I would LOVE to have this pothole fixed');
Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('9','East','3','2022-07-28 12:12:00', 'https://res.cloudinary.com/tipsindia/image/upload/v1660762154/halp.jpg','Just joshin, everyone is fine. But would be nice to get this fixed.');
Insert INTO pothole (address_id,direction,severity,discovery_date,secure_url,description) VALUES ('10','South','4','2022-08-08 12:30:00', 'https://res.cloudinary.com/tipsindia/image/upload/v1660761481/pothole-action-shot.webp','This pothole is easy to miss but can mess a car up.');


INSERT INTO repair (pothole_id,status,repair_date) VALUES ('1','Pending','2045-03-06 10:03:04');
INSERT INTO repair (pothole_id,status,repair_date) VALUES ('2','Pending','2022-05-07 9:02:04');
INSERT INTO repair (pothole_id,status,repair_date) VALUES ('3','Pending','2023-02-01 8:02:01');
INSERT INTO repair (pothole_id,status,repair_date) VALUES ('4','Fixed','2019-02-01 8:02:01');
INSERT INTO repair (pothole_id,status,repair_date) VALUES ('5','Pending','2022-08-023 8:22:01');
INSERT INTO repair (pothole_id,status,repair_date) VALUES ('6','Repair Scheduled','2022-08-026 8:22:01');
INSERT INTO repair (pothole_id,status,repair_date) VALUES ('7','Pending','2023-03-06 10:03:04');
INSERT INTO repair (pothole_id,status,repair_date) VALUES ('8','Pending','2024-02-14 14:14:04');
INSERT INTO repair (pothole_id,status,repair_date) VALUES ('9','Reject','2022-07-30 14:45:04');
INSERT INTO repair (pothole_id,status,repair_date) VALUES ('10','Pending','2022-08-30 14:45:04');



COMMIT TRANSACTION;
