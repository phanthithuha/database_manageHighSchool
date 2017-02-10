-- project management high school
create database highschool_management;
use highschool_management;
-- drop database highschool_management;


-- create table "users"

create table if not exists users (
	ID_user varchar(100) not null,
    name_user varchar(100) not null,
    password varchar(100) not null,
	primary key(ID_user)
);
insert into users (ID_user, name_user, password)
values ('A1','Admin 1', '123456789'),
('A2','Admin 2', '123456785559'),
('US','user', '120003456789');
select *from users;



create table if not exists subjects (
	ID_subject varchar(100) not null,
    name_subject varchar(100) not null,
    primary key(ID_subject)
);

insert into subjects (ID_subject,name_subject)
values ('Mat','Math'),
('Phy1','Physical'),
('Che','Chemistry'),
('Bio','Biology'),
('Lit','Literature'),
('His','History'),
('Geo','Geography'),
('Eng','English'),
('Pol','Politic'),
('Phy2','Physical Education');

select *from subjects;
-- hạnh kiểm
create table if not exists conducts (
	ID_conduct varchar(100) not null,
    name_conduct varchar(100) not null,
    primary key(ID_conduct)
);

insert into conducts(ID_conduct,name_conduct)
values ('G', 'Good'),
('QG', 'Quite good'),
('AC', 'Average conduct'),
('WC','Weak conduct');

select *from conducts;

-- học lực
create table if not exists proficiency (
	ID_proficiency varchar(100) not null,
    name_proficiency varchar(100) not null,
    -- gioi han tren
    point_upper_limit float,
    -- điểm giới hạn dưới
    point_lower_limit float,
    primary key(ID_proficiency)
);
insert into proficiency(ID_proficiency,name_proficiency,point_upper_limit,point_lower_limit)
values ('G', 'Good', 10,8),
('MI', 'Middling', 7.9,6.5),
('AP', 'Average proficiency',6.4,5.0),
('WP','Weak proficiency',4.9,3.5),
('TW', 'Too weak',3.4,0);

select *from proficiency;
select *from conducts;
create table if not exists teachers (
	ID_teacher varchar(100) not null,
    name_teacher varchar(100) not null,
    address varchar(100) not null,
    phone varchar(100) not null,
    ID_subject varchar(100) not null,
    primary key(ID_teacher, ID_subject)
);
ALTER TABLE teachers
ADD CONSTRAINT fk_tea_sub
FOREIGN KEY (ID_subject)
REFERENCES subjects(ID_subject);


insert into teachers (ID_teacher, ID_subject, name_teacher, address, phone)
values 
('B1','Che', 'Tran Xuan Tu', 'Gio Linh - Quang Tri', '0123654789'),
('B1','Mat', 'Tran Xuan Tu', 'Gio Linh - Quang Tri', '0123654789'),
('A1','Mat', 'Tran Xuan Hanh', 'Dong Ha - Quang Tri', '0123654789'),
('C1','Phy1', 'Nguyen Duc Sau', 'Vinh Linh - Quang Tri', '0123654789'),
('E1','Bio', 'Tran Xuan Tu', 'Gio Linh - Quang Tri', '0123654789'),
('B2','Lit', 'Tran Xuan Tu', 'Gio Linh - Quang Tri', '0123654789'),
('A5','Mat', 'Tran Xuan Hanh', 'Dong Ha - Quang Tri', '0123654789'),
('C8','His', 'Nguyen Duc Sau', 'Vinh Linh - Quang Tri', '0123654789'),
('B5','Che', 'Tran Xuan Ha', 'Gio Linh - Quang Tri', '0123654789'),
('B9','Geo', 'Tran Xuan Cuong', 'Gio Linh - Quang Tri', '0123654789'),
('A0','Mat', 'Tran Xuan Hanh', 'Dong Ha - Quang Tri', '0123654789'),
('C7','Phy1', 'Nguyen Duc Sau', 'Vinh Linh - Quang Tri', '0123654789'),
('B22','Che', 'Tran Xuan Tu', 'Gio Linh - Quang Tri', '0123654789'),
('B17','Mat', 'Tran Xuan Tu', 'Gio Linh - Quang Tri', '0123654789'),
('A17','Mat', 'Tran Xuan Hanh', 'Dong Ha - Quang Tri', '0123654789'),
('C19','Phy1', 'Nguyen Duc Sau', 'Vinh Linh - Quang Tri', '0123654789'),
('C2','Phy2', 'Le Xuan Tu', 'Gio Linh - Quang Tri', '0123654789');
select *from teachers;
-- classes
create table if not exists classes (
	ID_class varchar(100) not null,
    name_class varchar(100) not null,
    ID_teacher varchar(100) not null,
    primary key(ID_class)
);
ALTER TABLE classes
ADD CONSTRAINT fk_cla_tea
FOREIGN KEY (ID_teacher)
REFERENCES teachers(ID_teacher);

