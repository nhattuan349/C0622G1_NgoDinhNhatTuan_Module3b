CREATE DATABASE demo_sp;
USE demo_sp;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

--Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng hiển thị danh sách users
Delimiter $$
create procedure show_list()
begin
	select * from users;
end $$
Delimiter ;

call show_list();

-- Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng sửa thông tin user
Delimiter $$
create procedure edit_sp(id_sp int, name_sp varchar(45), email_sp varchar(45), country_sp varchar(45))
begin
	update users 
    set name = name_sp,
				email= email_sp,
				country =country_sp 
	where id = id_sp;
end $$
Delimiter ;

call edit_sp();

-- Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng xoá user
Delimiter $$
create procedure delete_sp(id_sp int)
begin
	delete from users where id = id_sp;
end $$
Delimiter ;

call delete_sp(2);

select * from users;
