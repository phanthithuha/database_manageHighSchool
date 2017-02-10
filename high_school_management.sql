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
values 
	('A1','Admin 1', '123456789'),
	('A2','Admin 2', '123456785559'),
	('US','user', '120003456789');
select *from users;


-- subjects
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
    lft int, 
    rght int,
    parent_id int,
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

-- teachers
create table if not exists teachers (
	ID_teacher varchar(100) not null,
    name_teacher varchar(100) COLLATE utf8_unicode_ci not null,
    address varchar(100) COLLATE utf8_unicode_ci not null,
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
select *from classes;


-- create table "STUDENTS"
create table if not exists students (
	ID_student int auto_increment not null,
    name_student varchar(100) COLLATE utf8_unicode_ci not null,
    gender varchar(10) COLLATE utf8_unicode_ci not null,
    ID_class varchar(100),
    date_of_birth date,
    address varchar(100) COLLATE utf8_unicode_ci,
    ethnic varchar(100) COLLATE utf8_unicode_ci,
    religion varchar(100) COLLATE utf8_unicode_ci,
    avatar varchar(100) default null,
    phone varchar(100),
    email varchar(100),
    primary key(ID_student)
);
-- drop table students;
-- alter "STUDENTS", add foreign key
-- towns
ALTER TABLE students
ADD CONSTRAINT fk_stu_clas
FOREIGN KEY (ID_class)
REFERENCES classes(ID_class);

-- insert data into table "STUDENTS"
insert into students
	(name_student,gender,ID_class, date_of_birth, address, ethnic,
    religion, avatar,phone, email)
values
	('Phan Thi Thu Ha','Female','E11','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
    'No','01647303115','ha.phan@student.passerellesnumeriques.org'),
    
    ('Phan Thi Thu Ha','Female','E10','1997-10-10','Thon 9 - Trung Giang - Gio Linh - Quang Tri','Kinh', 'Buddhism',
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
    grade_se1 float not null,
    grade_se2 float not null,
    final_grade float(2,1) not null,
    ID_proficiency varchar(100) not null,
    ID_conduct varchar(100) not null,
    classification varchar(100) not null,
    primary key(ID_student)
);
 -- drop table classifications;

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

insert into classifications(grade_se1, grade_se2, final_grade,ID_proficiency,ID_conduct,classification)
values 
(8.5, 7.9, (grade_se1 + grade_se2*2)/3 , 'G', 'G', 'Good student'),
(6.5, 7.9, (grade_se1 + grade_se2*2)/3 , 'MI', 'G', 'quite good student'),
(9.5, 7.9, (grade_se1 + grade_se2*2)/3 ,'G', 'G', 'Good student'),
(3.4, 3.9, (grade_se1 + grade_se2*2)/3,'TW', 'QG', 'Weak student'),
(7.5, 7.9, (grade_se1 + grade_se2*2)/3 , 'MI', 'G', 'quite good student'),
(6.5, 7.9, (grade_se1 + grade_se2*2)/3 , 'MI', 'G', 'quite good student'),
(6.7, 7.9, (grade_se1 + grade_se2*2)/3 ,'MI', 'G', 'quite good student'),
(9.5, 7.9, (grade_se1 + grade_se2*2)/3 , 'G', 'G', 'Good student'),
(3.4, 3.9, (grade_se1 + grade_se2*2)/3 ,'TW', 'QG', 'Weak student'),
(7.5, 7.9, (grade_se1 + grade_se2*2)/3 , 'MI', 'G', 'quite good student'),
(6.5, 7.9, (grade_se1 + grade_se2*2)/3 ,'MI', 'G', 'quite good student'),
(6.7, 7.9, (grade_se1 + grade_se2*2)/3 , 'MI', 'G', 'quite good student'),
(9.5, 7.9, (grade_se1 + grade_se2*2)/3 , 'G', 'G', 'Good student'),
(3.4, 4.9, (grade_se1 + grade_se2*2)/3 , 'TW', 'QG', 'Weak student'),
(7.5, 7.9, (grade_se1 + grade_se2*2)/3 , 'MI', 'G', 'quite good student'),
(6.5, 7.9, (grade_se1 + grade_se2*2)/3 ,'MI', 'G', 'quite good student'),
(6.7, 7.9, (grade_se1 + grade_se2*2)/3 ,'MI', 'G', 'quite good student'),
(7.8, 7.9, (grade_se1 + grade_se2*2)/3 , 'MI', 'G', 'quite good student'),
(6.7, 7.9, (grade_se1 + grade_se2*2)/3 ,'MI', 'G', 'quite good student');


select *from classifications;

create table if not exists parents (
	ID_student int auto_increment not null,    
    father_name varchar(100) COLLATE utf8_unicode_ci default null,
    job_father varchar(100) COLLATE utf8_unicode_ci default null,
    mother_name varchar(100) COLLATE utf8_unicode_ci default null,
    job_mother varchar(100) COLLATE utf8_unicode_ci default null,
    phone varchar(100) default null,
    primary key(ID_student)
);
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

-- end create table
-- =======================================PROCEDURE============================================

-- đếm học sinh giỏi

delimiter $$
create procedure count_good_student(
	out total int
)
begin 
	select count(ID_student)
    into total from classifications
    where final_grade >= 8;
end $$
call count_good_student(@total);
select @total as total_good_student;

-- drop procedure count_good_student;

-- đếm học sinh khá
delimiter $$
create procedure count_quite_good_student(
	out total int
)
begin 
	select count(ID_student)
    into total from classifications
    where final_grade >= 6.5 and final_grade <8;
end $$
call count_quite_good_student(@total);
select @total as total_quite_good_student;
-- drop procedure count_quite_good_student;

-- procedure 
-- xem thong tin hoc sinh theo ID
delimiter $$
drop procedure if exists get_student_by_ID $$
create procedure get_student_by_ID(
in ID_value int(11)
)
begin 	
	select *from students
		where ID_student = ID_value;
	end $$
call get_student_by_ID(2);

-- ===============================
-- tim thong tin hoc sinh theo dia chi
delimiter $$
drop procedure if exists get_student_by_address $$
create procedure get_student_by_address(
in address_ varchar(255)
)
begin 	
	select *from students
		where address = address_;
	end $$
call get_student_by_address('Thon 9 - Trung Giang - Gio Linh - Quang Tri');
-- =================TRIGGER========================================

create table students_audit(
	id int(11) not null auto_increment,
    name_student varchar(50) not null,
    address varchar(50) not null,
    changedon datetime,
    action varchar(50),
    primary key (id)

);

delimiter $$
create trigger before_student_update
before update on students
for each row 
begin 
	insert into students_audit
    set action = 'update',
	name_student = OLD.name_student,
    address = OLD.address,
    changedon = now();
end $$

update students set address = 'Thôn 7 - Gio Hải - Gio Linh - Quảng Trị ' 
where ID_student = 7;
select *from students_audit;

-- trigger 
-- drop table students_audit;

create table  classifications_audit(
	id int(11) not null auto_increment,
	ID_student int(11) not null,
    changedon date default null,
	final_grade float,
    action_1 varchar(50) default null,
    primary key(id)
); 
-- insert trigger

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' TRIGGER before_classification_insert_validation

BEFORE INSERT ON classifications
FOR EACH ROW
 
BEGIN
    
    IF (NEW.grade_se1 < 0 OR NEW.grade_se1 > 10) THEN
		SIGNAL SQLSTATE '45000' -- lập trình báo lỗi (45000) --
        SET message_text = 'The mark is not valid'; -- H?p thu l?i --
	END IF;
END $$

-- drop trigger before_classification_insert_validation
-- update trigger
DELIMITER $$

-- update trigger
DROP TRIGGER IF EXISTS before_classification_update_validation $$
CREATE DEFINER = 'root'@'localhost' TRIGGER before_classification_update_validation

BEFORE update ON classifications
FOR EACH ROW
 
BEGIN
    
    IF (NEW.grade_se1 < 0 OR NEW.grade_se1 > 10) THEN
		SIGNAL SQLSTATE '45000' -- lập trình báo lỗi (45000) --
        SET message_text = 'The mark is not valid'; -- H?p thu l?i --
	END IF;
END $$

update classifications set grade_se1=11
where ID_student = 8;


select *from classifications_audit;

-- trigger


-- ==============================================================
-- cursor 
-- drop function FindID111;
delimiter $$
CREATE FUNCTION FindID111 ( name_in VARCHAR(50) )
RETURNS int

BEGIN

   DECLARE done INT DEFAULT FALSE;
   DECLARE siteID int ;

   DECLARE c1 CURSOR FOR
     SELECT ID_student
     FROM students
     WHERE name_student = name_in;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

   OPEN c1;
   FETCH c1 INTO siteID;

   CLOSE c1;

   RETURN siteID;

END; 
select count(highschool_management.FindID111('Phan Thi Thu Ha'))as IDstudent;


-- find name
delimiter $$
CREATE FUNCTION Find_name ( id_in int(11) )
RETURNS varchar(255)

BEGIN

   DECLARE done INT DEFAULT FALSE;
   DECLARE site_name varchar(255) ;

   DECLARE c2 CURSOR FOR
     SELECT name_student
     FROM students
     WHERE ID_student = id_in;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

   OPEN c2;
   FETCH c2 INTO site_name;

   CLOSE c2;

   RETURN site_name;

END; 
select highschool_management.Find_name(7);

-- ================================================================
drop function total_teacher;
delimiter $$
create function total_teacher( teacher_id varchar(100) )
returns int
reads sql data
begin
     declare total int default 0;
     select count(ID_teacher) into total
    from teachers
    where ID_teacher = teacher_id
    group by ID_teacher;

    return total;
end  $$
delimiter ;
select highschool_management.total_teacher('B1');

-- function MARK
delimiter $$
create function function_mark_average(id_student int(11))
	returns float(2,1)
    reads sql data
begin
	declare total_mark float;
    declare average float;
    declare no_of_student int;
    
    select sum(final_grade)
    into total_mark from classifications;
    select count(ID_student) into no_of_student
    from classifications;
    set average = total_mark/no_of_student;
    
    return average;
end $$
select highschool_management.function_mark_average();

-- drop function highschool_management.function_mark_average;
 -- Xem ten, lop, mon giao vien  --
/*
create view view_data_teacher as 
    select 
    t.name_teacher as NameTeacher,
		   c.name_class as Class,
           s.name_subject as NameSubject
           from teachers as t
            join classes as c on t.ID_teacher=c.ID_teacher 
             join subjects as s on t.ID_teacher=c.ID_teacher
             order by t.ID_teacher;
           select *from view_data_teacher;
*/
		 -- Xem ten bo, me, hoc sinh,sdt, lop --
create view view_data_parent as 
    select 
    s.ID_student as ID_of_student,
   s.name_student as NameStudent,
   p.father_name as Father,
   p.mother_name as Mother,
   c.name_class as Class,
   p.phone as Phone
           from parents as p
           join students as s on s.ID_student = p.ID_student
            join classes as c on s.ID_class = c.ID_class 
             order by s.ID_student;
           select *from view_data_parent;
          -- drop view view_data_parent;
-- ================================================================
-- ================================ Fulltext Search Student =========================================--
alter table students add fulltext(name_student)
select 	 name_student,
		  gender,
          ID_class, 
          date_of_birth, 
          address, ethnic,
		  religion, 
          avatar,
          phone, 
          email 
	from 		students 
	where
	Match	(name_student) Against ('Nguyen');
    
    
-- ================================ Fulltext Search  =========================================--
alter table students add fulltext(name_student,gender)
select 	 name_student,
		  gender,
          ID_class, 
          date_of_birth, 
          address,
          ethnic,
		  religion, 
          avatar,
          phone, 
          email 
	from 		students 
	where
	Match	(name_student,gender)  Against	('+Phan,+male ' IN BOOLEAN MODE);
    
    -- ================================ Fulltext Search  =========================================--
alter table students add fulltext(name_student,address)
select 	 name_student,
		  gender,
          ID_class, 
          date_of_birth, 
          address,
          ethnic,
		  religion, 
          avatar,
          phone, 
          gender,
          email 
	from 		students 
	where
	Match	(name_student,address)  Against	('+Phan,+Trung ' IN BOOLEAN MODE);
    
-- ================================ Fulltext Search Teacher  =========================================--
alter table teachers add fulltext(name_teacher)
select 	 name_teacher,
    address,
    phone,
    ID_subject
	from 		teachers 
	where
	Match	(name_teacher)  Against	('Duc' IN BOOLEAN MODE);
    drop database highschool_management;
    
-- ============================= Like Search ================================--
select 	 name_student,
		  gender,
          ID_class, 
          date_of_birth, 
          address, ethnic,
		  religion, 
          avatar,
          phone, 
          email 
	from 		students 
	where name_student like '%Phan%';
-- ================================ Like Search  =========================================--
SELECT   father_name,
		job_father,
        mother_name,
        job_mother,
        phone  
FROM parents   
WHERE  father_name like '%T%';

-- ================================ Index   =========================================--
use highschool_management;
CREATE INDEX students
ON students (
			ID_student
			
          );
select * from students;
          
-- ================================ Index   =========================================--
CREATE INDEX father
ON parents (
		father_name,
		job_father,
        mother_name,
        job_mother,
        phone  
			
          );
select * from parents;
drop database highschool_management;
-- ================================ Index   =========================================--
CREATE INDEX teachers
ON teachers (
    name_teacher,
    address,
    phone,
    ID_subject
          );
select * from teachers;



-- ================================ Query  =========================================--



-- ==================================================================================
select *from users;
select *from students;
select *from parents;
select *from teachers;
select *from subjects;
select *from classifications;
select *from classes;
select *from conducts;
select *from proficiency;
-- notes
-- 1. Viết tiếng việt
-- nhap varchar(10) COLLATE utf8_unicode_ci default null

