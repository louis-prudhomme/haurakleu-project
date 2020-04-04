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