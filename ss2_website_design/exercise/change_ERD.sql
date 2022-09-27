drop database if exists ss2_Chuyen_erd;
create database ss2_Chuyen_erd;
use ss2_Chuyen_erd;

create table phieu_xuat(
so_px int auto_increment primary key,
ngay_xuat date
);

create table vat_tu(
ma_vtu int auto_increment primary key,
ten_vtu varchar(45)
);

create table chi_tiet_phieu_xuat(
dg_phieu_xuat int,
sl_phieu_xuat int,
so_px int,
foreign key(so_px)  references phieu_xuat(so_px),
ma_vtu int,
foreign key(ma_vtu) references vat_tu(ma_vtu)
);

create table phieu_nhap(
so_pn int auto_increment primary key,
ngay_nhap date
);

create table chi_tiet_phieu_nhap(
dg_nhap int,
sl_nhap int,
ma_vtu int,
foreign key(ma_vtu) references vat_tu(ma_vtu),
so_pn int,
foreign key(so_pn) references phieu_nhap(so_pn)
);

create table nha_cc(
ma_ncc int auto_increment primary key,
ten_ncc varchar(45),
dia_chi varchar(45)
);

create table don_dh(
so_dh int auto_increment primary key,
ngay_dh date,
ma_ncc int,
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

create table chi_tiet_don_dat_hang(
ma_vtu int,
foreign key(ma_vtu) references vat_tu(ma_vtu),
so_dh int,
foreign key(so_dh) references don_dh(so_dh)
);

create table sdt(
ma_sdt int auto_increment primary key,
ma_ncc int,
foreign key(ma_ncc) references nha_cc(ma_ncc),
sdt varchar(13)
);


