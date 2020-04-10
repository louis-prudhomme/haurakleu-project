CREATE OR REPLACE FUNCTION fun_is_allowed
(pn_id_user NUMBER, pn_id_report NUMBER, pn_conf_level NUMBER)
RETURN NUMBER
AS
    ln_return NUMBER;
BEGIN
    DECLARE
        ln_chk_prms NUMBER;
        ln_chk_conf NUMBER;
        ln_chk_myus NUMBER;
        ln_chk_state NUMBER;
        ln_chk_partof NUMBER;

        le_no_record_found EXCEPTION;
        le_confidentiality_prohibits EXCEPTION;
        le_report_not_validated EXCEPTION;
        le_not_my_user EXCEPTION;
    BEGIN
        SELECT count(id)
            INTO ln_chk_prms
            FROM tab_report
            WHERE id = pn_id_report;

        SELECT count(id) + ln_chk_prms
            INTO ln_chk_prms
            FROM tab_user
            WHERE id = pn_id_user;

        IF ln_chk_prms <> 2 THEN
            RAISE le_no_record_found;
        END IF;

        SELECT id_conf_level
            INTO ln_chk_conf
            FROM tab_report
            WHERE id = pn_id_report;

        IF ln_chk_conf > pn_conf_level THEN
            RAISE le_confidentiality_prohibits;
        END IF;

        SELECT is_my_user
            INTO ln_chk_myus
            FROM tab_user
            WHERE id = pn_id_user;

        SELECT is_company_vetted + is_pedag_vetted
            INTO ln_chk_state
            FROM tab_report
            WHERE id = pn_id_report;

        SELECT count(id)
            INTO ln_chk_partof
            FROM tab_report
            WHERE id = pn_id_report
                AND (id_student = pn_id_user
                OR id_pedag_tutor = pn_id_user
                OR id_company_tutor = pn_id_user);

        IF ln_chk_state < 2 AND ln_chk_partof < 1 THEN
            RAISE le_report_not_validated;
        ELSIF ln_chk_myus = 0 AND ln_chk_partof < 1 THEN
            RAISE le_not_my_user;
        ELSE
            ln_return := 1;
        END IF;

    EXCEPTION
        WHEN le_no_record_found THEN
            RAISE_APPLICATION_ERROR(-20010, 'No matching records were found for either the provided report id or student id, or both.');
            ln_return := -1;
        WHEN le_confidentiality_prohibits THEN
            RAISE_APPLICATION_ERROR(-20011, 'Confidentiality settings disable this action.');
            ln_return := -1;
        WHEN le_report_not_validated THEN
            RAISE_APPLICATION_ERROR(-20012, 'The report has not been validated, action aborted.');
            ln_return := -1;
        WHEN le_not_my_user THEN
            RAISE_APPLICATION_ERROR(-20013, 'User must be a user of My Efrei.');
            ln_return := -1;
    END;

RETURN ln_return;
END fun_is_allowed;
/

CREATE OR REPLACE FUNCTION fun_reports_by_keyword
(pv_keyword VARCHAR2)
RETURN SYS_REFCURSOR
AS
    PRAGMA AUTONOMOUS_TRANSACTION;

    lc_reports SYS_REFCURSOR;
    ln_id_word INT;
BEGIN
    SELECT id
        INTO ln_id_word
        FROM tab_keyword
        WHERE word = pv_keyword;

    OPEN lc_reports FOR
        SELECT r.id AS id, r.title AS title
            FROM rel_has h 
            LEFT JOIN tab_report r
                ON h.id_report = r.id
            WHERE h.id_keyword = ln_id_word
            ORDER BY r.title;

    UPDATE adt_keyword
        SET searches = searches + 1
        WHERE id_keyword = ln_id_word;
    COMMIT;

    RETURN lc_reports;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20004, 'Keyword not found.');
            RETURN NULL;
END fun_reports_by_keyword;
/

CREATE OR REPLACE FUNCTION fun_most_wanted_reports
(pn_take_first NUMBER)
RETURN SYS_REFCURSOR
AS
    lc_most_wanted_keywords SYS_REFCURSOR;
BEGIN
    OPEN lc_most_wanted_keywords
        FOR SELECT * FROM (
                SELECT k.id AS id, k.word AS title, a.searches
                    FROM tab_keyword k
                    LEFT JOIN adt_keyword a 
                        ON k.id = a.id_keyword
                    ORDER BY a.searches DESC)
            WHERE ROWNUM <= pn_take_first;

    RETURN lc_most_wanted_keywords;
END fun_most_wanted_reports;
/

