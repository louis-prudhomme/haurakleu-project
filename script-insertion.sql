ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

INSERT INTO instructions (guidelines, deadline) VALUES ('Write down a report of your internship', '26-03-2020');
INSERT INTO instructions (guidelines, deadline) VALUES ('Write down a report of your apprenticeship', '02-12-2000');
INSERT INTO instructions (guidelines, deadline) VALUES ('Write down a report of your internship ; it must be fourteen pages long', '26-01-2019');

INSERT INTO company (name) VALUES ('mycrausauft');
INSERT INTO company (name) VALUES ('haurakleu');
INSERT INTO company (name) VALUES ('hapel');
INSERT INTO company (name) VALUES ('gougueule');
INSERT INTO company (name) VALUES ('hamhasaune');

INSERT INTO conf_level (label) VALUES ('Normal');
INSERT INTO conf_level (label) VALUES ('Low level');
INSERT INTO conf_level (label) VALUES ('High level');

INSERT INTO teaching_field (label) VALUES ('Object-Oriented Programming');
INSERT INTO teaching_field (label) VALUES ('Database Administration');
INSERT INTO teaching_field (label) VALUES ('Java Enterprise Edition');
INSERT INTO teaching_field (label) VALUES ('XML');

INSERT INTO study_level (label) VALUES ('L1');
INSERT INTO study_level (label) VALUES ('L2');
INSERT INTO study_level (label) VALUES ('L3');
INSERT INTO study_level (label) VALUES ('M1');
INSERT INTO study_level (label) VALUES ('M2');

--INSERT INTO user_t (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Slayer', 'Doom', '666:/chainsaw.jpg', '0666136660', 'doomslayer@rip.tear', 'zpdkqpkdzqpok', 0);
--INSERT INTO user_t (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('John', 'Carmack', '/home/carmack/pictures/armadillo.png', '0498684962', 'johnc@idsoftware.com', 'zpdkqpkdzqpok', 1);