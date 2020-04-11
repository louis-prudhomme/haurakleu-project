# Mélanie Marques <!-- omit in toc -->
# Louis Prud’homme <!-- omit in toc -->
## Project: M1-SE <!-- omit in toc -->
## Advanced Databases for Software Engineering <!-- omit in toc -->


<div style="page-break-after: always;"/>

# Table of contents
- [Table of contents](#table-of-contents)
- [Introduction - short description of project subject](#introduction---short-description-of-project-subject)
- [Naming conventions](#naming-conventions)
  - [Variables](#variables)
  - [Objects](#objects)
  - [Error Management](#error-management)
- [E/R diagram](#er-diagram)
- [Implementation of important issues](#implementation-of-important-issues)
  - [Data consistency](#data-consistency)
  - [Search](#search)
  - [Report](#report)
  - [Report statistics](#report-statistics)
  - [Confidentiality](#confidentiality)
- [Problems encountered](#problems-encountered)
  - [Subject understanding](#subject-understanding)
  - [Virtual machine : not an ideal environment](#virtual-machine--not-an-ideal-environment)
  - [Oracle errors management](#oracle-errors-management)
  - [Need to commit](#need-to-commit)
- [Conclusion](#conclusion)

<div style="page-break-after: always;"/>

# Introduction - short description of project subject

The goal of this project is to develop an electronic document management system to archive all the internship and apprenticeship reports for EFREI.

Today, students must email their reports to tutors (businesses and academics). Apprentice students submit their reports on Moodle. Students can submit intermediate documents but only the final report is saved.

In the solution that we propose, the system allows an easy search of documents, and makes them accessible.
This research can be done by keyword, by category, title, etc. It allows the report to be submitted before a specified deadline. This report only becomes readable for students and teachers after validation by the tutors. In addition, only people with access to MyEfrei can access the report after validation.

# Naming conventions

## Variables

|       Naming       |         Meaning          |       Example        |
| :----------------: | :----------------------: | :------------------: |
|  Starts with `l`   |      Local variable      |     `ln_id_user`     |
|  Starts with `p`   |    Parameter variable    |     `pn_id_user`     |
| Second char is `n` | Variable of type number  |     `ln_id_user`     |
| Second char is `v` | Variable of type varchar |     `pv_keyword`     |
| Second char is `c` |     Explicit cursor      |     `lc_reports`     |
| Second char is `d` |  Variable of type date   | `ld_deadline_report` |
| Second char is `e` |    Declared exception    | `le_no_record_found` |

## Objects

|      Naming       |    Meaning     |         Example         |
| :---------------: | :------------: | :---------------------: |
| Starts with `tab` |     Table      |      `tab_student`      |
| Starts with `adt` |  Audit table   |      `adt_keyword`      |
| Starts with `rel` | Relation table |     `rel_performs`      |
| Starts with `fun` |    Function    |    `fun_is_allowed`     |
| Starts with `prc` |   Procedure    |  `prc_report_consult`   |
| Starts with `trg` |    Trigger     | `trg_report_validation` |

<div style="page-break-after: always;"/>

## Error Management

| Error codes |                              Description                               |
| :---------: | :--------------------------------------------------------------------: |
|   -20002    |               The report is late, the deadline is over.                |
|   -20003    |                The hired date can not be in the future.                |
|   -20004    |                           Keyword not found                            |
|   -20006    |    Inconsistency between the promotion of the student and his group    |
|   -20005    |             Expected at least one keyword for this report.             |
|   -20011    |             Confidentiality settings disable this action.              |
|   -20012    |           The report has not been validated, action aborted.           |
|   -20010    | No records were found for either the report id or student id, or both. |
|   -20013    |                    User must be a user of My Efrei.                    |

<div style="page-break-after: always;"/>

# E/R diagram

![E/R diagram](./../model/harakleu-model.png)

<div style="page-break-after: always;"/>

# Implementation of important issues

## Data consistency 

To ensure the consistency of the data, we have undertaken to set up controls at the time of data insertion.

- User emails

Using a CHECK when creating the User table, we verify that the user's email is of the form `example@example.fr`.

- Phone numbers

Using a CHECK CONSTRAINT on the table User, we verify that the user phone number respect the pattern of a classic phone number : `+33699999999` or `0699999999`.

- Passwords strength

Using a CHECK CONSTRAINT on the table User, we check that the password is strong,  i.e. if it has at least one capital letter, a lowercase letter, a special character, a number and its length is greater than or equal to 8. 

- Teacher hired date not in the future

As the SYSDATE cannot be used in a CHECK CONSTRAINT, we created a trigger : `trg_teacher_hired_date` to ensure that the teacher hired date is lower than the SYSDATE.
If this condition isn't respected, it raises a -20003 APPLICATION ERROR.  

- Each report must have minimum one keyword

We added a trigger `trg_report_validation` in order to check that every final report has at least one keyword. 
Indeed, when a report is declared final, that is to say when it has been vetted by the company tutor and the pedagogic tutor, the trigger count the number of keyword for the report. If this number is lower than 1 it raises a -20005 APPLICATION ERROR. 

- Consistency between a student’s group and their promotion

The trigger `trg_student_promotion` checks if the promotion of the student matches its study level. To achieve this, it gets the current year and month. If the month is before september, we take the previous year as reference. Then we calculate the difference between calculated gratuating year and state graduating year.
If the result is inconsistent, it raises a -20006 APPLICATION ERROR.

<div style="page-break-after: always;"/>

## Search 

The solution we suggest allows easy report search by :  

- Keyword

The function `fun_reports_by_keyword` allows to obtain a cursor on all the reports tagged with the provided keyword. 

In addition, this function is marked as `PRAGMA`, it allows it to be autonomous and thus we can test it in a select.
This function works as follows : 
1. It gets the id of the provided keyword
2. It opens the cursor and point it on all reports related to the specified keyword
3. It reports where found, it update the keyword audit table. 
4. It returns the cursor

Furthermore, if there isn't any keyword with this label, the function raises a -20004 APPLICATION ERROR. 

- Category (internship or apprentices) thanks to a select query : 
 
```sql
select id from report where id_student in (select distinct id from student where is_apprentice = 1);
```

Other searches are possible (such as: by student name, title *etc...*) thanks to simple SELECT queries. 

## Report

- All students have to submit intermediate documents but only the final report will be saved

When a report is declared as final, i.e when it has been vetted by the company tutor and the pedagogic tutor, the trigger `trg_report_validation` will call the procedure `prc_delete_intermediary_reports` in order to delete intermediary reports. 

- Submit the report before a deadline

After inserting or updating of the field submitted on `tab_report`, the trigger `trg_report_deadline` checks if the report submission date is greater than the deadline. If so, a -20002 APPLICATION ERROR is raised. 

<div style="page-break-after: always;"/>

## Report statistics 

- Most wanted Keywords 

The function `fun_most_wanted_keywords`returns a cursor pointing on the first n most wanted keywords, n being the parameter given to the function. 

- Most wanted reports

The function `fun_most_wanted_reports`returns a cursor pointing on the first n most wanted reports, n being the parameter given to the function.

- Number of consultation / copy / printing / downloading for each report

The table `adt_report` thanks to simple SELECT queries allows to get the number of consultation, copies, prints and download for each report. 


## Confidentiality 

- Implementation of report confidentiality
Thanks to the function `fun_is_allowed`, we can manage the confidentiality of the reports. 
Indeed, this function plays a central role in the user's interaction with reports. It takes the `ID`s of a user and a report, as well as an operation’s confidentiality level as an input. 
Then, it performs a serie of checks :
1. Checks if both the report and the user exist
2. Checks if the operation is permitted for this report (printing, for instance, is forbidden for level-2 confidentiality reports)
3. Checks if the user is also a My Efrei user or if he was involved in the making of the report (for company tutors, mainly)
4. Checks if the report has been validated or if he was involved in the making of the report (non-validated reports cannot accept incoming operations)

If any of those checks fails, the function raises an exception. Otherwise, it simply returns `1`.

This function is not directly used by the user, but rather a common denominator for the procedures detailed thereafter.

- When a user wants to download, copy or print a report, check that the action requested are allowed by the level of confidentiality.

The procedures `PRC_REPORT_*` represent the ability of the user to interact with reports. Their are four of them, `CONSULT`, `COPY`, `DOWNLOAD` and `PRINT`. 

Their name are pretty self-explanatory in what each procedure represents.

Besides, they are very few and slight differences between them ; they basically work in the exact same way.

- They call to `FUN_IS_ALLOWED` to know if the given user can perform the operation on the given report
- If `FUN_IS_ALLOWED` greenlights the request, the corresponding field in audit table `ADT_REPORT` is incremented by one on the record of the given report

In fact, `FUN_IS_ALLOWED` does all the heavy lifting for these procedures ; there is only two differences between all of them : 
1. They all update different fields in the  audit table `ADT_REPORT` (`prints` for `PRC_REPORT_PRINT`, *etc*)
2. They may have different confidentiality levels ; as per the requirements, we consider `COPY`, `DOWNLOAD` and `PRINT` as level-1 confidentiality operations (which can only be executed on a level-1 confidentiality report) and `CONSULT` to be a level-2 (execution up to level-2 report)

# Problems encountered

## Subject understanding

The given subject being vague gave us a hard time to understand it. 

## Virtual machine : not an ideal environment

Working on a virtual machine considerably increases our working time. Indeed, we had to face many crashes, black screens, and bugs, sometimes resulting in data loss.

## Oracle errors management

Oracle error handling being quite imprecise, it is quite dificult to debug when our script had an error. 

## Need to commit

# Conclusion

This project allow us to face and response to new type of challenges. Indeed, it enabled us to participate to a concrete Database project which goes from the base architecture to the scripts writing without forgetting the testing phase. 