


INSERT INTO person(id,first_name,last_name,phone_nr,email)
VALUES
  ('11111','Isabelle','Dejesus','08 52 11 40 72','nunc@student.net'),
  ('11112','Iola','Woods','09 19 58 50 55','rhoncus.donec.est@student.edu'),
  ('11113','Lunea','Kirkland','03 11 26 14 29','erat.vitae@student.edu'),
  ('11114','Sierra','Emerson','03 84 54 76 07','risus.donec.nibh@student.com'),
  ('11115','Otto','Barber','02 17 84 83 43','arcu.morbi@student.ca'),
  ('11116','Signe','Rice','03 72 58 06 23','nunc@aol.student'),
  ('11117','Marah','Maldonado','01 73 38 75 48','ultrices.a@student.org'),
  ('11118','Teagan','Hampton','06 54 43 61 15','consectetuer@student.net'),
  ('11119','Jackson','Blair','05 18 08 71 82','purus.duis@student.com'),
  ('11120','Dana','Kramer','02 40 72 28 09','magna@student.couk'),
  ('11121','Vernon','Robbins','01 77 54 57 64','cursus.integer@student.net'),
  ('11122','Anthony','Mccall','05 05 34 41 76','laoreet.ipsum@student.com'),
  ('11123','Logan','Gay','02 87 73 53 69','ante.dictum@student.couk'),
  ('11124','Xanthus','Grant','02 16 27 41 53','a.felis.ullamcorper@student.org'),
  ('11125','Shea','Leonard','07 76 47 63 16','tellus.aenean.egestas@student.com'),
  ('11126','Shay','Cannon','04 24 81 24 10','magna.sed@student.org'),
  ('11127','Graham','Ferrell','05 64 72 24 53','quis@student.net'),
  ('11128','Gisela','Case','06 64 56 06 44','ut.cursus@student.edu'),
  ('11129','Mercedes','Stein','03 04 27 38 16','urna.convallis.erat@student.net'),
  ('11130','Yuli','Mcfarland','04 48 55 33 94','molestie@student.com'),
  ('11131','Lisandra','Vance','04 05 56 86 74','phasellus.elit@student.org'),
  ('11132','Logan','Grant','02 61 25 44 66','in@student.ca'),
  ('11133','Basil','Walls','05 48 89 61 84','elit.pede@student.org'),
  ('50001','Andrew','Tate','05 32 17 52 02','ullamcorper.duis@parent.net'),
  ('50002','Drake','Casey','04 27 41 51 71','consequat.lectus@parent.org'),
  ('50003','Maya','Farrell','03 68 26 43 21','ac.sem.ut@parent.org'),
  ('50004','Lee','David','08 84 34 85 95','lectus.pede.ultrices@parent.ca'),
  ('50005','Simon','Gray','03 93 78 86 61','purus.duis.elementum@parent.edu'),
  ('50006','Kelsey','Norton','02 11 34 79 42','est@parent.com'),
  ('50007','Davis','Hopkins','04 84 81 20 17','fringilla.ornare@parent.edu'),
  ('50008','Zenaida','Lang','07 65 56 65 75','ipsum.curabitur.consequat@parent.net'),
  ('50009','Nathaniel','Bartlett','08 42 33 87 80','quisque.ornare@parent.couk'),
  ('50010','Erasmus','Butler','07 22 44 13 85','placerat.cras.dictum@parent.net'),
  ('50011','Hasad','Mckee','01 43 78 41 66','vulputate@parent.com'),
  ('50012','Jared','Cardenas','09 86 64 73 85','ornare@parent.org'),
  ('50013','Portia','Mcfarland','06 76 78 14 26','magna@parent.edu'),
  ('50014','Marny','Chambers','02 76 61 26 72','sed@parent.org'),
  ('50015','Nina','Bowers','05 08 15 47 48','blandit.viverra@parent.edu'),
  ('50016','Mariam','Guzman','01 03 15 15 37','lacus.quisque.purus@parent.net'),
  ('50017','Haviva','Stout','08 74 57 92 10','ligula@parent.edu'),
  ('50018','Harrison','Rasmussen','08 18 67 44 67','facilisis@parent.org'),
  ('50019','Martin','Woodard','04 72 64 23 88','dui@parent.com'),
  ('50020','Kirk','Hickman','06 77 26 72 41','leo.morbi.neque@parent.net'),
  ('50021','Chadwick','Aguilar','06 44 58 20 35','cursus.purus@parent.org'),
  ('50022','Brent','Leblanc','04 48 80 33 30','pellentesque.sed@parent.net'),
  ('99001','Graviva','Grtout','01 74 57 92 10','generic@lecturer.edu'),
  ('99002','Grarrison','Grasmussen','08 18 67 44 67','lecturer@lecturer.org'),
  ('99003','Grartin','Groodard','01 72 64 23 88','lecturer@lecturer.com'),
  ('99004','Grirk','Grickman','01 77 26 72 41','leolecturer.morbi.neque@lecturer.net'),
  ('99005','Grhadwick','Grguilar','01 44 58 20 35','curlecturersus.purus@lecturer.org'),
  ('99006','Grrent','Greblanc','01 48 80 33 30','pelllecturerentesque.sed@lecturer.net'),
  ('98007','Koopa','Troopa','09 00 04 20 30',' onlystaff@staff.net'),
  ('11511','applicant','deapplicanté','11 11 11 12 00', 'applicant@applicanteer.net');

