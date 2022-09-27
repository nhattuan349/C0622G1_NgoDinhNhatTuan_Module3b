use ss4_quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select s.SubName, max(s.Credit) 
from Subject s;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.SubName, m.Mark
from Subject s
join Mark m on m.SubId = s.SubId
where mark in (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
-- xếp hạng theo thứ tự điểm giảm dần


select s.StudentName, avg(m.Mark)
from Student s 
left join Mark m on m.StudentId = s.StudentId
group by s.StudentId
order by s.StudentName;
