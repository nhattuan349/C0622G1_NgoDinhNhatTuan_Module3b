use build_sales;


-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.o_id,o.o_date,o.o_total_price as tong_tien
from oder o ;    


-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.*,p.*
from customer c
	join oder o on c.c_id=o.c_id
	join oder_detail odt on o.o_id=odt.o_id
	join product p on odt.p_id=p.p_id;
    
    
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào    
select c.*, count(o.c_id) as so_lan_mua_hang
from customer c
	left join  oder o on c.c_id=o.c_id
group by c_id  having count(o.c_id)=0;   


-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
--  (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
select o.o_id,o.o_date,sum(od_qty*p_price) as tong_tien
from oder o 
	join oder_detail odt on o.o_id=odt.o_id
	join product p on odt.p_id=p.p_id
group by o_id;