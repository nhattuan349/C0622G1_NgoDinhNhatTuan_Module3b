drop database if exists ss5_demo;
create database ss5_demo;
use ss5_demo;

create table Products(
id int auto_increment primary key,
productCode int,
productName varchar(45),
productPrice int,
productAmount int,
productDescription varchar(45),
productStatus bit(1)
);

insert into Products(id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
values ('1',011,'Món A',1000,54,'Ngon',1),
('2',022,'Món B',2000,32,'Kha Ngon',1),
('3',033,'Món C',3000,57,'Rat Ngon',1),
('4',044,'Món D',4000,18,'Me',0),
('5',055,'Món E',5000,2,'Binh thuong',1),
('6',066,'Món F',6000,78,'Hap dan',0);


-- Bước 3:

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX ten_index
ON Products (productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX ten_index_2
ON Products (productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from Products where productCode = '011';

-- So sánh câu truy vấn trước và sau khi tạo index
DROP INDEX ten_index
ON Products;

-- Bước 4:

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW ten_view AS SELECT productCode, productName, productPrice, productStatus FROM Products WHERE productCode = 011;

-- Tiến hành sửa đổi view
UPDATE ten_view SET productName = 'o tô' WHERE productCode = '011';

-- Tiến hành xoá view
DELETE FROM ten_view WHERE productCode = '011';
DROP VIEW ten_view;


-- Bước 5:

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_Products()
begin
select * from Products;
end //
delimiter ;

-- goi Products
call sp_Products();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_insert_Products()
begin
insert into Products(id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
values ('7',077,'Quản Lý G',7000,47,'Ngon hi',1),
('8',088,'Quản Lý I',8000,32,'Binh thuong',0);
end //
delimiter ;

delimiter //
create procedure sp_Products_a()
begin
insert into Products(id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
values ('10',011,'Quản Lý A',1000,54,'Ngon',1);
end //
delimiter ;

call sp_Products_a();
select * from Products;

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_Products()
begin
UPDATE Products
SET productName = 'sản phẩm B'
WHERE productCode = 22 ;
end //
delimiter ;

call update_Products();

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_Products(in id_Poducts int)
begin
DELETE 
  FROM Products
  WHERE id = id_Poducts;
end //
delimiter ;

call delete_Products(3);
select * from Products;