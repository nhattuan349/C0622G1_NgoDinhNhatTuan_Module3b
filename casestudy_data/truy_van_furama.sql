use Furama_module;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống
-- có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select * from nhan_vien
where ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%"; 

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi 
-- từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select * from khach_hang
where (round(datediff(curdate(),ngay_sinh)/365,0)>=18
and round(datediff(curdate(),ngay_sinh)/365,0)<=50
and dia_chi like "%Đà Nẵng" or dia_chi like "%Quảng Trị");


-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select hd.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, count(hd.ma_khach_hang) as so_lan_dat_phong
from hop_dong hd 
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = lk.ma_loai_khach
where ten_loai_khach = "Diamond"
group by ma_khach_hang
order by so_lan_dat_phong;

-- task 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach,
-- ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau:
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng.
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach,
hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,
ifnull(dv.chi_phi_thue,0)+ifnull(hdct.so_luong*dvdk.gia,0) as tong_tien
from loai_khach lk
left join khach_hang kh on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by kh.ma_khach_hang;
 
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện
-- đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).


select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on  dv.ma_dich_vu = hd.ma_dich_vu
group by dv.ma_dich_vu
having dv.ma_dich_vu not in
(select dv.ma_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where (month(hd.ngay_lam_hop_dong ) between 1 and 3) and year(hd.ngay_lam_hop_dong) = 2021
group by dv.ma_dich_vu);

/*
task 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
*/

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) =2020
group by dv.ma_dich_vu
having dv.ma_dich_vu not in 
(select dv.ma_dich_vu
from dich_vu dv 
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong)=2021);

/*
8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
*/
-- task 8 cach 1
select distinct ho_ten from khach_hang;
-- task 8 cach 2
select ho_ten from khach_hang
group by ho_ten;
-- task 8 cach 3
select ho_ten from khach_hang
union
select ho_ten from khach_hang;


/*
task 9.	Thực hiện thống kê doanh thu theo tháng, 
nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
*/
select month(ngay_lam_hop_dong) as thang, count(hd.ma_khach_hang) as so_lan_dat_phong_trong_thang
from hop_dong hd
where year (ngay_lam_hop_dong) = 2021
group by thang
order by ngay_lam_hop_dong;

/*
10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
(được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
*/

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong hd
left join  hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem =  dvdk.ma_dich_vu_di_kem
group by ma_hop_dong
order by so_luong_dich_vu_di_kem desc;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, lk.ten_loai_khach, kh.dia_chi
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach like 'Diamond' and  (kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi');



-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
--  tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong,nv.ho_ten,kh.ho_ten,kh.so_dien_thoai,dv.ten_dich_vu, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
where (month(hd.ngay_lam_hop_dong ) between 10 and 12) and year(hd.ngay_lam_hop_dong) = 2020
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.*, sum(hdct.so_luong) as so_lan_su_dung
from dich_vu_di_kem dvdk 
left join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung >= 
(
select max(hdct.so_luong) 
from dich_vu_di_kem dvdk 
left join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, dv.ten_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem dvdk 
left join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
left join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
group by dvdk.ten_dich_vu_di_kem
having count(dvdk.ma_dich_vu_di_kem) =1
order by hd.ma_hop_dong;

-- task 15 Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do,bp.ten_bo_phan, nv.so_dien_thoai,nv.dia_chi, count(hd.ma_hop_dong) as hop_dong_duoc_lap
from hop_dong hd
join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
group by nv.ma_nhan_vien
having count(hd.ma_hop_dong) <=3;

 -- task 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
 
 update nhan_vien nv set status_delete = 0
 where nv.ma_nhan_vien in (
 select * 
 from (select nv.ma_nhan_vien from hop_dong hd
 right join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
 right join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
 right join bo_phan bp on nv.ma_trinh_do = bp.ma_bo_phan
 group by ma_nhan_vien
 having count(hd.ma_hop_dong) = 0) as temp);
 select * from nhan_vien;

-- task 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang kh set kh.ma_loai_khach=1
where kh.ma_khach_hang in(
select*from (
select kh.ma_khach_hang
from khach_hang kh 
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv .ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where year(ngay_ket_thuc)= 2021 and ifnull(dv.chi_phi_thue,0) + ifnull(hdct.so_luong*dvdk.gia,0)>10000000
group by kh.ma_khach_hang having kh.ma_khach_hang = 2) as temp);
select * from khach_hang;

-- task 18 Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
update khach_hang kh set status_delete = 0
where kh.ma_khach_hang in(
select*from(
select kh.ma_khach_hang  from khach_hang kh
join hop_dong hd on kh.ma_khach_hang= hd.ma_hop_dong
where year(ngay_lam_hop_dong)<2021) temp);	

-- task  19 Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem dvdk set dvdk.gia=dvdk.gia*2
where dvdk.ma_dich_vu_di_kem in(
select *
from(
select dvdk.ma_dich_vu_di_kem
 from hop_dong hd
 join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 where hdct.so_luong >10 and year(ngay_lam_hop_dong)=2020 )temp);

-- task 20 	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien,nv.ho_ten,nv.email,nv.so_dien_thoai,nv.ngay_sinh,nv.dia_chi from nhan_vien nv
union 
select ma_khach_hang,kh.ho_ten,kh.email,kh.so_dien_thoai,kh.ngay_sinh,kh.dia_chi from khach_hang kh;