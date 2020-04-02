CREATE OR REPLACE FUNCTION is_allowed
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    return_val NUMBER;
BEGIN
    DECLARE
        chk_prms NUMBER;
        conf NUMBER;
        us_my NUMBER;
        state NUMBER;
        is_part NUMBER;

        no_record_found EXCEPTION;
        confidentiality_prohibits EXCEPTION;
        report_not_validated EXCEPTION;
        not_my_user EXCEPTION;
    BEGIN
        SELECT count(id)
            INTO chk_prms 
            FROM report
            WHERE id = p_id_report;
        SELECT count(id) + chk_prms
            INTO chk_prms 
            FROM user_t
            WHERE id = p_id_user;
        IF chk_prms <> 2 THEN
            RAISE no_record_found;
        END IF;

        SELECT id_conf_level
            INTO conf 
            FROM report
            WHERE id = p_id_report;

        IF conf <> 1 THEN
            RAISE confidentiality_prohibits;
        END IF;

        SELECT is_my_user 
            INTO us_my 
            FROM user_t 
            WHERE id = p_id_user;
        SELECT is_company_vetted + is_pedag_vetted
            INTO state
            FROM report 
            WHERE id = p_id_report;
        SELECT count(id) 
            INTO is_part 
            FROM report 
            WHERE id = p_id_report
                AND (id_student = p_id_user 
                OR id_pedag_tutor = p_id_user 
                OR id_company_tutor = p_id_user);
                
        IF state < 2 AND is_part < 1 THEN
            RAISE report_not_validated;
        ELSIF us_my = 0 AND is_part < 1 THEN
            RAISE not_my_user;
        ELSE
            return_val := 1;
        END IF;
    EXCEPTION
        WHEN no_record_found THEN
            DBMS_OUTPUT.PUT_LINE('No matching records were found for either the provided report id or student id, or both.');
            return_val := 0;
        WHEN confidentiality_prohibits THEN
            DBMS_OUTPUT.PUT_LINE('Confidentiality settings disable this action.');
            return_val := 0;
        WHEN report_not_validated THEN
            DBMS_OUTPUT.PUT_LINE('The report has not been validated, action aborted.');
            return_val := 0;
        WHEN not_my_user THEN
            DBMS_OUTPUT.PUT_LINE('User must be a user of My Efrei.');
            return_val := 0;
    END;

RETURN return_val;

END is_allowed;
/

CREATE OR REPLACE FUNCTION doc_print
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    result NUMBER;
BEGIN
    result := is_allowed(p_id_user, p_id_report);
    IF result = 1 THEN
        UPDATE report_analysis SET prints = prints + 1 WHERE id_report = p_id_report;
        COMMIT;
    END IF;
    RETURN result;
END;
/

CREATE OR REPLACE FUNCTION doc_copy
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    result NUMBER;
BEGIN
    result := is_allowed(p_id_user, p_id_report);
    IF result = 1 THEN
        UPDATE report_analysis SET copies = copies + 1 WHERE id_report = p_id_report;
        COMMIT;
    END IF;
    RETURN result;
END;
/

CREATE OR REPLACE FUNCTION doc_download
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    result NUMBER;
BEGIN
    result := is_allowed(p_id_user, p_id_report);
    IF result = 1 THEN
        UPDATE report_analysis SET downloads = downloads + 1 WHERE id_report = p_id_report;
        COMMIT;
    END IF;
    RETURN result;
END;
/

CREATE OR REPLACE FUNCTION doc_consult
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    result NUMBER;
BEGIN
    result := is_allowed(p_id_user, p_id_report);
    IF result = 1 THEN
        UPDATE report_analysis SET consults = consults + 1 WHERE id_report = p_id_report;
        COMMIT;
    END IF;
    RETURN result;
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

