# Mélanie Marques <!-- omit in toc -->
# Louis Prud’homme <!-- omit in toc -->

<div style="page-break-after: always;"/>

# Table of contents
- [Table of contents](#table-of-contents)
- [Report description](#report-description)
- [Introduction (short description of project subject ?)](#introduction-short-description-of-project-subject)
- [Naming conventions](#naming-conventions)
  - [Variables](#variables)
  - [Objects](#objects)
  - [Error Management](#error-management)
- [E/R diagram](#er-diagram)
- [Implementation of important issues](#implementation-of-important-issues)
  - [Trigger TRG_STUDENT_PROMOTION](#trigger-trgstudentpromotion)
  - [Function FUN_IS_ALLOWED](#function-funisallowed)
  - [Procedures PRC_REPORT_*](#procedures-prcreport)
  - [Function FUN_MOST_WANTED_REPORTS (ne garder que celle-ci ou FUN_REPORTS_BY_KEYWORD ?)](#function-funmostwantedreports-ne-garder-que-celle-ci-ou-funreportsbykeyword)
  - [Function FUN_REPORTS_BY_KEYWORD (ne garder que celle-ci ou FUN_MOST_WANTED_REPORTS ?)](#function-funreportsbykeyword-ne-garder-que-celle-ci-ou-funmostwantedreports)
  - [Trigger TRG_REPORT_VALIDATION](#trigger-trgreportvalidation)
- [Problems encountered](#problems-encountered)
  - [Fucking Oracle](#fucking-oracle)
  - [Oracle = Cancer](#oracle--cancer)
  - [Ton sujet pue la merde](#ton-sujet-pue-la-merde)
  - [Need to commit](#need-to-commit)
- [Conclusion](#conclusion)

<div style="page-break-after: always;"/>

# Report description 

> The deliverable consists of separate files; you can add at most three files on Moodle:
> - the report : named name1_name2.pdf
> - the script for populating the database + the script containing the different functions/queries.
> The report must have between 5 and 10 pages. It includes an introduction, a short description of the project subject, some functions/queries for the most important issues of the project, a discussion of the encountered problems/difficulties, and a conclusion. 
> The report should not explain your code in details, let alone include portions of your code: good code should be well self-commented. The code must be properly indented and commented. 
> It must comply with the standard naming rules for variables and functions. 

* [ ] The report must have between 5 and 10 pages.
* [ ] It includes an introduction
* [ ] short description of the project subject
* [ ] some functions/queries for the most important issues of the project
* [ ] a discussion of the encountered problems/difficulties
* [ ] conclusion

# Introduction (short description of project subject ?)

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

## Error Management

| Error codes |                              Description                               |
| :---------: | :--------------------------------------------------------------------: |
|   -20002    |               The report is late, the deadline is over.                |
|   -20003    |                The hired date can not be in the future.                |
|   -20004    |                           Keyword not found                            |
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

## Trigger TRG_STUDENT_PROMOTION



## Function FUN_IS_ALLOWED

This function plays a central role in the user's interaction with reports. It takes the `ID`s of a user and a report, as well as an operation’s confidentiality level as an input. 
Then, it pertforms a serie of checks :
- Checks if both the report and the user exist
- Checks if the operation is permitted for this report (printing, for instance, is forbidden for level-2 confidentiality reports)
- Checks if the user is also a My Efrei user or if he was involved in the making of the report (for company tutors, mainly)
- Checks if the report has been validated or if he was involved in the making of the report (non-validated reports cannot accept incoming operations)

If any of those checks fails, the function raises an exception. Otherwise, it simply returns `1`.

This function is not directly used by the user, but rather a common denominator for the procedures detailed thereafter.

## Procedures PRC_REPORT_*

Those procedures represent the ability of the user to interact with reports. Their are four of them, `CONSULT`, `COPY`, `DOWNLOAD` and `PRINT`. 

Their name are pretty self-explanatory in what each procedure represents.

Besides, they are very few and slight differences between them ; they basically work in the exact same way.

- They call to `FUN_IS_ALLOWED` to know if the given user can perform the operation on the given report
- If `FUN_IS_ALLOWED` greenlights the request, the corresponding field in audit table `ADT_REPORT` is incremented by one on the record of the given report

In fact, `FUN_IS_ALLOWED` does all the heavy lifting for these procedures ; there is only two differences between all of them : 
1. They all update different fields in the  audit table `ADT_REPORT` (`prints` for `PRC_REPORT_PRINT`, *etc*)
2. They may have different confidentiality levels ; as per the requirements, we consider `COPY`, `DOWNLOAD` and `PRINT` as level-1 confidentiality operations (which can only be executed on a level-1 confidentiality report) and `CONSULT` to be a level-2 (execution up to level-2 report)

## Function FUN_MOST_WANTED_REPORTS (ne garder que celle-ci ou FUN_REPORTS_BY_KEYWORD ?)

## Function FUN_REPORTS_BY_KEYWORD (ne garder que celle-ci ou FUN_MOST_WANTED_REPORTS ?)

## Trigger TRG_REPORT_VALIDATION

# Problems encountered

## Fucking Oracle

## Oracle = Cancer

## Ton sujet pue la merde

## Need to commit

# Conclusion