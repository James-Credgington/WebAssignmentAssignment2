 /****** Creating Subject Area table and adding values to the database too ******/


-- delete the table if it exists and drop any sequences that already exists--
--DROP TABLE IF EXISTS Admin.WebsiteAdministrator, Course.SubjectArea, Course.Course, Course.FavouriteCourse, Messaging.UserLogin, Course.Comment, Messaging.Friend, Messaging.Message, Messaging.GroupChat, Messaging.ChatAdministrator;
--DROP SEQUENCE IF EXISTS Room.CustomerRoomIdGenerator, Room.RoomTypeIdGenerator, Room.PriceIdGenerator;

-- deleting any schemas that already exist--


-- altering authorisation to all schemas to DBO --



-- select all names --
SELECT name, USER_NAME(principal_id) AS principal
FROM sys.schemas
WHERE name <> USER_NAME(principal_id);


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE SubjectArea (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(25) NOT NULL,
	ImageUrl nvarchar(300) NULL,
	AdditionalInformation nvarchar(1000),
	WebsiteAdminId int,
	RowCreateTime		datetime2(0) NULL,
	RowLastUpdateTime	datetime2(0) NULL

);
GO
ALTER TABLE SubjectArea
	ADD CONSTRAINT PKSubjectArea PRIMARY KEY CLUSTERED (Id);
GO
SET IDENTITY_INSERT SubjectArea ON
INSERT SubjectArea (ID, Name, ImageUrl, AdditionalInformation) VALUES (0, 'Engineering', NULL, NULL)
GO
INSERT SubjectArea (ID, Name, ImageUrl, AdditionalInformation) VALUES (1, 'Construction' , NULL, NULL)
GO
INSERT SubjectArea (ID, Name, ImageUrl, AdditionalInformation) VALUES (2, 'Public Services', NULL, NULL)
GO
INSERT SubjectArea (ID, Name, ImageUrl, AdditionalInformation) VALUES (3, 'Sport', NULL, NULL)
GO
INSERT SubjectArea (ID, Name, ImageUrl, AdditionalInformation) VALUES (4, 'Business', NULL, NULL)
GO
INSERT SubjectArea (ID, Name, ImageUrl, AdditionalInformation) VALUES (5, 'Digital Technologies', NULL, NULL)
GO
INSERT SubjectArea (ID, Name, ImageUrl, AdditionalInformation) VALUES (6, 'Health and Social Care', NULL, NULL)
GO
INSERT SubjectArea (ID, Name, ImageUrl, AdditionalInformation) VALUES (7, 'Childhood Studies', NULL, NULL)
GO

SET IDENTITY_INSERT Course.SubjectArea OFF
/****** adding primary key to the table *******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Creating Course table adding values to the database too ******/
CREATE TABLE Course (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(200) NOT NULL,
	ImageUrl nvarchar(300),
	AdditionalInformation nvarchar(1000),
	PartFullTime nvarchar(10) NOT NULL,
	LevelOfCourse int NOT NULL,
	SubjectAreaId int NOT NULL,
	RowCreateTime		datetime2(0) NULL,
	RowLastUpdateTime	datetime2(0) NULL

);
GO
ALTER TABLE Course
	ADD CONSTRAINT PKCourse PRIMARY KEY CLUSTERED (Id);
