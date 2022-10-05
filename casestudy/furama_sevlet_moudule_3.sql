drop database if exists furama_moudule_servlet;
create database furama_moudule_servlet;
use furama_moudule_servlet;

create table `position`(
id int primary key auto_increment,
name varchar(45)
);

create table education_degree (
id int primary key auto_increment,
name varchar(45)
);


create table division(
id int primary key auto_increment,
name varchar(45)
);

create table user (
username varchar(255) primary key ,
password varchar(255)
);

create table role (
role_id int primary key auto_increment,
role_name varchar(255)
);

create table user_role(
role_id int,
foreign key (role_id) references role (role_id),
username varchar(255),
foreign key (username) references user (username),
primary key (role_id,username)
);

create table employee(
id int primary key auto_increment,
name varchar(45),
date_of_birth date,
id_card varchar(45),
salary double,
phone_number varchar(45),
email varchar(45),
address varchar(45),
position_id int,
foreign key (position_id) references `position`(id),
education_degree_id int,
foreign key (education_degree_id) references education_degree(id),
division_id int,
foreign key (division_id) references division(id),
username varchar(255),
foreign key (username) references user(username)
);

create table customer_type(
id int primary key auto_increment,
name varchar(45)
);

create table customer(
id int primary key auto_increment,
customer_type_id int,
foreign key (customer_type_id) references customer_type(id),
name varchar(45),
date_of_birth date,
gender bit(1),
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45)
);

create table facility_type(
id int primary key auto_increment,
name varchar(45)
);
create table rent_type(
id int primary key auto_increment,
name varchar(45)
);

create table facility(
id int primary key auto_increment,
name varchar(45),
area int,
cost double,
max_people int,
rent_type_id int,
foreign key (rent_type_id) references rent_type(id),
facility_type_id int,
foreign key (facility_type_id) references facility_type(id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text
);

create table contract(
id int primary key auto_increment,
start_date datetime,
end_date datetime,
deposit double,
employee_id int,
foreign key (employee_id) references employee(id),
customer_id int,
foreign key (customer_id) references customer(id),
facility_id int,
foreign key (facility_id) references facility(id)
);

create table attach_facility(
id int primary key auto_increment,
name varchar(45),
cost double,
unit varchar(10),
status varchar(45)
);

create table contract_detail(
id int primary key auto_increment,
contract_id int,
foreign key (contract_id) references contract(id),
attach_facility_id int,
foreign key (attach_facility_id) references attach_facility(id),
quantity int
);

insert into `position`(id,name)
values ('1','Quản Lý'),
('2','Nhân Viên');

insert into education_degree(id,name)
values ('1', 'Trung Cấp'),
	   ('2', 'Cao Đẳng'),
	   ('3', 'Đại Học'),
	   ('4', 'Sau Đại Học');
       
insert into division(id,name)
values ('1','Sale-Marketing'),
('2','Hành chính'),
('3','Phục vụ'),
('4','Quản lý');

insert into role(role_id,role_name)
values ('1','role name 1'),
('2','role name 2'),
('3','role name 3'),
('4','role name 4'),
('5','role name 5'),
('6','role name 6'),
('7','role name 7'),
('8','role name 8'),
('9','role name 9'),
('10','role name 10');

insert into user(username,password)
values ('username1','password1'),
('username2','password2'),
('username3','password3'),
('username4','password3'),
('username5','password3'),
('username6','password3'),
('username7','password3'),
('username8','password3'),
('username9','password3'),
('username10','password4');

insert into user_role(role_id,username)
values ('1','username1'),
('2','username2'),
('3','username3'),
('4','username4'),
('5','username5'),
('6','username6'),
('7','username7'),
('8','username8'),
('9','username9'),
('10','username10');

insert into employee(id,name,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id,username)
values   ('1', 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1','username1'),
('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2','username2'),
('3', 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2','username3'),
('4', 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4','username4'),
('5', 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1','username5'),
('6', 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3','username6'),
('7', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2','username7'),
('8', 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4','username8'),
('9', 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4','username9'),
('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2','username10');


insert into customer_type(id,name)
values ('1','Diamond'),
('2','Platinium'),
('3','Gold'),
('4','Silver'),
('5','Member');

insert into customer(id,customer_type_id,name,date_of_birth,gender,id_card,phone_number,email,address)
values ('1','5','Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng'),
('2','3','Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị'),
('3','1','Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh'),
('4','1','Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng'),
('5','4','Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai'),
('6','4','Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng'),
('7','1','Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh'),
('8','3','Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum'),
('9','1','Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi'),
('10','2','Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng');



