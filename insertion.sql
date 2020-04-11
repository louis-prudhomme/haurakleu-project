-- sets the date format for the rest of the session
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

-- insert in the table instructions

INSERT INTO tab_instructions (guidelines, deadline) VALUES ('Write down a tab_report of your internship', '26-03-2021');
INSERT INTO tab_instructions (guidelines, deadline) VALUES ('Write down a tab_report of your apprenticeship', '02-12-2021');
INSERT INTO tab_instructions (guidelines, deadline) VALUES ('Write down a tab_report of your internship ; it must be fourteen pages long', '26-01-2021');

-- inserts in the table company

INSERT INTO tab_company (name) VALUES ('MyCrauSauft');
INSERT INTO tab_company (name) VALUES ('Haurakleu');
INSERT INTO tab_company (name) VALUES ('Hapel');
INSERT INTO tab_company (name) VALUES ('Gougueule');
INSERT INTO tab_company (name) VALUES ('Hamhasaune');
INSERT INTO tab_company (name) VALUES ('LHVM');
INSERT INTO tab_company (name) VALUES ('L''Aureal Madryd');
INSERT INTO tab_company (name) VALUES ('Safoni');
INSERT INTO tab_company (name) VALUES ('Leonard');
INSERT INTO tab_company (name) VALUES ('OXO');
INSERT INTO tab_company (name) VALUES ('BPN Marseillebas');
INSERT INTO tab_company (name) VALUES ('Bleu Telecom');
INSERT INTO tab_company (name) VALUES ('Vivendive');
INSERT INTO tab_company (name) VALUES ('Societe globale');
INSERT INTO tab_company (name) VALUES ('Micheline');
INSERT INTO tab_company (name) VALUES ('Pythagore');
INSERT INTO tab_company (name) VALUES ('Curcumain');
INSERT INTO tab_company (name) VALUES ('Credit naval');
INSERT INTO tab_company (name) VALUES ('Lepetit');
INSERT INTO tab_company (name) VALUES ('Ricard');

-- inserts in the table confidentiality level

INSERT INTO tab_confidentiality_level (id, label) VALUES (1, 'Normal');
INSERT INTO tab_confidentiality_level (id, label) VALUES (2, 'Low level');
INSERT INTO tab_confidentiality_level (id, label) VALUES (3, 'High level');

-- inserts in the table teaching field

INSERT INTO tab_teaching_field (label) VALUES ('Object-Oriented Programming');
INSERT INTO tab_teaching_field (label) VALUES ('Database Administration');
INSERT INTO tab_teaching_field (label) VALUES ('Java Enterprise Edition');
INSERT INTO tab_teaching_field (label) VALUES ('XML');
INSERT INTO tab_teaching_field (label) VALUES ('Frontend');
INSERT INTO tab_teaching_field (label) VALUES ('Machine Learning');
INSERT INTO tab_teaching_field (label) VALUES ('English');
INSERT INTO tab_teaching_field (label) VALUES ('Mobile developement');
INSERT INTO tab_teaching_field (label) VALUES ('Bioengineering');
INSERT INTO tab_teaching_field (label) VALUES ('Business plan');
INSERT INTO tab_teaching_field (label) VALUES ('Project management');
INSERT INTO tab_teaching_field (label) VALUES ('C#');
INSERT INTO tab_teaching_field (label) VALUES ('.NET Core');
INSERT INTO tab_teaching_field (label) VALUES ('DevOps');
INSERT INTO tab_teaching_field (label) VALUES ('Reali-time systems');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Object-Oriented Programming');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Database Administration');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Java Enterprise Edition');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced XML');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Frontend');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Machine Learning');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced English');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Mobile developement');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Bioengineering');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Business plan');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Project management');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced C#');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced .NET Core');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced DevOps');
INSERT INTO tab_teaching_field (label) VALUES ('Advanced Reali-time systems');

-- inserts in the table study level

INSERT INTO tab_study_level (id, label) VALUES (1, 'L1');
INSERT INTO tab_study_level (id, label) VALUES (2, 'L2');
INSERT INTO tab_study_level (id, label) VALUES (3, 'L3');
INSERT INTO tab_study_level (id, label) VALUES (4, 'M1');
INSERT INTO tab_study_level (id, label) VALUES (5, 'M2');
INSERT INTO tab_study_level (id, label) VALUES (6, 'OUT');