GO
GO
SET IDENTITY_INSERT Course.Course ON
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (0, 'HN in Engineering', NULL, NULL, 'Full-Time', 5, 0)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (1, 'HN in Engineering', NULL, NULL, 'Part-Time', 5, 0)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (2, 'FdSc in Building Engineering and Project Management', NULL, NULL, 'Full-Time', 5, 1)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (3, 'FdSc in Building Engineering and Project Management', NULL, NULL, 'Part-Time', 5, 1)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (4, 'HND Construction and the Built Environment', NULL, NULL, 'Part-Time', 5, 1)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (5, 'HNC Construction and the Built Environment', NULL, NULL, 'Part-Time', 4, 1)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (6, 'HND Public Services', NULL, NULL, 'Full-Time', 5, 2)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (7, 'HNC Public Services', NULL, NULL, 'Full-Time', 4, 2)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (8, 'FdSc Sport', NULL, NULL, 'Full-Time', 5, 3)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (9, 'HND Business', NULL, NULL, 'Full-Time', 5, 4)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (10, 'HND Business', NULL, NULL, 'Part-Time', 5, 4)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (11, 'BSc (Hons) Computer Networks', NULL, NULL, 'Full-Time', 6, 5)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (12, 'BSc (Hons) Computer Networks', NULL, NULL, 'Part-Time', 6, 5)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (13, 'BSc (Hons) Computer Software Development', NULL, NULL, 'Full-Time', 6, 5)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (14, 'BSc (Hons) Computer Software Development', NULL, NULL, 'Part-Time', 6, 5)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (15, 'FdSc Computer Networks', NULL, NULL, 'Full-Time', 5, 5)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (16, 'FdSc Computer Networks', NULL, NULL, 'Part-Time', 5, 5)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (17, 'FdSc Computer Software Development', NULL, NULL, 'Full-Time', 5, 5)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (18, 'FdSc Computer Software Development', NULL, NULL, 'Part-Time', 5, 5)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (19, 'FdSc Professional Practice and Health and Social Care', NULL, NULL, 'Full-Time', 5, 6)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (20, 'FdSc Professional Practice and Health and Social Care', NULL, NULL, 'Part-Time', 5, 6)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (21, 'FdA Childrens and Young Peoples services', NULL, NULL, 'Full-Time', 2, 6)
GO
INSERT Course (Id, Name, ImageUrl, AdditionalInformation, PartFullTime, LevelOfCourse, SubjectAreaId) VALUES (22, 'FdA Childrens and Young Peoples services', NULL, NULL, 'Part-Time', 2, 6)
GO

/*SET IDENTITY_INSERT Course.Course OFF
***** adding primary key to the table *******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Creating Comments table adding values to the database too ******/
CREATE TABLE Comment(
	Id int IDENTITY(1,1) NOT NULL,
	EmailAddress nvarchar(345) NOT NULL,
	CommentInformation nvarchar(1000) NOT NULL,
	DateAndTimeOfCommentSent datetime NOT NULL,
	CourseID int,
	RowCreateTime		datetime2(0) NOT NULL,
	RowLastUpdateTime	datetime2(0) NOT NULL

);
ALTER TABLE Comment
	ADD CONSTRAINT PKComment PRIMARY KEY CLUSTERED (Id);
GO

/****** Creating UserLogin table  ******/

CREATE TABLE UserLogin (
	Id int IDENTITY(1, 1) NOT NULL,
	FirstName varchar(30) NOT NULL,
	Surname varchar(30) NOT NULL,
	DateOfBirth varchar(15) NOT NULL,
	Gender varchar(15) NOT NULL,
	EmailAddress varchar(50) NOT NULL,
	PhoneNumber varchar(15) NOT NULL,
	CurrentStudent bit NOT NULL,
	Password varchar (15) NOT NULL,
	LoggedOn char NOT NULL,
	ProfilePicture nvarchar (30),
	FriendID int,
	RowCreateTime		datetime2(0) NOT NULL,
	RowLastUpdateTime	datetime2(0) NOT NULL

);
GO
ALTER TABLE UserLogin
	ADD CONSTRAINT PKUserLogin PRIMARY KEY CLUSTERED (Id);
GO

/****** Creating AdminLogin table ******/
CREATE TABLE WebsiteAdministrator (
	Id int IDENTITY(1, 1) NOT NULL,
	FirstName varchar(30) NOT NULL,
	Surname varchar(30) NOT NULL,
	DateOfBirth varchar(15) NOT NULL,
	Gender varchar(15) NOT NULL,
	EmailAddress varchar(50) NOT NULL,
	Password varchar (15) NOT NULL,
	LoggedOn bit NOT NULL,
	RowCreateTime		datetime2(0) NOT NULL,
	RowLastUpdateTime	datetime2(0) NOT NULL
);
ALTER TABLE WebsiteAdministrator
	ADD CONSTRAINT PKAdministrator PRIMARY KEY CLUSTERED (Id);
GO

/****** Creating FavouriteCourse table  ******/
CREATE TABLE FavouriteCourse (
	Id int IDENTITY(1, 1) NOT NULL,
	UserLoginId int NULL,
	CourseId int NULL,
	RowCreateTime		datetime2(0) NOT NULL,
	RowLastUpdateTime	datetime2(0) NOT NULL

);
ALTER TABLE FavouriteCourse
	ADD CONSTRAINT PKFavouriteCourse PRIMARY KEY CLUSTERED (Id);
GO

