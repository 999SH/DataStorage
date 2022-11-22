


INSERT INTO person (id,first_name,last_name,phone_nr,email)
VALUES
  ('11111','Isabelle','Dejesus','08 52 11 40 72','nunc@student.net'),
  ('11112','Iola','Woods','09 19 58 50 55','rhoncus.donec.est@student.edu'),
  ('11113','Lunea','Kirkland','03 11 26 14 29','erat.vitae@student.edu'),
  ('11114','Sierra','Emerson','03 84 54 76 07','risus.donec.nibh@student.com'),
  ('11115','Otto','Barber','02 17 84 83 43','arcu.morbi@student.ca'),
  ('11116','Signe','Rice','03 72 58 06 23','nunc@aol.student'),
  ('11117','Marah','Maldonado','01 73 38 75 48','ultrices.a@student.org'),
  ('11118','Teagan','Hampton','06 54 43 61 15','consectetuer@student.net'),
  ('68249','Andrew','Tate','05 32 17 52 02','ullamcorper.duis@parent.net'),
  ('24456','Drake','Casey','04 27 41 51 71','consequat.lectus@teacher.org'),
  ('21302','Maya','Farrell','03 68 26 43 21','ac.sem.ut@teacher.org'),
  ('52339','Lee','David','08 84 34 85 95','lectus.pede.ultrices@teacher.ca'),
  ('63667','Simon','Gray','03 93 78 86 61','purus.duis.elementum@teacher.edu'),
  ('82649','Kelsey','Norton','02 11 34 79 42','est@teacher.com'),
  ('25261','Davis','Hopkins','04 84 81 20 17','fringilla.ornare@teacher.edu');



INSERT INTO instrument (id,instrument_type)
VALUES
  ('9204825812','keyboard'),
  ('5636516585','violin'),
  ('1183724387','trumpet'),
  ('1361621115','drums'),
  ('9634857723','clarinet');


INSERT INTO student (id,person_id)
  ('21111','11111'),
  ('21112','11112'),
  ('21113','11113'),
  ('21114','11114'),
  ('21115','11115'),
  ('21116','11116'),
  ('21117','11117'),
  ('21118','11118');

INSERT INTO sibling (person_id , student_id)
  ('11111','21112'),
  ('11112','21111'),


INSERT INTO guardian (person_id , student_id)
  ('68249','21111'),
  ('68249','21112'),
  ('68249','21113'),
  ('68249','21114'),
  ('68249','21115'),
  ('68249','21116'),
  ('68249','21117'),
  ('68249','21118');

