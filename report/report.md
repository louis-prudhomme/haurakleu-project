# Mélanie Marques <!-- omit in toc -->
# Louis Prud’homme <!-- omit in toc -->

<div style="page-break-after: always;"/>

# Table of contents
- [Table of contents](#table-of-contents)
- [Naming conventions](#naming-conventions)
  - [Variables](#variables)
  - [Objects](#objects)
- [E/R diagram](#er-diagram)

<div style="page-break-after: always;"/>

# Naming conventions

## Variables

|       Naming       |         Meaning          |       Example        |
| :----------------: | :----------------------: | :------------------: |
|  Starts with `p`   |        Parameter         |     `pn_id_user`     |
|  Starts with `l`   |      Local variable      |     `ln_id_user`     |
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

# E/R diagram

![E/R diagram](./../model/harakleu-model.png)