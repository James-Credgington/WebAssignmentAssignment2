 /****** Creating Subject Area table and adding values to the database too ******/
USE HigherEducationChesterfieldCollege
GO

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

);
GO
/* Primary key for Subject Area */
ALTER TABLE SubjectArea
	ADD CONSTRAINT PKSubjectArea PRIMARY KEY CLUSTERED (Id);
GO
SET IDENTITY_INSERT SubjectArea ON

/* Inserting values for Subject area table */
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

SET IDENTITY_INSERT SubjectArea OFF
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


);
GO

/* Adding a primary key to the Course table */
ALTER TABLE Course
	ADD CONSTRAINT PKCourse PRIMARY KEY CLUSTERED (Id);
GO
GO
SET IDENTITY_INSERT Course ON

/* Adding values to the course table */
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
	CourseId int


);

/* Creating a primary key for Comment table */
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
	PhoneNumber varchar(15) NULL,
	CurrentStudent varchar(3) NOT NULL,
	Password varchar(15) NULL,
	ProfilePicture nvarchar(4000) NULL,
	CourseId int NULL,
	Description nvarchar(1000) NULL,
	FriendId int NULL,


);
GO

/* Creating a primary key for UserLogin table */
ALTER TABLE UserLogin
	ADD CONSTRAINT PKUserLogin PRIMARY KEY CLUSTERED (Id);
GO

/****** Creating WebsiteAdministrator table ******/
CREATE TABLE WebsiteAdministrator (
	Id int IDENTITY(1, 1) NOT NULL,
	FirstName varchar(30) NOT NULL,
	Surname varchar(30) NOT NULL,
	DateOfBirth varchar(15) NOT NULL,
	Gender varchar(15) NOT NULL,
	EmailAddress varchar(50) NOT NULL,
	Password varchar (15) NOT NULL,
	LoggedOn bit NOT NULL,
);

/* Creating a primary key for WebsiteAdministrator table */
ALTER TABLE WebsiteAdministrator
	ADD CONSTRAINT PKAdministrator PRIMARY KEY CLUSTERED (Id);
GO


/****** Creating Friend table ******/
CREATE TABLE Friend (
	Id int IDENTITY(1, 1) NOT NULL,
	FirstName varchar(30) NOT NULL,
	Surname varchar(30) NOT NULL,
	DateOfBirth varchar(15) NOT NULL,
	CurrentStudent varchar(3) NOT NULL,
	Gender varchar(15) NOT NULL,
	EmailAddress varchar(50) NOT NULL,
	PhoneNumber varchar(15) NOT NULL,
	ProfilePicture nvarchar(4000) NOT NULL,
	UserId int NOT NULL,
	CourseId int NULL,
	FriendRequest int NULL,
);

/* Creating a primary key for Friend table */
ALTER TABLE Friend
	ADD CONSTRAINT PKFriend PRIMARY KEY CLUSTERED (Id);
GO

/****** Creating Message table ******/
CREATE TABLE Message (
	Id int IDENTITY(1, 1) NOT NULL,
    FriendId int NULL,
	UserId int NOT NULL,
	MessageText nvarchar(500) NULL,
	PictureInserted nvarchar(4000) NULL,
	VideoInserted nvarchar(4000) NULL,
	DateOfMessageSent date NOT NULL,
	TimeOfMessageSent time(7) NOT NULL,


);

/* Creating a primary key for Message table */
ALTER TABLE Message
	ADD CONSTRAINT PKMessage PRIMARY KEY CLUSTERED (Id);
GO

/****** Creating Groupchat table ******/
CREATE TABLE GroupChat (
	Id int IDENTITY(1, 1) NOT NULL,
	Name nvarchar(40) NOT NULL,
	ProfilePicture nvarchar(4000) NOT NULL,

	AdministratorId int NOT NULL
);

/* Creating a primary key for GroupChat table */
ALTER TABLE GroupChat
	ADD CONSTRAINT PKGroupChat PRIMARY KEY CLUSTERED (Id);
GO

/****** Creating GroupMember table ******/
CREATE TABLE GroupMember (
	Id int IDENTITY(1, 1) NOT NULL,
	FriendId int NOT NULL,
	GroupChatId int NOT NULL

)
/* Creating a primary key for GroupMember table */
ALTER TABLE GroupMember
	ADD CONSTRAINT PKGroupMember PRIMARY KEY CLUSTERED (Id);
GO

/****** Creating GroupMessage table ******/
CREATE TABLE GroupMessage (
	Id int IDENTITY(1, 1) NOT NULL,
	GroupMemberId int NOT NULL,
	MessageText nvarchar(500) NOT NULL,
	DateOfMessageSent date NOT NULL,
	TimeOfMessageSent time(7) NOT NULL,

)

/* Creating a primary key for GroupMessage table */
ALTER TABLE GroupMessage
	ADD CONSTRAINT PKGroupMessage PRIMARY KEY CLUSTERED (Id);
GO







/***** making relationships between different tables between the foreign keys and the primary keys ******/

ALTER TABLE Comment ADD  CONSTRAINT [DF_Image_DateAndTimeOfCommentSent]  DEFAULT (getdate()) FOR [DateAndTimeOfCommentSent]
GO

ALTER TABLE Message ADD CONSTRAINT [DF_Message_DateOfMessageSent] DEFAULT (getdate()) FOR [DateOfMessageSent];

ALTER TABLE Course  WITH CHECK ADD  CONSTRAINT [FK_Course_SubjectArea] FOREIGN KEY(SubjectAreaId)
REFERENCES SubjectArea (Id)
GO

ALTER TABLE Comment  ADD CONSTRAINT [FK_Comment_Course] FOREIGN KEY(CourseId)
REFERENCES Course(Id)
GO


ALTER TABLE UserLogin ADD CONSTRAINT [FK_UserLogin_Friend] FOREIGN KEY(FriendId)
REFERENCES Friend(Id)
GO

ALTER TABLE Message ADD CONSTRAINT [FK_Message_Friend] FOREIGN KEY(FriendId)
REFERENCES Friend(Id)
GO

ALTER TABLE Message ADD CONSTRAINT [FK_Message_UserLogin] FOREIGN KEY(UserId)
REFERENCES UserLogin(Id)
GO



ALTER TABLE GroupMember  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_GroupChat] FOREIGN KEY(GroupChatId)
REFERENCES GroupChat (Id)
GO

ALTER TABLE GroupMember  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_UserLogin] FOREIGN KEY(FriendId)
REFERENCES UserLogin (Id)
GO


ALTER TABLE GroupMessage WITH CHECK ADD CONSTRAINT [FK_GroupMessage_GroupMember] FOREIGN KEY(GroupMemberId) 
REFERENCES GroupMember (Id)
GO

ALTER TABLE GroupChat ADD CONSTRAINT [FK_GroupChat_UserLogin] FOREIGN KEY(AdministratorId)
REFERENCES UserLogin (Id)
GO
