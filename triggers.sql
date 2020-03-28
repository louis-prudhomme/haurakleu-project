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
