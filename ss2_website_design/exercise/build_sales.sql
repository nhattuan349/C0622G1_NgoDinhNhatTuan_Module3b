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
p_id int,
primary key(o_id,p_id),
foreign key(o_id) references oder(o_id),
foreign key(p_id) references product(p_id),
od_QTY varchar(45)
);

INSERT INTO customer
VALUES (1, 'Minh Quan', 10),
       (2, 'Ngoc Anh', 20),
       (3, 'Hong Ha', 50);
       
INSERT INTO oder
VALUES (1, 1,'2006-3-21', null),
       (2, 2,'2006-3-23', null),
       (3, 1,'2006-3-16', null);
       
INSERT INTO product
VALUES (1, 'May Giat', 3),
       (2, 'Tu Lanh', 5),
       (3, 'Dieu Hoa', 7),
       (4, 'Quat', 1),
       (5, 'Bep Dien', 2);       
       
INSERT INTO oder_detail
VALUES (1,1,3),
       (1,3,7),
       (1,4,2),
       (2,1,1),
       (3,1,8),
       (2,5,4),
       (2,3,3);   