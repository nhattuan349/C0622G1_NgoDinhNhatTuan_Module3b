drop database if exists xay_dung_csdl_qlsv;
create database xay_dung_csdl_qlsv;
use xay_dung_csdl_qlsv;

create table class (
id_class int auto_increment primary key,
name_class varchar(45)
);

create table student(
id_student int auto_increment primary key,
name_student varchar(45),
age_student int,
country varchar(45)
);

