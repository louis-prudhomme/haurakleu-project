

CREATE OR REPLACE PROCEDURE doc_print
(p_id_user NUMBER, p_id_report NUMBER)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    result NUMBER;
BEGIN
    result := is_allowed(p_id_user, p_id_report, 1);
    IF result = 1 THEN
        UPDATE report_analysis SET prints = prints + 1 WHERE id_report = p_id_report;
        COMMIT;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE doc_copy
(p_id_user NUMBER, p_id_report NUMBER)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    result NUMBER;
BEGIN
    result := is_allowed(p_id_user, p_id_report, 1);
    IF result = 1 THEN
        UPDATE report_analysis SET copies = copies + 1 WHERE id_report = p_id_report;
        COMMIT;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE doc_download
(p_id_user NUMBER, p_id_report NUMBER)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    result NUMBER;
BEGIN
    result := is_allowed(p_id_user, p_id_report, 1);
    IF result = 1 THEN
        UPDATE report_analysis SET downloads = downloads + 1 WHERE id_report = p_id_report;
        COMMIT;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE doc_consult
(p_id_user NUMBER, p_id_report NUMBER)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    result NUMBER;
BEGIN
    result := is_allowed(p_id_user, p_id_report, 2);
    IF result = 1 THEN
        UPDATE report_analysis SET consults = consults + 1 WHERE id_report = p_id_report;
        COMMIT;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE delete_intermediary_reports
(p_id_report NUMBER, p_submitted DATE, p_id_student NUMBER, p_id_instructions NUMBER)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    subm DATE;
    stud NUMBER;
    inst NUMBER;
BEGIN
    DELETE FROM report
        WHERE id <> p_id_report
        AND submitted <= p_submitted
        AND id_student = p_id_student
        AND id_instructions = p_id_instructions;
        
    COMMIT;
END;
/