INSERT INTO student (id, person_id)
VALUES
  ('21111','11111'),
  ('21112','11112'),
  ('21113','11113'),
  ('21114','11114'),
  ('21115','11115'),
  ('21116','11116'),
  ('21117','11117'),
  ('21118','11118'),
  ('21119','11119'),
  ('21120','11120'),
  ('21121','11121'),
  ('21122','11122'),
  ('21123','11123'),
  ('21124','11124'),
  ('21125','11125'),
  ('21126','11126'),
  ('21127','11127'),
  ('21128','11128'),
  ('21129','11129'),
  ('21130','11130'),
  ('21131','11131'),
  ('21132','11132'),
  ('21133','11133');

INSERT INTO sibling (person_id, student_id)
VALUES
  ('11111','21112'),
  ('11112','21111');


INSERT INTO guardian (person_id, student_id)
VALUES
  ('500001','21111'),
  ('500002','21112'),
  ('500003','21113'),
  ('500004','21114'),
  ('500005','21115'),
  ('500006','21116'),
  ('500007','21117'),
  ('500008','21118'),
  ('500009','21119'),
  ('500010','21120'),
  ('500011','21121'),
  ('500012','21122'),
  ('500013','21123'),
  ('500014','21124'),
  ('500015','21125'),
  ('500016','21126'),
  ('500017','21127'),
  ('500018','21128'),
  ('500019','21129'),
  ('500020','21130'),
  ('500021','21131'),
  ('500022','21132');


INSERT INTO instructor (id, can_teach_ensemble, person_id)
VALUES
('91901','FALSE','99001'),
('91902','TRUE','99002'),
('91903','FALSE','99003'),
('91904','FALSE','99004'),
('91905','TRUE','99005'),
('91906','TRUE','99006');

INSERT INTO staff (id,person_id)
VALUES 
('91807','98007');

INSERT INTO skill_level (id, skill_level)
VALUES
 ('18001','Beginner'),
 ('18002','Intermediate'),
 ('18003','Advanced');


INSERT INTO instrument(id,instrument_type)
VALUES
  ('17001','keyboard'),
  ('17002','violin'),
  ('17003','trumpet'),
  ('17004','drums'),
  ('17005','clarinet'); 

INSERT INTO application (person_id,instrument_id,skill_level_id)
VALUES 
('11511','17002','18002');

INSERT INTO student_skill_instrument (student_id,instrument_id,skill_level_id)
VALUES
  ('21111','17001','18001'),
  ('21112','17003','18002'),
  ('21113','17001','18001'),
  ('21114','17002','18003'),
  ('21115','17003','18001'),
  ('21116','17001','18003'),
  ('21117','17003','18003'),
  ('21118','17005','18001'),
  ('21119','17002','18003'),
  ('21120','17001','18001'),
  ('21121','17002','18002'),
  ('21122','17001','18003'),
  ('21123','17002','18001'),
  ('21124','17005','18003'),
  ('21125','17004','18003'),
  ('21126','17001','18001'),
  ('21127','17003','18003'),
  ('21128','17004','18001'),
  ('21129','17005','18003'),
  ('21130','17003','18002'),
  ('21131','17003','18001'),
  ('21132','17005','18003'),
  ('21133','17003','18002');

INSERT INTO instrument_rented (instrument_id, student_id, lease_period, instrument_price, instrument_brand)
VALUES
('17001','21111','01/01/2021-01/01/2022','100','Brand1'),
('17002','21112','01/02/2021-01/02/2022','100','Brand2');

INSERT INTO instrument_taught (instrument_id,instructor_id)
VALUES
('17001','919001'),
('17002','919001'),
('17003','919001'),
('17001','919002'),
('17003','919003'),
('17003','919004'),
('17004','919004'),
('17004','919006'),
('17005','919006');

INSERT INTO genre (id, genre)
VALUES
('19001','Rock'),
('19002','Jazz'),
('19003','Grunge'),
('19004','Hip-Hop'),
('19005','RnB');

INSERT INTO lesson (id, staff_id, timeframe,skill_level_id,instrument_id)
VALUES
('20001','91807','Monday 8:00-10:00','18001','17001'),
('21001','91807','Monday 10:00-12:00','18002','17002');


INSERT INTO group_lesson (lesson_id,schedule,min_students,max_students,price,price_discounted)
VALUES
('20001','Every monday 08:00-10:00','1','10','150','100');


INSERT INTO individual_lesson (lesson_id,price,price_discounted)
VALUES
('21001','150','100');

INSERT INTO ensemble (id, staff_id, min_students,max_students,price,price_discounted,schedule,genre_id)
VALUES
('22001','91807','3','6','200','150','Every thursday 08:00-10:00','19002');

INSERT INTO scheduled_ensemble (ensemble_id,student_id,instructor_id)
VALUES
('22001','21119','99005');

INSERT INTO scheduled_group_lesson(lesson_id,student_id,instructor_id) 
VALUES
('21001','21118','99004');

INSERT INTO booked_individual_lesson(lesson_id,student_id,instructor_id) 
VALUES
('20001','21117','99006');

