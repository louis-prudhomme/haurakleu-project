COMMIT;

-- we select the number of views before 
SELECT keyword.word, audit_keyword.nb_research FROM audit_keyword
LEFT JOIN keyword ON keyword.id = audit_keyword.id_keyword
WHERE keyword.word = 'JEE';

-- test get report by keyword
SET SERVEROUTPUT ON SIZE 1000000
DECLARE
  l_cursor SYS_REFCURSOR;
  l_id NUMBER;
  l_title VARCHAR2(64);
BEGIN
  l_cursor := get_report_by_keyword('JEE');

  LOOP
    FETCH l_cursor
    INTO  l_id, l_title;
    EXIT WHEN l_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_id || ' | ' || l_title);
  END LOOP;
  CLOSE l_cursor;
END;
/

-- we select the number of views after (a view has been gained from the previous instruction) 
SELECT keyword.word, audit_keyword.nb_research FROM audit_keyword
LEFT JOIN keyword ON keyword.id = audit_keyword.id_keyword
WHERE keyword.word = 'JEE';

-- selecting the ten most searched keywords
SELECT keyword.word, audit_keyword.nb_research FROM audit_keyword
LEFT JOIN keyword ON keyword.id = audit_keyword.id_keyword
WHERE rownum < 10
ORDER BY audit_keyword.nb_research DESC;

-- trying to select a keyword that doesnt exist, will raise an exception
SET SERVEROUTPUT ON SIZE 1000000
DECLARE
  l_cursor SYS_REFCURSOR;
  l_id NUMBER;
  l_title VARCHAR2(64);
BEGIN
  l_cursor := get_report_by_keyword('idontexist');

  LOOP
    FETCH l_cursor
    INTO  l_id, l_title;
    EXIT WHEN l_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_id || ' | ' || l_title);
  END LOOP;
  CLOSE l_cursor;
END;
/

-- test get most wanted reports
SET SERVEROUTPUT ON SIZE 1000000
DECLARE
  l_cursor_MW SYS_REFCURSOR;
  l_id_MW NUMBER;
  l_title_MW VARCHAR2(64);
  l_nb NUMBER;
BEGIN
  l_cursor_MW := get_most_wanted_reports(5);
            
  LOOP 
    FETCH l_cursor_MW
    INTO  l_id_MW, l_title_MW, l_nb;
    EXIT WHEN l_cursor_MW%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('id keyword : '|| l_id_MW || ' | ' || 'word : ' || l_title_MW || ' | ' || 'nb search : '|| l_nb);
  END LOOP;
  CLOSE l_cursor_MW;
END;
/

-- select the most consulted reports before consulting one
SELECT report.id, report.title, audit_report.consults FROM report 
LEFT JOIN audit_report ON report.id = audit_report.id_report
WHERE rownum < 10
ORDER BY audit_report.consults DESC;

-- consulting a report
BEGIN
    doc_consult(20, 1);
END;
/

-- select the most consulted reports after is has been updated
SELECT report.id, report.title, audit_report.consults FROM report 
LEFT JOIN audit_report ON report.id = audit_report.id_report
WHERE rownum < 10
ORDER BY audit_report.consults DESC;

-- trying to consult the same report with  another user will raise an exception because it has not been validated and this user hasn’t partticpated in the report
BEGIN
    doc_consult(1, 1);
END;
/

-- trying to insert a validated report without keywords crashes
INSERT INTO report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1613 Ovjig Pass', 1, 1, 18, 6, 12, 3, 2, 2);

-- inserting it not validated
INSERT INTO report (title, is_pedag_vetted, is_company_vetted, id_student, id_company, id_pedag_tutor, id_company_tutor, id_conf_level, id_instructions) VALUES ('1613 Ovjig Pass', 1, 0, 18, 6, 12, 3, 2, 2);

--adding keyword
INSERT INTO has VALUES((SELECT max(id) FROM report), 1);

-- updating report to validate it
UPDATE report SET is_company_vetted = 1 WHERE id = (SELECT max(id) FROM report);

-- displaying the report
SELECT * FROM report WHERE id = (SELECT max(id) FROM report);

COMMIT;

-- consulting this report is autorized because its confidentiality is <= 2
DECLARE
    last_report INT;
    last_report_student INT;
BEGIN
    SELECT max(id) INTO last_report FROM report;
    SELECT id_student INTO last_report_student FROM report WHERE id = last_report;
    doc_consult(last_report_student, last_report);
END;
/

-- printing this report is forbidden because its confidentiality is >= 2
DECLARE
    last_report INT;
    last_report_student INT;
BEGIN
    SELECT max(id) INTO last_report FROM report;
    SELECT id_student INTO last_report_student FROM report WHERE id = last_report;
    doc_print(last_report_student, last_report);
END;
/