insert into classes (ID_class,name_class,ID_teacher)
values 
('E10','English 10','A0'),
('E11','English 11','B22'),
('E12','English 12','C7'),
('MA10','Math 10','C8'),
('MA11','Math 11','E1'),
('MA12','Math 12','B2'),
('PH1','Physical 10','A5'),
('PH2','Physical 11','C19'),
('PH3','Physical 12','C1');
	('Phan Thi Thu Ha','Female','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','ha.phan@student.passerellesnumeriques.org'),
    
    ('Phan Thi Kim Oanh','Female','E10','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','hang.phan@student.passerellesnumeriques.org'),
    
    ('Phan Van De','Male','MA11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','hana.phan@student.passerellesnumeriques.org'),
    
    ('Phan Tran Binh Trong','Male','PH1','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','0123456789','hanh.phan@student.passerellesnumeriques.org'),
    
    ('Tran Thi Buoi','Female','MA11','1997-11-10','Thon 10 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','ham.phan@student.passerellesnumeriques.org'),
    
    ('Phan Van Hoi','Male','MA10','1997-10-10','Thon 7 - Gio Quang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','han.phan@student.passerellesnumeriques.org'),
    
    ('Truong Thi Lai','Female','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','hai.phan@student.passerellesnumeriques.org'),
    
    ('Nguyen Thi Dau','Female','E11','1997-10-10','Thon 9 - Trung Giang - Vinh Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','trang.phan@student.passerellesnumeriques.org'),
    
    ('Nguyen Gia Do','Female','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','le.phan@student.passerellesnumeriques.org'),
    
    ('Le Hat Luu','Female','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','0.phan@student.passerellesnumeriques.org'),
    
    ('Nguyen Thi Beo','Female','E11','1997-10-10','Thon 7 - Gio Mai - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','9.phan@student.passerellesnumeriques.org'),
    
      ('Nguyen Thi No','Female','E11','1997-10-10','Thon 9 - Hai Son - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','8.phan@student.passerellesnumeriques.org'),
    
    ('Nguyen Thi Trang','Female','E11','1997-10-10','Thon 9 - Gio Binh - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','7.phan@student.passerellesnumeriques.org'),
    
    ('Phan Thu Ha','Female','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','6.phan@student.passerellesnumeriques.org'),
    
    ('Nguyen Thi Ai Hau','Female','E11','1997-10-10','An Nha - Gio An - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','5.phan@student.passerellesnumeriques.org'),
    
    ('Vo Cong Tuan Anh','Male','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','4.phan@student.passerellesnumeriques.org'),
    
    ('Tran Ngoc Ha','Female','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','3.phan@student.passerellesnumeriques.org'),
    
    ('Tran Thi Nhu Y','Female','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','2.phan@student.passerellesnumeriques.org'),
    
    ('Le Thi Thu Lanh','Female','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','1.phan@student.passerellesnumeriques.org');
-- display table "STUDENTS"
select *from students;
-- drop table students;

-- xếp loại
create table if not exists classifications (
	ID_student int auto_increment not null,    
    final_grade float not null,
    ID_proficiency varchar(100) not null,
    ID_conduct varchar(100) not null,
    classification varchar(100) not null,
    primary key(ID_student)
);
-- drop table classifications;

