use build_sales;

select o.o_id,o.o_date,o.o_total_price as tong_tien
from oder o ;    

select c.*,p.*
from customer c
	join oder o on c.c_id=o.c_id
	join oder_detail odt on o.o_id=odt.o_id
	join product p on odt.p_id=p.p_id;
    
select c.*, count(o.c_id) as so_lan_mua_hang
from customer c
	left join  oder o on c.c_id=o.c_id
group by c_id  having count(o.c_id)=0;   

select o.o_id,o.o_date,sum(od_qty*p_price) as tong_tien
from oder o 
	join oder_detail odt on o.o_id=odt.o_id
	join product p on odt.p_id=p.p_id
group by o_id;