-- this trigger checks that every final report has at least one keyword
CREATE OR REPLACE TRIGGER trg_report_validation
AFTER update OR insert
ON tab_report
FOR EACH ROW
-- fires only when the report becomes final
WHEN (new.is_company_vetted = 1 AND new.is_pedag_vetted = 1)
DECLARE
    ln_keyword_count INT;
    le_not_enough_keywords EXCEPTION;
BEGIN
    SELECT count(id_keyword)
        INTO ln_keyword_count
        FROM rel_has
        WHERE id_report = :new.id;

    IF ln_keyword_count < 1 THEN
        RAISE le_not_enough_keywords;
    END IF;

    -- if it has at least one keyword, we also delete intermediary reports
    prc_delete_intermediary_reports(:new.id, :new.submitted, :new.id_student, :new.id_instructions);
EXCEPTION
    WHEN le_not_enough_keywords THEN
        RAISE_APPLICATION_ERROR(-20005, 'Expected at least one tab_keyword for this report.');
END;
/

-- checks if no teacher hire date is in the future
CREATE OR REPLACE TRIGGER trg_teacher_hired_date
BEFORE INSERT OR UPDATE ON tab_teacher
FOR EACH ROW
DECLARE
    le_hired_date_exception EXCEPTION;
BEGIN
    IF :new.hired > SYSDATE THEN
        RAISE le_hired_date_exception;
    END IF;

EXCEPTION
    WHEN le_hired_date_exception THEN
        RAISE_APPLICATION_ERROR(-20003, 'The hired date can not be in the future.');
END;
/

-- checks if the report is submitted before its deadline
CREATE OR REPLACE TRIGGER trg_report_deadline
BEFORE INSERT OR UPDATE OF submitted ON tab_report
FOR EACH ROW
DECLARE
    le_deadline_overdue EXCEPTION;
    ld_deadline_report DATE;
BEGIN
    SELECT DEADLINE
        INTO ld_deadline_report
        FROM tab_instructions
        WHERE tab_instructions.id = :new.id_instructions;

    IF :new.submitted > ld_deadline_report THEN
        RAISE le_deadline_overdue;
    END IF;

EXCEPTION
    WHEN le_deadline_overdue THEN
        RAISE_APPLICATION_ERROR(-20002, 'The tab_report is late, the deadline is over.');
END;
/

-- creates a matching audit record for each report
CREATE OR REPLACE TRIGGER trg_adt_report
AFTER INSERT ON tab_report
FOR EACH ROW
BEGIN
    INSERT INTO adt_report (id_report)
        VALUES (:new.id);
END;
/

-- creates a matching audit record for each keyword
CREATE OR REPLACE TRIGGER trg_adt_keyword
AFTER INSERT ON tab_keyword
FOR EACH ROW
BEGIN
    INSERT INTO adt_keyword (id_keyword)
        VALUES (:new.id);
END;
/

