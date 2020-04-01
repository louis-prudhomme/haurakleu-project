DROP TABLE report_analysis;
DROP TABLE has;
DROP TABLE keyword;
DROP TABLE report;
DROP TABLE performs;
DROP TABLE student;
DROP TABLE major;
DROP TABLE teaches;
DROP TABLE teacher;
DROP TABLE company_tutor;
DROP TABLE study_level;
DROP TABLE teaching_field;
DROP TABLE conf_level;
DROP TABLE company;
DROP TABLE instructions;
DROP TABLE user_t;

CREATE TABLE user_t
(id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,first_name VARCHAR2(64)
,last_name VARCHAR2(64)
,avatar_path VARCHAR2(256)
,phone_number CHAR(10)
,email VARCHAR2(256)
,password VARCHAR(128)
,is_my_user INT DEFAULT 0 CHECK (is_my_user IN (0, 1))
,CONSTRAINT check_email CHECK (email LIKE '%@%.%' AND email NOT LIKE '@%' AND email NOT LIKE '%@%@%')
,CONSTRAINT check_phone_number CHECK (REGEXP_LIKE(phone_number, '^((\+)33|0)[1-9](\d{2}){4}$'))
);

CREATE TABLE instructions
(id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,guidelines VARCHAR2(512)
,deadline DATE
);

CREATE TABLE company
(id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,name VARCHAR2(64)
);

CREATE TABLE conf_level
(id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,label VARCHAR2(64)
);

CREATE TABLE teaching_field
(id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,label VARCHAR2(64)
);

CREATE TABLE study_level
(id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,label VARCHAR2(64)
);

CREATE TABLE company_tutor
(id INT NOT NULL PRIMARY KEY
,job VARCHAR2(64)
,CONSTRAINT inherit_user_tutor FOREIGN KEY (id) REFERENCES user_t (id)
);

CREATE TABLE teacher
(id INT NOT NULL PRIMARY KEY
,hired DATE
,CONSTRAINT inherit_user_teacher FOREIGN KEY (id) REFERENCES user_t (id)
);

CREATE TABLE teaches
(id_teacher INT NOT NULL
,id_field INT NOT NULL
,CONSTRAINT fk_teaches_teacher FOREIGN KEY (id_teacher) REFERENCES teacher (id)
,CONSTRAINT fk_teaches_field FOREIGN KEY (id_field) REFERENCES teaching_field (id)
,CONSTRAINT pk_teaches PRIMARY KEY (id_teacher, id_field)
);

CREATE TABLE major
(id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,label VARCHAR2(64)
,id_major_director INT NOT NULL
,CONSTRAINT fk_major_director FOREIGN KEY (id_major_director) REFERENCES teacher (id)
);

CREATE TABLE student
(id INT NOT NULL PRIMARY KEY
,promotion INT CHECK (promotion BETWEEN 1936 AND 2154)
,is_apprentice INT DEFAULT 0 CHECK (is_apprentice IN (0, 1))
,id_major INT NOT NULL
,id_study_level INT NOT NULL
,CONSTRAINT inherit_user_student FOREIGN KEY (id) REFERENCES user_t (id)
,CONSTRAINT fk_student_major FOREIGN KEY (id_major) REFERENCES major (id)
,CONSTRAINT fk_student_level FOREIGN KEY (id_study_level) REFERENCES study_level (id)
);

CREATE TABLE performs
(id_student INT NOT NULL
,id_instructions INT NOT NULL
,CONSTRAINT fk_performs_student FOREIGN KEY (id_student) REFERENCES student (id)
,CONSTRAINT fk_performs_instructions FOREIGN KEY (id_instructions) REFERENCES instructions (id)
,CONSTRAINT pk_performs PRIMARY KEY (id_student, id_instructions)
);

CREATE TABLE report
(id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,title VARCHAR2(64)
,submitted DATE DEFAULT SYSDATE
,is_pedag_vetted INT DEFAULT 0 CHECK (is_pedag_vetted IN (0, 1))
,is_company_vetted INT DEFAULT 0 CHECK (is_company_vetted IN (0, 1))
,id_student INT NOT NULL
,id_company INT NOT NULL
,id_pedag_tutor INT NOT NULL
,id_company_tutor INT NOT NULL
,id_conf_level INT NOT NULL
,id_instructions INT NOT NULL
,CONSTRAINT fk_report_student FOREIGN KEY (id_student) REFERENCES student (id)
,CONSTRAINT fk_report_company FOREIGN KEY (id_company) REFERENCES company (id)
,CONSTRAINT fk_report_teacher FOREIGN KEY (id_pedag_tutor) REFERENCES teacher (id)
,CONSTRAINT fk_report_comp_tutor FOREIGN KEY (id_company_tutor) REFERENCES company_tutor (id)
,CONSTRAINT fk_report_conf_level FOREIGN KEY (id_conf_level) REFERENCES conf_level (id)
,CONSTRAINT fk_report_instructions FOREIGN KEY (id_instructions) REFERENCES instructions (id)
);

CREATE TABLE keyword
(id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY
,word VARCHAR2(32)
);

CREATE TABLE has
(id_report INT NOT NULL
,id_keyword INT NOT NULL
,CONSTRAINT fk_has_report FOREIGN KEY (id_report) REFERENCES report (id) ON DELETE CASCADE
,CONSTRAINT fk_has_keyword FOREIGN KEY (id_keyword) REFERENCES keyword (id)
,CONSTRAINT pk_has PRIMARY KEY (id_report, id_keyword)
);

CREATE TABLE report_analysis
(id_report INT NOT NULL
,consults INT DEFAULT 0
,copies INT DEFAULT 0
,prints INT DEFAULT 0
,downloads INT DEFAULT 0
,CONSTRAINT fk_report_analysis FOREIGN KEY (id_report) REFERENCES report (id) ON DELETE CASCADE
,CONSTRAINT pk_report_analysis PRIMARY KEY (id_report)
);