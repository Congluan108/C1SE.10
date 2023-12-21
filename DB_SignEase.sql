Create database C1SE10_SignEase
Use C1SE10_SignEase;

Create table Signatures (
	ID_Sign varchar(10) primary key,
	ImgSign nvarchar(100) not null
);
INSERT INTO Signatures (ID_Sign, ImgSign) VALUES
('Sign1', 'https://res.cloudinary.com/dmdeegz4c/image/upload/v1702653337/SignEase/dsrfglg4l5uymnxo6c0v.jpg'),
('sign2', 'https://res.cloudinary.com/dmdeegz4c/image/upload/v1702653372/SignEase/obtrdz2ljfnrqwmovav9.jpg'),
('Sign3', 'https://res.cloudinary.com/dmdeegz4c/image/upload/v1702653361/SignEase/buhhgpo6eoienrxrhasm.jpg'),
('Sign4', 'https://res.cloudinary.com/dmdeegz4c/image/upload/v1702653327/SignEase/lwsq1c5d2nllkpntcv4j.jpg');

select * from Signatures

Create table Roles(
	ID_Role varchar(10) primary key,
	Role_name nvarchar(50)
);
insert into Roles (ID_Role, Role_name) values
	('Role1', N'Student'),
	('Role2', N'Lecturer'), 
	('Role3', N'Staff'),
	('Role4', N'Dean');

	
Create table Type_Document(
	ID_Type varchar(10) primary key,
	Type_name nvarchar(100)
);
insert into Type_Document (ID_Type, Type_name) values 
	('Doc1',N'Giấy Xác nhận NVQS'),
	('Doc2',N'Giấy Xác nhận Vay vốn cho sinh viên'),
	('Doc3',N'Giấy Xác nhận Đăng ký mở lớp học'),
	('Doc4',N'Giấy Xác nhận Tạm hoãn chương trình học');

Create table Users(
	ID_Account varchar(20) primary key,
	User_name varchar(20),
	Password varchar(20),
	First_name nvarchar(50),
	Last_name nvarchar(50),
	Email nvarchar(50),
	Phone varchar(10),
	Gender nvarchar(10),
	Address nvarchar(100),
	ID_Sign varchar(10) UNIQUE,
	ID_Role varchar(10) UNIQUE,
	constraint fk_ID_Sign foreign key(ID_Sign) references Signatures(ID_Sign),
	constraint fk_ID_Role foreign key(ID_Role) references Roles(ID_Role)
);

INSERT INTO Users (ID_Account, User_name, Password, First_name, Last_name,Email,Phone,Gender, Address, ID_Sign, ID_Role) VALUES
    ('26211236334', 'Congluan108', '123456', N'Dương Nguyễn Công', N'Luận', 'congluan@gmail.com', '1234567890', N'Nam', N'Đà Nẵng', 'Sign1', 'Role1'),
    ('26211234554', 'Quocnhat1', '123456', N'Nguyễn Quốc', N'Nhật', 'quocnhat@gmail.com', '1234567890', N'Nam', N'DakLak', 'Sign2', 'Role2'),
    ('26215968854', 'HDiem1', '123456', N'Lê Thị Hồng', N'Diễm', 'hdiem1008@gmail.com', '1234567890', N'Nữ', N'Quảng Trị', 'Sign3', 'Role3'),
    ('26211238899', 'Quocanh2', '123456', N'Nguyễn Hoàng Quốc', N'Anh', 'quocanh@gmail.com', '1234567890', N'Nam', N'Hà Tĩnh', 'Sign4', 'Role4');

	select * from Users

	select U.ID_Account,U.First_name + ' ' + U.Last_name AS Full_Name, U.User_name AS Username, U.Email, R.Role_name
	from Users U
	inner join Roles R ON U.ID_Role = R.ID_Role;


Create table Lecturers(
	ID_Lecturers varchar(10) primary key,
	ID_Account varchar(20) UNIQUE,
	constraint fk_ID_Account_Lecturers foreign key(ID_Account) references Users(ID_Account)
);
insert into Lecturers(ID_Lecturers, ID_Account) VALUES
	('Lec1', '26211234554');