-- inserts in the table user

INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Slayer', 'Doom', '666:/chainsaw.jpg', '0666136660', 'doomslayer@rip.tear', 'AA!45aaass', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('John', 'Carmack', '/home/carmack/pictures/armadillo.png', '0498684962', 'johnc@idsoftware.com', 'f1aA6aa@', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Christian', 'Nguyen', 'http://gil.cc/esazew', '0691784249', 'es@ze.sk', 'aTiew9us@k', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Earl', 'Webster', 'http://gi.dm/fucwuula', '0818702908', 'rugo@fotabe.tw', 'loNNod0uk##', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Lydia', 'Park', 'http://duzin.gl/ho', '0486447349', 'izsafis@peopcoh.io', 'hoaAAho9nu@', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Alma', 'Hunter', 'http://web.pe/gedub', '0547197958', 'ej@la.bw', 'rol2otD#ef', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Clara', 'Paul', 'http://ogodmu.mv/vegarol', '0809984108', 'ti@nuh.za', 'vawe#3Dhne', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Henrietta', 'Underwood', 'http://bewhuk.us/hede', '0767025947', 'aphom@tajhuczi.bm', 'ali4F^ijim', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Genevieve', 'Caldwell', 'http://zefokrad.us/era', '0554030398', 'lopro@devet.hn', 'tab3Fe@jne', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Victoria', 'Fernandez', 'http://nuk.hr/jefwu', '0428439760', 'da@ode.ao', 'rohu4@hFum', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Gerald', 'Holland', 'http://juwol.nu/dohujav', '0172835010', 'koligmev@tin.lc', 'aplR5#ukun', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Mike', 'Morgan', 'http://ototol.ph/fa', '0230902204', 'sum@mewkosot.ke', 'ejb@o4piRv', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Anthony', 'Wells', 'http://gidahe.cm/cosvus', '0167152627', 'rifechu@ho.as', 'ja@l3Fdigu', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Olivia', 'Douglas', 'http://kikuwzo.al/vi', '0974071000', 'fu@polosip.tr', 'vo66i@Stirn', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Theresa', 'Tucker', 'http://petbe.ye/he', '0438562511', 'uloabi@ip.tn', 'idip5iD@sa', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Johanna', 'Rodriguez', 'http://burhu.fi/zad', '0562144554', 'umuuwic@mah.de', 'zasF4a^laj', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Elmer', 'Taylor', 'http://cusgaje.lc/oljo', '0191617302', 'cevop@kohlegci.rs', 'ij5G5*uselu', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Clara', 'Meyer', 'http://el.qa/bagjohzuc', '0560565572', 'gapaw@ji.zw', 'g4uaDj@aib', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Leo', 'Maxwell', 'http://zonnokbam.cr/weowu', '0319647451', 'rema@cum.qa', 'av3Sej#ino', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Bill', 'Silva', 'http://vigoj.to/jezurfu', '0465975796', 'ona@ru.je', 'nicz6#Figo', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Jessie', 'Barton', 'http://bopa.tm/gaw', '0959393230', 'wajez@zi.ss', 'uhivu3@Ctz', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Emma', 'Walsh', 'http://niabe.zw/wassem', '0145116566', 'kihavuca@vosrur.tp', 'kirSr@6ebm', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Dennis', 'Pena', 'http://izaru.kw/jinis', '0806976245', 'kip@cufihuw.md', 'julu@h3Fba', 0);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Lillian', 'Martin', 'http://seluop.am/biwi', '0271019140', 'niwge@hemuwil.io', 'si4V@likel', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Franklin', 'Fields', 'http://boti.pg/hakkago', '0265799381', 'lub@nek.ge', 'mofac5@Dok', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Willie', 'Stewart', 'http://bud.az/pebo', '0585979273', 'uswespic@piule.vc', 'li6n@Xiasn', 1);
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('Flora', 'Norris', 'http://savi.gb/poimo', '0824489470', 'kenevezi@jidcez.et', 'he4@3Cdawre', 0);