CREATE TABLE Friend (
	Id int IDENTITY(1, 1) NOT NULL,
	FirstName nvarchar(30) NOT NULL,
	Surname nvarchar(30) NOT NULL,
	DateOfBirth DateTime2(0) NOT NULL,
	Gender varchar(15) NOT NULL,
	EmailAddress nvarchar(50) NOT NULL,
	PhoneNumber nvarchar(11) NOT NULL,
	ProfilePicture nvarchar(300) NOT NULL,
	UserId int NOT NULL,
	RowCreateTime		datetime2(0) NOT NULL,
	RowLastUpdateTime	datetime2(0) NOT NULL

);
ALTER TABLE Friend
	ADD CONSTRAINT PKFriend PRIMARY KEY CLUSTERED (Id);
GO

CREATE TABLE Message (
	Id int IDENTITY(1, 1) NOT NULL,
	MessageText nvarchar(25) NOT NULL,
	DateOfMessageSent dateTime2 NOT NULL,
	FriendId int NOT NULL,
	UserId int NOT NULL,
	PictureInserted nvarchar(300) NOT NULL,
	VideoInserted nvarchar(100) NOT NULL,
	RowCreateTime		datetime2(0) NOT NULL,
	RowLastUpdateTime	datetime2(0) NOT NULL
);
ALTER TABLE Message
	ADD CONSTRAINT PKMessage PRIMARY KEY CLUSTERED (Id);
GO


CREATE TABLE GroupChat (
	Id int IDENTITY(1, 1) NOT NULL,
	Name nvarchar(40) NOT NULL,
	ProfilePicture nvarchar(300) NOT NULL,
	MessageId int NOT NULL,
	AdministratorId int NOT NULL,
	RowCreateTime		datetime2(0) NOT NULL,
	RowLastUpdateTime	datetime2(0) NOT NULL
);
ALTER TABLE GroupChat
	ADD CONSTRAINT PKGroupChat PRIMARY KEY CLUSTERED (Id);
GO

CREATE TABLE ChatAdministrator (
	Id int IDENTITY(1, 1) NOT NULL,
	GroupChatId int NOT NULL,
	UserId int NOT NULL,
	RowCreateTime		datetime2(0) NOT NULL,
	RowLastUpdateTime	datetime2(0) NOT NULL
);
ALTER TABLE ChatAdministrator
	ADD CONSTRAINT PKChatAdministrator PRIMARY KEY CLUSTERED (Id);
GO




/***** making relationships between different tables between the foreign keys and the primary keys ******/
ALTER TABLE Comment ADD  CONSTRAINT [DF_Image_DateAndTimeOfCommentSent]  DEFAULT (getdate()) FOR [DateAndTimeOfCommentSent]
GO

ALTER TABLE Course  WITH CHECK ADD  CONSTRAINT [FK_Course_SubjectArea] FOREIGN KEY(SubjectAreaId)
REFERENCES SubjectArea (Id)
GO

ALTER TABLE Comment  ADD CONSTRAINT [FK_Comment_Course] FOREIGN KEY(CourseId)
REFERENCES Course(Id)
GO

ALTER TABLE FavouriteCourse ADD CONSTRAINT [FK_FavouriteCourse_UserLogin] FOREIGN KEY(UserLoginId)
REFERENCES UserLogin (Id)
GO

ALTER TABLE FavouriteCourse ADD CONSTRAINT [FK_FavouriteCourse_Course] FOREIGN KEY(CourseId)
REFERENCES  Course (Id)
GO

ALTER TABLE SubjectArea  ADD CONSTRAINT [FK_SubjectArea_WebsiteAdminstrator] FOREIGN KEY(WebsiteAdminId)
REFERENCES WebsiteAdministrator(Id)
GO

ALTER TABLE UserLogin ADD CONSTRAINT [FK_UserLogin_Friend] FOREIGN KEY(FriendId)
REFERENCES Friend(Id)
GO

ALTER TABLE Message ADD CONSTRAINT [FK_Message_Friend] FOREIGN KEY(FriendId)
REFERENCES Friend(Id)
GO

ALTER TABLE GroupChat ADD CONSTRAINT [FK_Message_GroupChat] FOREIGN KEY(MessageId)
REFERENCES Message(Id)
GO

ALTER TABLE GroupChat ADD CONSTRAINT [FK_GroupChat_UserLogin] FOREIGN KEY(AdministratorId)
REFERENCES UserLogin(Id)
GO

