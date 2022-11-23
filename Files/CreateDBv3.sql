CREATE TABLE person (
 id INT NOT NULL,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 phone_nr VARCHAR(50),
 email VARCHAR(50)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE skill_level (
 id INT NOT NULL,
 skill_level VARCHAR(50)
);

ALTER TABLE skill_level ADD CONSTRAINT PK_skill_level PRIMARY KEY (id);


CREATE TABLE genre (
 id INT NOT NULL,
 genre VARCHAR(50)
);

ALTER TABLE genre ADD CONSTRAINT PK_genre PRIMARY KEY (id);


CREATE TABLE instructor (
 id INT NOT NULL,
 can_teach_ensemble BOOLEAN,
 person_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instrument (
 id INT NOT NULL,
 instrument_type VARCHAR(50)
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


CREATE TABLE instrument_taught (
 instrument_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instrument_taught ADD CONSTRAINT PK_instrument_taught PRIMARY KEY (instrument_id,instructor_id);


CREATE TABLE student (
 id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE staff (
 id INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE staff ADD CONSTRAINT PK_staff PRIMARY KEY (id);


CREATE TABLE lesson (
 id INT NOT NULL,
 staff_id INT,
 timeframe VARCHAR(50),
 skill_level_id INT NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE ensemble (
 id VARCHAR(50) NOT NULL,
 staff_id INT,
 min_students VARCHAR(50),
 max_students VARCHAR(50),
 price VARCHAR(50),
 price_discounted VARCHAR(50),
 schedule VARCHAR(50),
 genre_id INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


CREATE TABLE group_lesson (
 lesson_id INT NOT NULL,
 schedule VARCHAR(50),
 min_students VARCHAR(50),
 max_students VARCHAR(50),
 price VARCHAR(50),
 price_discounted VARCHAR(50)
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE individual_lesson (
 lesson_id INT NOT NULL,
 price VARCHAR(50),
 price_discounted VARCHAR(50)
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_id);


CREATE TABLE scheduled_group_lesson (
 lesson_id INT NOT NULL,
 student_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE scheduled_group_lesson ADD CONSTRAINT PK_scheduled_group_lesson PRIMARY KEY (lesson_id,student_id,instructor_id);


CREATE TABLE scheduled_ensemble (
 ensemble_id VARCHAR(50) NOT NULL,
 student_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE scheduled_ensemble ADD CONSTRAINT PK_scheduled_ensemble PRIMARY KEY (ensemble_id,student_id,instructor_id);


CREATE TABLE application (
 person_id INT NOT NULL,
 instrument_id INT NOT NULL,
 skill_level_id INT NOT NULL
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (person_id,instrument_id);


CREATE TABLE guardian (
 person_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE guardian ADD CONSTRAINT PK_guardian PRIMARY KEY (person_id,student_id);


CREATE TABLE sibling (
 person_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (person_id,student_id);


CREATE TABLE instrument_rented (
 instrument_id INT NOT NULL,
 student_id INT NOT NULL,
 lease_period VARCHAR(50),
 instrument_price VARCHAR(50),
 instrument_brand VARCHAR(50)
);

ALTER TABLE instrument_rented ADD CONSTRAINT PK_instrument_rented PRIMARY KEY (instrument_id,student_id);


CREATE TABLE student_skill_instrument (
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 skill_level_id INT NOT NULL
);

ALTER TABLE student_skill_instrument ADD CONSTRAINT PK_student_skill_instrument PRIMARY KEY (student_id,instrument_id);


CREATE TABLE booked_individual_lesson (
 lesson_id INT NOT NULL,
 student_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE booked_individual_lesson ADD CONSTRAINT PK_booked_individual_lesson PRIMARY KEY (lesson_id,student_id,instructor_id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instrument_taught ADD CONSTRAINT FK_instrument_taught_0 FOREIGN KEY (instrument_id) REFERENCES instrument (id);
ALTER TABLE instrument_taught ADD CONSTRAINT FK_instrument_taught_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE staff ADD CONSTRAINT FK_staff_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (staff_id) REFERENCES staff (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (skill_level_id) REFERENCES skill_level (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (staff_id) REFERENCES staff (id);
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (genre_id) REFERENCES genre (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE scheduled_group_lesson ADD CONSTRAINT FK_scheduled_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES group_lesson (lesson_id);
ALTER TABLE scheduled_group_lesson ADD CONSTRAINT FK_scheduled_group_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE scheduled_group_lesson ADD CONSTRAINT FK_scheduled_group_lesson_2 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE scheduled_ensemble ADD CONSTRAINT FK_scheduled_ensemble_0 FOREIGN KEY (ensemble_id) REFERENCES ensemble (id);
ALTER TABLE scheduled_ensemble ADD CONSTRAINT FK_scheduled_ensemble_1 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE scheduled_ensemble ADD CONSTRAINT FK_scheduled_ensemble_2 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);
ALTER TABLE application ADD CONSTRAINT FK_application_2 FOREIGN KEY (skill_level_id) REFERENCES skill_level (id);


ALTER TABLE guardian ADD CONSTRAINT FK_guardian_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE guardian ADD CONSTRAINT FK_guardian_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE instrument_rented ADD CONSTRAINT FK_instrument_rented_0 FOREIGN KEY (instrument_id) REFERENCES instrument (id);
ALTER TABLE instrument_rented ADD CONSTRAINT FK_instrument_rented_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE student_skill_instrument ADD CONSTRAINT FK_student_skill_instrument_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_skill_instrument ADD CONSTRAINT FK_student_skill_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);
ALTER TABLE student_skill_instrument ADD CONSTRAINT FK_student_skill_instrument_2 FOREIGN KEY (skill_level_id) REFERENCES skill_level (id);


ALTER TABLE booked_individual_lesson ADD CONSTRAINT FK_booked_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES individual_lesson (lesson_id);
ALTER TABLE booked_individual_lesson ADD CONSTRAINT FK_booked_individual_lesson_1 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE booked_individual_lesson ADD CONSTRAINT FK_booked_individual_lesson_2 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