insert into classifications(final_grade,ID_proficiency,ID_conduct,classification)
values 
(8.5, 'G', 'G', 'Good student'),
( 6.5, 'MI', 'G', 'quite good student'),
( 9.5, 'G', 'G', 'Good student'),
(3.4, 'TW', 'QG', 'Weak student'),
( 7.5, 'MI', 'G', 'quite good student'),
(6.5, 'MI', 'G', 'quite good student'),
(6.7, 'MI', 'G', 'quite good student'),
( 9.5, 'G', 'G', 'Good student'),
(3.4, 'TW', 'QG', 'Weak student'),
( 7.5, 'MI', 'G', 'quite good student'),
(6.5, 'MI', 'G', 'quite good student'),
(6.7, 'MI', 'G', 'quite good student'),
( 9.5, 'G', 'G', 'Good student'),
(3.4, 'TW', 'QG', 'Weak student'),
( 7.5, 'MI', 'G', 'quite good student'),
(6.5, 'MI', 'G', 'quite good student'),
(6.7, 'MI', 'G', 'quite good student'),
(7.8, 'MI', 'G', 'quite good student'),
(6.7, 'MI', 'G', 'quite good student');

ALTER TABLE classifications
ADD CONSTRAINT fk_xep_stu
FOREIGN KEY (ID_student)
REFERENCES students(ID_student);


ALTER TABLE classifications
ADD CONSTRAINT fk_xep_hoc
FOREIGN KEY (ID_proficiency)
REFERENCES proficiency(ID_proficiency);

ALTER TABLE classifications
ADD CONSTRAINT fk_xep_cond
FOREIGN KEY (ID_conduct)
REFERENCES conducts(ID_conduct);

select *from classifications;

create table if not exists parents (
	ID_student int auto_increment not null,    
    father_name varchar(100) default null,
    job_father varchar(100) default null,
    mother_name varchar(100) default null,
    job_mother varchar(100) default null,
    phone varchar(100) default null,
    primary key(ID_student)
);
-- drop table xep_loai;
insert into parents(father_name,job_father,mother_name,job_mother,phone)
values
('Tran Xuan Tu', 'teacher', 'Nguyen Thi Luyen', 'doctor', 012369715897),
('Truong Xuan Tu', 'singer', 'Truong Thi Ly', 'teacher', 012369715897),
('Le Xuan Tu', 'worker', 'Nguyen Thi Lien', 'doctor', 012369715897),
('Ly Xuan Tu', 'doctor', 'Le Thi Ly', 'doctor', 012369715897),
('Vo Xuan Tu', 'carpenter', 'Tran Thi Ly', 'chef', 012369715897),
('Dang Xuan Tu', 'teacher', 'Nguyen Thi Ly', 'doctor', 012369715897),
('Duong Xuan Tu', 'worker', 'Tran Thi Ly', 'porker', 012369715897),
('Tran Xuan Tu', 'president', 'Nguyen Thi Ly', 'doctor', 012369715897),
('Phan Xuan Tu', 'teacher', 'Nguyen Thi Ly', 'doctor', 012369715897),
('Nguyen Xuan Tu', 'teacher', 'Nguyen Thi Ly', 'doctor', 012369715897),
('Le Xuan Tu', 'teacher', 'Nguyen Thi Ly', 'doctor', 012369715897),
('Ly Xuan Tu', 'teacher', 'Nguyen Thi Ly', 'doctor', 012369715897),
('Tran Xuan Tu', 'worker', 'Nguyen Thi Ly', 'doctor', 012369715897),
('Nguyen Xuan Tu', 'teacher', 'Nguyen Thi Mai', 'doctor', 012369715897),
('Pham Xuan Tu', 'teacher', 'Nguyen Thi Nhi', 'doctor', 012369715897),
('Nghiem Xuan Tu', 'doctor', 'Nguyen Thi Ly', 'doctor', 012369715897),
('Pham Xuan Tu', 'teacher', 'Nguyen Thi Trang', 'doctor', 012369715897),
('Tran Xuan Tu', 'doctor', 'Nguyen Thi Khai', 'doctor', 012369715897),
('Le Xuan Tuong', 'teacher', 'Nguyen Thi Ly', 'doctor', 012369715897);

ALTER TABLE parents
ADD CONSTRAINT fk_par_stu
FOREIGN KEY (ID_student)
REFERENCES students(ID_student);
select *from parents;