-- inserts in the table company tutor

INSERT INTO tab_company_tutor (id, job) VALUES (1, 'Developer');
INSERT INTO tab_company_tutor (id, job) VALUES (2, 'Project manager');
INSERT INTO tab_company_tutor (id, job) VALUES (3, 'HR');
INSERT INTO tab_company_tutor (id, job) VALUES (4, 'Ingeneer');
INSERT INTO tab_company_tutor (id, job) VALUES (5, 'Developer');
INSERT INTO tab_company_tutor (id, job) VALUES (6, 'Lead developer');

-- inserts in the table teacher

INSERT INTO tab_teacher (id, hired) VALUES (7, '23-04-2008');
INSERT INTO tab_teacher (id, hired) VALUES (8, '25-09-2008');
INSERT INTO tab_teacher (id, hired) VALUES (9, '19-08-2011');
INSERT INTO tab_teacher (id, hired) VALUES (10, '28-09-2013');
INSERT INTO tab_teacher (id, hired) VALUES (11, '10-05-2015');
INSERT INTO tab_teacher (id, hired) VALUES (12, '17-12-2016');
INSERT INTO tab_teacher (id, hired) VALUES (13, '22-10-2018');

-- inserts in the table teaches

INSERT INTO rel_teaches (id_teacher, id_field) VALUES (9, 16);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (11, 17);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (12, 15);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (12, 7);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (11, 18);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (12, 10);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (8, 7);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (9, 9);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (12, 11);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (10, 9);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (11, 14);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (8, 4);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (11, 3);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (11, 2);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (10, 4);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (9, 3);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (12, 12);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (7, 19);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (11, 4);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (8, 18);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (8, 3);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (8, 15);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (11, 9);
INSERT INTO rel_teaches (id_teacher, id_field) VALUES (12, 6);

-- inserts in the table major 

INSERT INTO tab_major (label, id_major_director) VALUES ('Software engineering', 10);
INSERT INTO tab_major (label, id_major_director) VALUES ('Business intelligence', 8);
INSERT INTO tab_major (label, id_major_director) VALUES ('Solar panels', 7);
INSERT INTO tab_major (label, id_major_director) VALUES ('Drones', 12);
INSERT INTO tab_major (label, id_major_director) VALUES ('Droids', 12);
INSERT INTO tab_major (label, id_major_director) VALUES ('Robots', 12);
INSERT INTO tab_major (label, id_major_director) VALUES ('Databases', 10);
INSERT INTO tab_major (label, id_major_director) VALUES ('Artificial Intelligence', 8);
INSERT INTO tab_major (label, id_major_director) VALUES ('Bioengineering', 9);
INSERT INTO tab_major (label, id_major_director) VALUES ('New energies', 12);
INSERT INTO tab_major (label, id_major_director) VALUES ('Avionics and Space', 11);

-- inserts in the table student

INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (14, 2021, 0, 3, 4);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (15, 2023, 0, 8, 2);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (16, 2023, 1, 7, 2);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (17, 2024, 0, 7, 1);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (18, 2023, 1, 2, 2);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (19, 2023, 1, 3, 2);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (20, 2023, 0, 8, 2);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (21, 2024, 1, 6, 1);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (22, 2021, 1, 6, 4);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (23, 2022, 1, 8, 3);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (24, 2023, 0, 7, 2);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (25, 2022, 1, 8, 3);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (26, 2024, 1, 5, 1);
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (27, 2024, 1, 4, 1);

-- inserts in the table rel_performs

INSERT INTO rel_performs (id_student, id_instructions) VALUES (22, 3);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (24, 3);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (26, 3);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (26, 1);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (18, 1);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (26, 2);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (19, 3);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (21, 2);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (23, 1);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (15, 1);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (18, 2);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (24, 2);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (25, 1);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (21, 3);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (27, 2);
INSERT INTO rel_performs (id_student, id_instructions) VALUES (27, 1);

-- inserts in the table report

INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1554 Ulakeg View', 0, 0, 20, 9, 11, 3, 1, 3);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1609 Gawi Key', 0, 1, 27, 2, 7, 3, 2, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1155 Lomji Ridge', 0, 1, 22, 17, 11, 3, 2, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1669 Reoho Place', 0, 0, 16, 14, 10, 2, 1, 2);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1558 Momrom Glen', 0, 1, 19, 2, 9, 1, 2, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('315 Fafa River', 0, 0, 15, 9, 8, 5, 2, 3);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('834 Defo Extension', 0, 1, 21, 10, 8, 1, 2, 2);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1473 Hatoh Path', 1, 0, 19, 9, 7, 5, 3, 3);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('952 Hejtut View', 0, 1, 22, 9, 11, 3, 3, 2);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1505 Niswu Glen', 0, 1, 22, 15, 10, 1, 2, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('149 Jakuj Manor', 0, 1, 17, 11, 10, 3, 1, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1592 Gelsav Manor', 1, 0, 20, 12, 10, 2, 1, 3);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('419 Adpic Glen', 1, 0, 27, 6, 9, 1, 3, 2);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1580 Otaaza Extension', 0, 1, 15, 7, 13, 3, 2, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1065 Lohat Drive', 0, 1, 24, 4, 12, 4, 1, 2);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1853 Obza Parkway', 0, 1, 17, 13, 8, 2, 3, 2);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('220 Siit Glen', 0, 1, 17, 10, 12, 2, 3, 3);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1409 Fosbe Park', 0, 0, 15, 2, 13, 3, 2, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('196 Lejzu Place', 0, 1, 17, 10, 13, 2, 1, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1143 Tazsu Grove', 1, 0, 24, 4, 9, 2, 2, 2);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1737 Jopic Lane', 0, 1, 16, 17, 11, 5, 1, 3);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('350 Gimufi View', 1, 0, 26, 14, 12, 1, 2, 3);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1720 Mevu Lane', 0, 1, 27, 17, 12, 2, 1, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('229 Peso Pike', 0, 1, 25, 4, 12, 5, 3, 2);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1523 Fuef Square', 0, 1, 16, 9, 9, 4, 1, 3);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1305 Piuga Grove', 0, 0, 23, 16, 7, 4, 3, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1427 Demdi Glen', 0, 0, 15, 14, 13, 5, 3, 3);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('570 Zife Manor', 0, 1, 20, 7, 10, 1, 2, 1);
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1613 Ovjig Pass', 1, 0, 18, 6, 12, 3, 2, 2);

-- inserts in the table keyword

INSERT INTO tab_keyword (word) VALUES ('JEE');
INSERT INTO tab_keyword (word) VALUES ('Bank');
INSERT INTO tab_keyword (word) VALUES ('Oracle');
INSERT INTO tab_keyword (word) VALUES ('SSII');
INSERT INTO tab_keyword (word) VALUES ('ESN');
INSERT INTO tab_keyword (word) VALUES ('Master');
INSERT INTO tab_keyword (word) VALUES ('Java');
INSERT INTO tab_keyword (word) VALUES ('C#');
INSERT INTO tab_keyword (word) VALUES ('AWS');
INSERT INTO tab_keyword (word) VALUES ('Cloud');
INSERT INTO tab_keyword (word) VALUES ('SI');
INSERT INTO tab_keyword (word) VALUES ('Systèmes d’information');
INSERT INTO tab_keyword (word) VALUES ('Big Data');

-- inserts in the table rel_has

