-- this procedure simulates the printing of a report
CREATE OR REPLACE PROCEDURE prc_report_print
(pn_id_user INT, pn_id_report INT)
AS
    -- allows this procedure to be autonomous which allows us to test it in a select
	PRAGMA AUTONOMOUS_TRANSACTION;
    ln_result INT;
BEGIN
    -- we ask this function to know if the given user has permission on this report
    -- the 1 represents the maximum level of confidentiality for this operation
    ln_result := fun_is_allowed(pn_id_user, pn_id_report, 1);
    IF ln_result = 1 THEN
        UPDATE adt_report
            SET prints = prints + 1
            WHERE id_report = pn_id_report;
        COMMIT;
    END IF;
END;
/

-- this procedure simulates the copying of a report
CREATE OR REPLACE PROCEDURE prc_report_print
(pn_id_user INT, pn_id_report INT)
AS
    -- allows this procedure to be autonomous which allows us to test it in a select
	PRAGMA AUTONOMOUS_TRANSACTION;
    ln_result INT;
BEGIN
    -- we ask this function to know if the given user has permission on this report
    -- the 1 represents the maximum level of confidentiality for this operation
    ln_result := fun_is_allowed(pn_id_user, pn_id_report, 1);
    IF ln_result = 1 THEN
        UPDATE adt_report
            SET copies = copies + 1
            WHERE id_report = pn_id_report;
        COMMIT;
    END IF;
END;
/

-- this procedure simulates the downloading of a report
CREATE OR REPLACE PROCEDURE prc_report_print
(pn_id_user INT, pn_id_report INT)
AS
    -- allows this procedure to be autonomous which allows us to test it in a select
	PRAGMA AUTONOMOUS_TRANSACTION;
    ln_result INT;
BEGIN
    -- we ask this function to know if the given user has permission on this report
    -- the 1 represents the maximum level of confidentiality for this operation
    ln_result := fun_is_allowed(pn_id_user, pn_id_report, 1);
    IF ln_result = 1 THEN
        UPDATE adt_report
            SET downloads = downloads + 1
            WHERE id_report = pn_id_report;
        COMMIT;
    END IF;
END;
/

-- this procedure simulates the consulting of a report
CREATE OR REPLACE PROCEDURE prc_report_print
(pn_id_user INT, pn_id_report INT)
AS
    -- this allows this procedure to be autonomous which allows us to test it in a select
	PRAGMA AUTONOMOUS_TRANSACTION;
    ln_result INT;
BEGIN
    -- we ask this function to know if the given user has permission on this report
    -- the 1 represents the maximum level of confidentiality for this operation
    ln_result := fun_is_allowed(pn_id_user, pn_id_report, 2);
    IF ln_result = 1 THEN
        UPDATE adt_report
            SET consults = consults + 1
            WHERE id_report = pn_id_report;
        COMMIT;
    END IF;
END;
/

-- this procedure deletes intermediary reports when tutors validate what becomes the final report.
CREATE OR REPLACE PROCEDURE prc_delete_intermediary_reports
(pn_id_report INT, pd_submitted DATE, pn_id_student INT, pn_id_instructions INT)
AS
    -- this allows this procedure to be autonomous which allows us to test it in a select
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

