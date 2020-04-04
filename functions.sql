CREATE OR REPLACE FUNCTION is_allowed
(p_id_user NUMBER, p_id_report NUMBER, p_conf_level NUMBER)
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

        IF conf > p_conf_level THEN
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
            RAISE_APPLICATION_ERROR(-20010, 'No matching records were found for either the provided report id or student id, or both.');
            RETURN -1;
        WHEN confidentiality_prohibits THEN
            RAISE_APPLICATION_ERROR(-20011, 'Confidentiality settings disable this action.');
            RETURN -1;
        WHEN report_not_validated THEN
            RAISE_APPLICATION_ERROR(-20012, 'The report has not been validated, action aborted.');
            RETURN -1;
        WHEN not_my_user THEN
            RAISE_APPLICATION_ERROR(-20013, 'User must be a user of My Efrei.');
            RETURN -1;
    END;

RETURN return_val;

END is_allowed;
/

CREATE OR REPLACE FUNCTION get_report_by_keyword
(p_keyword VARCHAR2)
RETURN SYS_REFCURSOR
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    report_keyword SYS_REFCURSOR;
    id_word INT;
    nb_audit INT;
BEGIN
    SELECT id 
        INTO id_word 
        FROM keyword 
        WHERE word = p_keyword;

    OPEN report_keyword FOR 
        SELECT r.id AS id, r.title AS title 
            FROM has h, report r 
            WHERE h.id_keyword = id_word 
            AND h.id_report = r.id 
            ORDER BY r.title;

    UPDATE audit_keyword 
        SET nb_research = nb_research + 1 
        WHERE id_keyword = id_word;
    COMMIT;
    RETURN report_keyword;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20004, 'Keyword not found');
            RETURN NULL;  
END get_report_by_keyword;
/

CREATE OR REPLACE FUNCTION get_most_wanted_reports
(p_top NUMBER)
RETURN SYS_REFCURSOR
AS
    most_wanted_keyword SYS_REFCURSOR;
BEGIN
    OPEN most_wanted_keyword
        FOR SELECT * FROM (
                SELECT k.id AS id, k.word AS title, a.nb_research 
                    FROM keyword k, audit_keyword a 
                    WHERE k.id = a.id_keyword 
                    ORDER BY a.nb_research DESC)
            WHERE ROWNUM <= p_top;     
    RETURN most_wanted_keyword;
END get_most_wanted_reports;
/