INSERT INTO rel_has (id_report, id_keyword) VALUES (21, 3);
INSERT INTO rel_has (id_report, id_keyword) VALUES (15, 11);
INSERT INTO rel_has (id_report, id_keyword) VALUES (28, 8);
INSERT INTO rel_has (id_report, id_keyword) VALUES (2, 2);
INSERT INTO rel_has (id_report, id_keyword) VALUES (13, 3);
INSERT INTO rel_has (id_report, id_keyword) VALUES (10, 8);
INSERT INTO rel_has (id_report, id_keyword) VALUES (5, 12);
INSERT INTO rel_has (id_report, id_keyword) VALUES (8, 2);
INSERT INTO rel_has (id_report, id_keyword) VALUES (23, 4);
INSERT INTO rel_has (id_report, id_keyword) VALUES (4, 12);
INSERT INTO rel_has (id_report, id_keyword) VALUES (2, 4);
INSERT INTO rel_has (id_report, id_keyword) VALUES (10, 13);
INSERT INTO rel_has (id_report, id_keyword) VALUES (1, 1);
INSERT INTO rel_has (id_report, id_keyword) VALUES (10, 10);
INSERT INTO rel_has (id_report, id_keyword) VALUES (4, 3);
INSERT INTO rel_has (id_report, id_keyword) VALUES (8, 3);
INSERT INTO rel_has (id_report, id_keyword) VALUES (12, 5);
INSERT INTO rel_has (id_report, id_keyword) VALUES (8, 4);
INSERT INTO rel_has (id_report, id_keyword) VALUES (19, 12);
INSERT INTO rel_has (id_report, id_keyword) VALUES (22, 6);
INSERT INTO rel_has (id_report, id_keyword) VALUES (7, 5);
INSERT INTO rel_has (id_report, id_keyword) VALUES (14, 11);
INSERT INTO rel_has (id_report, id_keyword) VALUES (11, 5);
INSERT INTO rel_has (id_report, id_keyword) VALUES (26, 9);
INSERT INTO rel_has (id_report, id_keyword) VALUES (13, 8);
INSERT INTO rel_has (id_report, id_keyword) VALUES (21, 7);
INSERT INTO rel_has (id_report, id_keyword) VALUES (11, 6);
INSERT INTO rel_has (id_report, id_keyword) VALUES (2, 9);
INSERT INTO rel_has (id_report, id_keyword) VALUES (13, 12);
INSERT INTO rel_has (id_report, id_keyword) VALUES (20, 4);
INSERT INTO rel_has (id_report, id_keyword) VALUES (24, 13);
INSERT INTO rel_has (id_report, id_keyword) VALUES (8, 10);
INSERT INTO rel_has (id_report, id_keyword) VALUES (10, 4);
INSERT INTO rel_has (id_report, id_keyword) VALUES (7, 2);
INSERT INTO rel_has (id_report, id_keyword) VALUES (5, 8);
INSERT INTO rel_has (id_report, id_keyword) VALUES (10, 11);
INSERT INTO rel_has (id_report, id_keyword) VALUES (3, 8);
INSERT INTO rel_has (id_report, id_keyword) VALUES (22, 9);
INSERT INTO rel_has (id_report, id_keyword) VALUES (25, 3);
INSERT INTO rel_has (id_report, id_keyword) VALUES (9, 8);
INSERT INTO rel_has (id_report, id_keyword) VALUES (20, 5);
INSERT INTO rel_has (id_report, id_keyword) VALUES (28, 7);
INSERT INTO rel_has (id_report, id_keyword) VALUES (11, 4);
INSERT INTO rel_has (id_report, id_keyword) VALUES (21, 4);
INSERT INTO rel_has (id_report, id_keyword) VALUES (12, 8);
INSERT INTO rel_has (id_report, id_keyword) VALUES (13, 10);
INSERT INTO rel_has (id_report, id_keyword) VALUES (27, 12);
INSERT INTO rel_has (id_report, id_keyword) VALUES (7, 6);
INSERT INTO rel_has (id_report, id_keyword) VALUES (9, 5);
INSERT INTO rel_has (id_report, id_keyword) VALUES (1, 2);
INSERT INTO rel_has (id_report, id_keyword) VALUES (5, 5);
INSERT INTO rel_has (id_report, id_keyword) VALUES (27, 9);
INSERT INTO rel_has (id_report, id_keyword) VALUES (15, 3);
INSERT INTO rel_has (id_report, id_keyword) VALUES (10, 2);
INSERT INTO rel_has (id_report, id_keyword) VALUES (14, 3);
INSERT INTO rel_has (id_report, id_keyword) VALUES (13, 2);
INSERT INTO rel_has (id_report, id_keyword) VALUES (2, 6);
INSERT INTO rel_has (id_report, id_keyword) VALUES (21, 10);
INSERT INTO rel_has (id_report, id_keyword) VALUES (23, 5);

