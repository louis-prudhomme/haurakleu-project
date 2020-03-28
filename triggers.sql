CREATE OR REPLACE TRIGGER report_validation
AFTER update OR insert
ON report
FOR EACH ROW 
WHEN (new.is_company_vetted = 1 AND new.is_pedag_vetted = 1)
BEGIN
    DELETE FROM report 
        WHERE id <> :new.id
        AND submitted <= :new.submitted
        AND id_student = :new.id_student
        AND id_instructions = :new.id_instructions;
END;
/

CREATE OR REPLACE TRIGGER CHECK_HIRED_DATE
BEFORE INSERT OR UPDATE ON TEACHER
FOR EACH ROW
DECLARE
    HIRED_DATE_EXCEPTION EXCEPTION;
BEGIN
    IF :NEW.HIRED > SYSDATE THEN RAISE HIRED_DATE_EXCEPTION;
    END IF;
   
    EXCEPTION
    WHEN HIRED_DATE_EXCEPTION THEN RAISE_APPLICATION_ERROR(-20002, 'THE HIRED DATE CANT BE IN THE FUTURE');
END;
/