Create table Dean(
	ID_Dean varchar(10) primary key,
	ID_Account varchar(20) UNIQUE,
	constraint fk_ID_Account_Dean foreign key(ID_Account) references Users(ID_Account)
);
insert into Dean(ID_Dean, ID_Account) VALUES
	('Dean1', '26211238899');
	
Create table Department(
	ID_Department varchar(10) primary key,
	Dep_name nvarchar(50),
	ID_Dean varchar(10) UNIQUE,
	constraint fk_ID_Dean foreign key(ID_Dean) references Dean(ID_Dean)
);

cREATE TABLE Class(
	ID_Class varchar(10) primary key,
	Class_name nvarchar(50),
	ID_Lecturers varchar(10),
	ID_Department varchar(10),
	constraint fk_ID_Lecturers foreign key(ID_Lecturers) references Lecturers(ID_Lecturers),
	constraint fk_Department foreign key(ID_Department) references Department(ID_Department)
);

Create table Student(
	ID_Student varchar(10) primary key,
	ID_Account varchar(20) UNIQUE,
	ID_Class varchar(10),
	constraint fk_ID_Account_Student foreign key(ID_Account) references Users(ID_Account),
	constraint fk_ID_Class foreign key(ID_Class) references Class(ID_Class)
);

Create table Document(
	ID_Doc varchar(10) primary key,
	Title nvarchar(100),
	Content nvarchar(100),
	ID_Type varchar(10),
	constraint fk_ID_Type foreign key(ID_Type) references Type_Document(ID_Type)
);

Create table Request(
	ID_Request varchar(10) primary key,
	Date_Req date,
	Status_Doc nvarchar(50),
	ID_Student varchar(10),
	ID_Doc varchar(10),
	constraint fk_ID_Student foreign key(ID_Student) references Student(ID_Student),
	constraint fk_ID_Docucment foreign key(ID_Doc) references Document(ID_Doc)
);

Create table HeadOfDepartment(
	ID_HeadOfDepartment varchar(10) primary key,
	ID_Account varchar(20) UNIQUE,
	constraint fk_ID_Account_HeadOfDepartment foreign key(ID_Account) references Users(ID_Account)
);

Create table PCTSV(
	ID_PCTSV varchar(10) primary key,
	ID_HeadOfDepartment varchar(10) UNIQUE,
	constraint fk_ID_HeadOfDepartment foreign key(ID_HeadOfDepartment) references HeadOfDepartment(ID_HeadOfDepartment)
);

Create table Approve(
	ID_Approve varchar(10) primary key,
	Date_Approve date,
	ID_Doc varchar(10),
	ID_PCTSV varchar(10),
	constraint fk_ID_Doc foreign key(ID_Doc) references Document(ID_Doc),
	constraint fk_ID_PCTSV foreign key(ID_PCTSV) references PCTSV(ID_PCTSV)
);


INSERT INTO Department (ID_Department, Dep_name, ID_Dean) VALUES
    ('Dep1', N'Department of Computer Science', 'Dean1');
   
INSERT INTO Class (ID_Class, Class_name, ID_Lecturers, ID_Department) VALUES
    ('Class1', N'Computer Science 101', 'Lec1', 'Dep1');
    
INSERT INTO Student (ID_Student, ID_Account, ID_Class) VALUES
    ('Student1', '26211236334', 'Class1');
    

INSERT INTO Document (ID_Doc, Title, Content, ID_Type) VALUES
    ('Document5', N'Research Proposal', N'Detailed research plan for the project', 'Doc1'),
    ('Document6', N'Loan Confirmation Letter', N'Confirmation of loan approval for students', 'Doc2');

INSERT INTO Request (ID_Request, Date_Req, Status_Doc, ID_Student, ID_Doc) VALUES
    ('Request1', '2023-01-01', N'Pending', 'Student1', 'Document5'),
    ('Request2', '2023-02-15', N'Approved', 'Student1', 'Document6');

INSERT INTO HeadOfDepartment (ID_HeadOfDepartment, ID_Account) VALUES
    ('HOD1', '26211234554');
   
INSERT INTO PCTSV (ID_PCTSV, ID_HeadOfDepartment) VALUES
    ('PCTSV1', 'HOD1');
   
INSERT INTO Approve (ID_Approve, Date_Approve, ID_Doc, ID_PCTSV) VALUES
    ('Approve1', '2023-03-01', 'Document5', 'PCTSV1');
 
