drop database if exists build_sales;
create database build_sales;
use build_sales;

create table customer(
c_id int auto_increment primary key,
c_name varchar(45),
c_age int
);

create table oder(
o_id int auto_increment primary key,
c_id int,
foreign key(c_id) references customer(c_id),
o_date date,
o_total_price double
);

create table product(
p_id int auto_increment primary key,
p_name varchar(45),
p_price double
);

create table oder_detail(
o_id int,
foreign key(o_id) references oder(o_id),
p_id int,
foreign key(p_id) references product(p_id),
od_QTY varchar(45)
);