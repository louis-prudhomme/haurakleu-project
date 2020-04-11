-- drops everything in the database
-- triggers
DROP TRIGGER trg_adt_report;
DROP TRIGGER trg_adt_keyword;
DROP TRIGGER trg_report_deadline;
DROP TRIGGER trg_report_validation;
DROP TRIGGER trg_teacher_hired_date;
DROP TRIGGER trg_student_promotion;

-- procedures
DROP PROCEDURE prc_delete_intermediary_reports;
DROP PROCEDURE prc_report_download;
DROP PROCEDURE prc_report_consult;
DROP PROCEDURE prc_report_copy;
DROP PROCEDURE prc_report_print;

-- functions
DROP FUNCTION fun_is_allowed;
DROP FUNCTION fun_reports_by_keyword;
DROP FUNCTION fun_most_wanted_keywords;

-- data tables, relations tables and audit tables
DROP TABLE adt_keyword;
DROP TABLE adt_report;
DROP TABLE rel_has;
DROP TABLE tab_keyword;
DROP TABLE tab_report;
DROP TABLE rel_performs;
DROP TABLE tab_student;
DROP TABLE tab_major;
DROP TABLE rel_teaches;
DROP TABLE tab_teacher;
DROP TABLE tab_company_tutor;
DROP TABLE tab_study_level;
DROP TABLE tab_teaching_field;
DROP TABLE tab_confidentiality_level;
DROP TABLE tab_company;
DROP TABLE tab_instructions;
DROP TABLE tab_user;

