CREATE OR REPLACE FUNCTION is_allowed
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    chk_prms NUMBER;
    conf NUMBER;
    us_my NUMBER;
    state NUMBER;
    is_part NUMBER;
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
        RETURN -1;
    END IF;

    SELECT id_conf_level
        INTO conf 
        FROM report
        WHERE id = p_id_report;

    IF conf <> 1 THEN
        RETURN -2;
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
            
    IF us_my = 0 AND is_part < 1 THEN
        RETURN -3;
    ELSIF state < 2 AND is_part < 1 THEN
        RETURN -4;
    ELSE
        RETURN 0;
    END IF;
END;
/

CREATE OR REPLACE FUNCTION doc_print
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    result NUMBER;
BEGIN
    result := is_allowed(p_id_user, p_id_report);
    IF result = 0 THEN
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
    IF result = 0 THEN
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
    IF result = 0 THEN
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
    IF result = 0 THEN
        UPDATE report_analysis SET consults = consults + 1 WHERE id_report = p_id_report;
        COMMIT;
    END IF;
    RETURN result;
END;
/
