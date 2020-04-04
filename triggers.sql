CREATE OR REPLACE TRIGGER report_validation
AFTER update OR insert
ON report
FOR EACH ROW
WHEN (new.is_company_vetted = 1 AND new.is_pedag_vetted = 1)
DECLARE
    keyword_count NUMBER;
    not_enough_keywords EXCEPTION;
BEGIN
    SELECT count(id_keyword) INTO keyword_count FROM has WHERE id_report = :NEW.id;
    IF keyword_count < 1 THEN
        RAISE not_enough_keywords;
    END IF;
    delete_intermediary_reports(:new.id, :new.submitted, :new.id_student, :new.id_instructions);
EXCEPTION
    WHEN not_enough_keywords THEN
        RAISE_APPLICATION_ERROR(-20010, 'Expected at least one keyword for this report.');
END;
/

CREATE OR REPLACE TRIGGER check_hired_date
BEFORE INSERT OR UPDATE ON TEACHER
FOR EACH ROW
DECLARE
    HIRED_DATE_EXCEPTION EXCEPTION;
BEGIN
    IF :NEW.HIRED > SYSDATE THEN 
        RAISE HIRED_DATE_EXCEPTION;
    END IF;
   
EXCEPTION
    WHEN HIRED_DATE_EXCEPTION THEN 
        RAISE_APPLICATION_ERROR(-20002, 'THE HIRED DATE CANT BE IN THE FUTURE');
END;
/

CREATE OR REPLACE TRIGGER deadline_validation
BEFORE INSERT OR UPDATE OF submitted ON report
FOR EACH ROW
DECLARE 
    DEADLINE_EXCEPTION EXCEPTION;
    DEADLINE_REPORT DATE;
BEGIN
    SELECT DEADLINE INTO DEADLINE_REPORT FROM INSTRUCTIONS WHERE INSTRUCTIONS.ID = :NEW.ID_INSTRUCTIONS;
    
    IF :NEW.SUBMITTED > DEADLINE_REPORT THEN 
        RAISE DEADLINE_EXCEPTION;
    END IF;

EXCEPTION
    WHEN DEADLINE_EXCEPTION THEN 
        RAISE_APPLICATION_ERROR(-20002, 'THE REPORT IS LATE, THE DEADLINE IS OVER');
END;
/

CREATE OR REPLACE TRIGGER insert_audit_report
AFTER INSERT ON report
FOR EACH ROW
BEGIN
    INSERT INTO audit_report (id_report) 
        VALUES (:new.id);
END;
/

CREATE OR REPLACE TRIGGER insert_audit_keyword
AFTER INSERT ON keyword
FOR EACH ROW
BEGIN
    INSERT INTO audit_keyword (id_keyword) 
        VALUES (:new.id);
END;
/

