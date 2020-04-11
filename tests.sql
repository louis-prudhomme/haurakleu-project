-- Tests : 
COMMIT;

-- we select the number of views before
SELECT tab_keyword.word, adt_keyword.searches
    FROM adt_keyword
    LEFT JOIN tab_keyword
        ON tab_keyword.id = adt_keyword.id_keyword
    WHERE tab_keyword.word = 'JEE';

-- test get report by keyword
SET SERVEROUTPUT ON SIZE 1000000
DECLARE
    lc_results SYS_REFCURSOR;
    ln_id_keyword NUMBER;
    lv_title_keyword VARCHAR2(64);
BEGIN
    lc_results := fun_reports_by_keyword('JEE');

    LOOP
        FETCH lc_results
            INTO ln_id_keyword, lv_title_keyword;
            EXIT WHEN lc_results%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(ln_id_keyword || ' | ' || lv_title_keyword);
    END LOOP;
    CLOSE lc_results;
END;
/

-- we select the number of views after (a view has been gained from the previous instruction)
SELECT tab_keyword.word, adt_keyword.searches
    FROM adt_keyword
    LEFT JOIN tab_keyword
        ON tab_keyword.id = adt_keyword.id_keyword
    WHERE tab_keyword.word = 'JEE';

-- selecting the ten most searched keywords
SELECT tab_keyword.word, adt_keyword.searches
    FROM adt_keyword
    LEFT JOIN tab_keyword
        ON tab_keyword.id = adt_keyword.id_keyword
    WHERE ROWNUM < 10
    ORDER BY adt_keyword.searches DESC;

-- trying to select a keyword that doesnt exist, will raise an exception
SET SERVEROUTPUT ON SIZE 1000000
DECLARE
    lc_results SYS_REFCURSOR;
    ln_id_keyword NUMBER;
    lv_title_keyword VARCHAR2(64);
BEGIN
    lc_results := fun_reports_by_keyword('idontexist');

    LOOP
        FETCH lc_results
            INTO ln_id_keyword, lv_title_keyword;
            EXIT WHEN lc_results%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(ln_id_keyword || ' | ' || lv_title_keyword);
    END LOOP;
    CLOSE lc_results;
END;
/

-- test get most wanted reports
SET SERVEROUTPUT ON SIZE 1000000
DECLARE
    lc_results SYS_REFCURSOR;
    ln_id_keyword NUMBER;
    lv_title_keyword VARCHAR2(64);
    ln_researches_keyword NUMBER;
BEGIN
    lc_results := fun_most_wanted_keywords(5);

    LOOP
        FETCH lc_results
            INTO ln_id_keyword, lv_title_keyword, ln_researches_keyword;
            EXIT WHEN lc_results%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('id tab_keyword : '|| ln_id_keyword || ' | ' || 'word : ' || lv_title_keyword || ' | ' || 'nb search : '|| ln_researches_keyword);
    END LOOP;
    CLOSE lc_results;
END;
/

-- select the most consulted reports before consulting one
SELECT tab_report.id, tab_report.title, adt_report.consults
    FROM tab_report
    LEFT JOIN adt_report
        ON tab_report.id = adt_report.id_report
    WHERE ROWNUM < 10
    ORDER BY adt_report.consults DESC;

-- consulting a report
BEGIN
    prc_report_consult(20, 1);
END;
/

-- select the most consulted reports after is has been updated
SELECT tab_report.id, tab_report.title, adt_report.consults
    FROM tab_report
    LEFT JOIN adt_report
        ON tab_report.id = adt_report.id_report
    WHERE ROWNUM < 10
    ORDER BY adt_report.consults DESC;

-- trying to consult the same report wit another user will raise an exception because it has not been validated and this user hasn’t partticpated in the tab_report
BEGIN
    prc_report_consult(1, 1);
END;
/

-- trying to insert a validated the report without keywords crashes
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1613 Ovjig Pass', 1, 1, 18, 6, 12, 3, 2, 2);

-- inserting it not validated
INSERT INTO tab_report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1613 Ovjig Pass', 1, 0, 18, 6, 12, 3, 2, 2);

--adding the keyword
INSERT INTO rel_has VALUES((SELECT max(id) FROM tab_report), 1);

-- updating the report to validate it
UPDATE tab_report SET is_company_vetted = 1
    WHERE id = (SELECT max(id) FROM tab_report);

-- displaying the report
SELECT * FROM tab_report
    WHERE id = (SELECT max(id) FROM tab_report);

COMMIT;

-- consulting this tab_report is autorized because its confidentiality is <= 2
DECLARE
    ln_last_report INT;
    ln_last_report_student INT;
BEGIN
    SELECT max(id)
        INTO ln_last_report
        FROM tab_report;

    SELECT id_student
        INTO ln_last_report_student
        FROM tab_report
        WHERE id = ln_last_report;

    prc_report_consult(ln_last_report_student, ln_last_report);
END;
/

-- printing this tab_report is forbidden because its confidentiality is >= 2
DECLARE
    ln_last_report INT;
    ln_last_report_student INT;
BEGIN
    SELECT max(id)
        INTO ln_last_report
        FROM tab_report;

    SELECT id_student
        INTO ln_last_report_student
        FROM tab_report
        WHERE id = ln_last_report;

    prc_report_print(ln_last_report_student, ln_last_report);
END;
/

-- test TRIGGER trg_student_promotion : 
-- We add a new user 
INSERT INTO tab_user (first_name, last_name, avatar_path, phone_number, email, password, is_my_user) VALUES ('El Professor', 'Sergio', 'https://fr.wikipedia.org/wiki/La_casa_de_papel', '0824489570', 'sergio@jidcez.et', 'he4@3Cdawre', 0);

-- then we add a new student with a wrong promotion date. Indeed, he is a L2 so his promotion date must be 2023 so it throws an error
INSERT INTO tab_student (id, promotion, is_apprentice, id_major, id_study_level) VALUES (28, 2024, 1, 4, 2);
