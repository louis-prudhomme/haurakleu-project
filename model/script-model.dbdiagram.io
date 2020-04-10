Table User {
    id int [pk]
    first_name varchar
    last_name varchar
    avatar_path varchar
    phone_number varchar 
    email varchar
    password varchar
   
    is_my_user boolean
}

Table Instructions {
    id int [pk]
    guideline varchar
    deadline date
}

Table Company {
    id int [pk]
    name varchar
}

Table Confidentiality_Level {
    id int [pk]
    label varchar
}

Table Teaching_Field {
    id int [pk]
    label varchar
}

Table Study_Level {
    id int [pk]
    label varchar
}

Table Company_Tutor {
    id int [pk, ref: - User.id]
    job varchar
}

Table Teacher {
    id int [pk, ref: - User.id]
    hired date
}

Table Teaches {
    id_teacher int [pk, ref: < Teacher.id]
    id_field int [pk, ref: < Teaching_Field.id]
}

Table Major {
    id int [pk]
    label varchar
    id_major_director int [ref: < Teacher.id]
}

Table Student {
    id int [pk, ref: - User.id]
    promotion int

    is_apprentice boolean
 
    id_major int [ref: < Major.id]
    id_study_level int [ref: < Study_Level.id]
}

Table Performs {
    id_student int [pk, ref: < Student.id]
    id_instructions int [pk, ref: < Instructions.id]
}

Table Report {
    id int [pk]
    title varchar
    submitted date

    is_pedag_vetted boolean
    is_company_vetted boolean

    id_student int [ref: < Student.id]
    id_company int [ref: < Company.id]
    id_pedag_tutor int [ref: < Teacher.id]
    id_company_tutor int [ref: < Company_Tutor.id]
    id_conf_level int [ref: < Confidentiality_Level.id]
    id_instructions int [ref: < Instructions.id]
}

Table Keyword {
    id int [pk]
    word varchar
}

Table Has {
    id_report int [pk, ref: < Report.id]
    id_keyword int [pk, ref: < Keyword.id]
}

Table Audit_Report {
    id_report int [pk, ref: - Report.id]
    consults int 
    copies int 
    prints int 
    downloads int 
}

Table Audit_Keyword {
    id_keyword int [pk, ref: - Keyword.id]
    searches int
}