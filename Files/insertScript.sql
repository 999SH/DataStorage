


INSERT INTO person (id,first_name,last_name,phone_nr,email)
VALUES
  ('1111111111','Isabelle','Dejesus','08 52 11 40 72','nunc@student.net'),
  ('1111111112','Iola','Woods','09 19 58 50 55','rhoncus.donec.est@student.edu'),
  ('1111111113','Lunea','Kirkland','03 11 26 14 29','erat.vitae@student.edu'),
  ('1111111114','Sierra','Emerson','03 84 54 76 07','risus.donec.nibh@student.com'),
  ('1111111115','Otto','Barber','02 17 84 83 43','arcu.morbi@student.ca'),
  ('1111111116','Signe','Rice','03 72 58 06 23','nunc@aol.student'),
  ('1111111117','Marah','Maldonado','01 73 38 75 48','ultrices.a@student.org'),
  ('1111111118','Teagan','Hampton','06 54 43 61 15','consectetuer@student.net'),
  ('6624528249','Andrew','Tate','05 32 17 52 02','ullamcorper.duis@parent.net'),
  ('2950984456','Drake','Casey','04 27 41 51 71','consequat.lectus@teacher.org'),
  ('2754521302','Maya','Farrell','03 68 26 43 21','ac.sem.ut@teacher.org'),
  ('5886032339','Lee','David','08 84 34 85 95','lectus.pede.ultrices@teacher.ca'),
  ('6212803667','Simon','Gray','03 93 78 86 61','purus.duis.elementum@teacher.edu'),
  ('8236862649','Kelsey','Norton','02 11 34 79 42','est@teacher.com'),
  ('2068955261','Davis','Hopkins','04 84 81 20 17','fringilla.ornare@teacher.edu');



INSERT INTO instrument (id,instrument_type)
VALUES
  ('9204825812','keyboard'),
  ('5636516585','violin'),
  ('1183724387','trumpet'),
  ('1361621115','drums'),
  ('9634857723','clarinet');


INSERT INTO student (id,person_id)
  ('2111111111','1111111111'),
  ('2111111112','1111111112'),
  ('2111111113','1111111113'),
  ('2111111114','1111111114'),
  ('2111111115','1111111115'),
  ('2111111116','1111111116'),
  ('2111111117','1111111117'),
  ('2111111118','1111111118');

INSERT INTO sibling (person_id , student_id)
  ('1111111111','2111111112'),
  ('1111111112','2111111111'),


INSERT INTO guardian (person_id , student_id)
  ('6624528249','2111111112'),
  ('6624528249','2111111111'),
  ('6624528249','2111111113'),
  ('6624528249','2111111114'),
  ('6624528249','2111111115'),
  ('6624528249','2111111116'),
  ('6624528249','2111111117'),
  ('6624528249','2111111118');

