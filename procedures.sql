CREATE OR REPLACE PROCEDURE prc_report_print
(pn_id_user INT, pn_id_report INT)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    ln_result INT;
BEGIN
    ln_result := fun_is_allowed(pn_id_user, pn_id_report, 1);
    IF ln_result = 1 THEN
        UPDATE adt_report
            SET prints = prints + 1
            WHERE id_report = pn_id_report;
        COMMIT;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE prc_report_copy
(pn_id_user INT, pn_id_report INT)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    ln_result INT;
BEGIN
    ln_result := fun_is_allowed(pn_id_user, pn_id_report, 1);
    IF ln_result = 1 THEN
        UPDATE adt_report
            SET copies = copies + 1
            WHERE id_report = pn_id_report;
        COMMIT;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE prc_report_download
(pn_id_user INT, pn_id_report INT)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    ln_result INT;
BEGIN
    ln_result := fun_is_allowed(pn_id_user, pn_id_report, 1);
    IF ln_result = 1 THEN
        UPDATE adt_report
            SET downloads = downloads + 1
            WHERE id_report = pn_id_report;
        COMMIT;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE prc_report_consult
(pn_id_user INT, pn_id_report INT)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    ln_result INT;
BEGIN
    ln_result := fun_is_allowed(pn_id_user, pn_id_report, 2);
    IF ln_result = 1 THEN
        UPDATE adt_report
            SET consults = consults + 1
            WHERE id_report = pn_id_report;
        COMMIT;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE prc_delete_intermediary_reports
(pn_id_report INT, pd_submitted DATE, pn_id_student INT, pn_id_instructions INT)
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    DELETE FROM tab_report
        WHERE id <> pn_id_report
        AND submitted <= pd_submitted
        AND id_student = pn_id_student
        AND id_instructions = pn_id_instructions;
    COMMIT;
END;
/

