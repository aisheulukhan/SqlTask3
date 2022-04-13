--CREATE DATABASE Task3

--USE Task3

CREATE TABLE Posts(
    Id int identity(1,1) PRIMARY KEY,
	Content nvarchar(200),
	WhenShared date DEFAULT getdate(),
	UserId int references Users(Id),
	LikeCount int,
	IsDeleted bit
)
INSERT INTO Posts(Content,WhenShared,UserId,LikeCount,IsDeleted)
	VALUES('AAAAAA','',1,25,0),
	      ('BBBBBB','',2,40,0),
		  ('CCCCCC','',3,57,0),
		  ('DDDDDD','',4,80,0),
		  ('EEEEEE','',5,32,0),
		  ('FFFFFFF','',6,120,0),
		  ('GGGGGGG','',7,96,0)

CREATE TABLE Users(
	Id int identity(1,1) PRIMARY KEY,
	Login nvarchar(50),
	Password nvarchar(50),
	Mail nvarchar(50)
)
INSERT INTO Users(Login,Password,Mail)
	VALUES('aysu_mva)','aysu1234','aaaa@aaa.aa'),
		   ('iamzulfiyye','zulfiyye1234','bbbb@bbb.bb'),
		   ('sebine_novruzova','sebine1234','cccc@ccc.cc'),
		   ('uluxanova_.a','ayse1234','dddd@ddd.dd'),
		   ('guler_r','guler1234','eeee@eee.ee'),
		   ('anar_n','anar1234','ffff@fff.ff'),
		   ('semseddinamanov','shemi1234','gggg@ggg.gg')

CREATE TABLE Comments(
	Id int identity(1,1) PRIMARY KEY,
	UserId int references Users(Id),
	PostId int references Posts(Id),
	LikeCount int,
	IsDelete bit
)
SELECT * FROM Comments

INSERT INTO Comments(UserId,PostId,LikeCount,IsDelete)
	VALUES (1,1,10,0),
			(2,2,8,0),
			(3,3,5,0),
			(4,4,11,0),
			(5,5,23,0),
			(6,6,4,0),
			(7,7,36,0)

CREATE TABLE People(
	Id int identity(1,1) PRIMARY KEY,
	Name nvarchar (50),
	Surname nvarchar(60),
	Age int CHECK (Age >= 18)
)

INSERT INTO People(Name,Surname,Age)
	VALUES('Aysu','Memmedova',19),
	      ('Zulfiyye','Huseynova',19),
		  ('Sebine','Novruzova',21),
		  ('Ayse','Uluxanova',20),
		  ('Guler','Resulova',23),
		  ('Anar','Qandayev',21),
		  ('Semseddin','Amanov',22)
		  

---Query1
SELECT Posts.Id, COUNT (Comments.PostId) FROM Comments
JOIN Comments
ON Comments.PostId = Posts.Id
JOIN Posts
ON Comments.PostId = Posts.Id


SELECT Comments.PostId, COUNT(*) 
FROM Comments 
GROUP BY Comments.PostId


CREATE VIEW GetFullPostInfo
AS
SELECT * FROM People
SELECT * FROM Users
SELECT * FROM Posts
SELECT * FROM Comments