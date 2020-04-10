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

## Procedures PRC_REPORT_*

## Function FUN_MOST_WANTED_REPORTS (ne garder que celle-ci ou FUN_REPORTS_BY_KEYWORD ?)

## Function FUN_REPORTS_BY_KEYWORD (ne garder que celle-ci ou FUN_MOST_WANTED_REPORTS ?)

## Trigger TRG_REPORT_VALIDATION

# Problems encountered

## Fucking Oracle

## Oracle = Cancer

## Ton sujet pue la merde

## Need to commit

# Conclusion