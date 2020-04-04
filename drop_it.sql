DROP TRIGGER insert_report_analysis;
DROP TRIGGER insert_audit_keyword;
DROP TRIGGER deadline_validation;
DROP TRIGGER report_validation;
DROP TRIGGER check_hired_date;

DROP PROCEDURE delete_intermediary_reports;
DROP PROCEDURE doc_download;
DROP PROCEDURE doc_consult;
DROP PROCEDURE doc_copy;
DROP PROCEDURE doc_print;

DROP FUNCTION is_allowed;
DROP FUNCTION get_report_by_keyword;
DROP FUNCTION get_most_wanted_reports;

DROP TABLE audit_keyword;
DROP TABLE audit_report;
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

