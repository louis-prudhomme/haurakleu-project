CREATE OR REPLACE FUNCTION doc_print
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    conf NUMBER;
    us_my NUMBER;
    state NUMBER;
    is_part NUMBER;
BEGIN
    SELECT id_conf_level
        INTO conf 
        FROM report
        WHERE id = p_id_report;
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
    IF conf <> 1 THEN
        RETURN -1;
    ELSIF us_my = 0 AND is_part < 1 THEN
        RETURN -2;
    ELSIF state < 2 AND is_part < 1 THEN
        RETURN -3;
    ELSE
        RETURN 0;
    END IF;
END;
/

CREATE OR REPLACE FUNCTION doc_copy
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    result NUMBER;
BEGIN
    SELECT doc_print(p_id_user, p_id_report) INTO result FROM DUAL;
    RETURN result;
END;
/

CREATE OR REPLACE FUNCTION doc_download
(p_id_user NUMBER, p_id_report NUMBER)
RETURN NUMBER
AS
    result NUMBER;
BEGIN
    SELECT doc_print(p_id_user, p_id_report) INTO result FROM DUAL;
    RETURN result;
END;
/

