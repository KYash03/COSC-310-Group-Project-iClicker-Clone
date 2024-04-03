CREATE DATABASE iClicker;
go;
USE iClicker;
go;

CREATE TABLE EndUser (
    UserId VARCHAR(10) PRIMARY KEY,
    UserName VARCHAR(20),
    University VARCHAR(20)
);

CREATE TABLE UserCredential (
    UserId VARCHAR(10) PRIMARY KEY,
    Pass VARCHAR(30),
    FOREIGN KEY (UserId) REFERENCES EndUser(UserId) ON DELETE CASCADE
);

CREATE TABLE Student (
    StudentId VARCHAR(10) PRIMARY KEY,
    Major VARCHAR(20),
    FOREIGN KEY (StudentId) REFERENCES EndUser(UserId) ON DELETE CASCADE
);

CREATE TABLE Instructor (
    InstructorId VARCHAR(10) PRIMARY KEY,
    Department VARCHAR(20),
    FOREIGN KEY (InstructorId) REFERENCES EndUser(UserId) ON DELETE CASCADE
);

CREATE TABLE Course (
    CourseId INT Identity,
    CourseCode VARCHAR(20),
    CourseName VARCHAR(100),
    InstructorId VARCHAR(10),
    PRIMARY KEY (CourseId),
    FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId) ON DELETE CASCADE
);

CREATE TABLE Sess (
    SessId INT Identity,
    CourseId INT,
    StartDate DATE,
    EndDate DATE,
    SessStatus VARCHAR(20),
    PRIMARY KEY (SessId),
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId) ON DELETE CASCADE
);

CREATE TABLE Enroll (
    StudentId VARCHAR(10),
    CourseId INT,
    PRIMARY KEY (StudentId, CourseId),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId) ON DELETE CASCADE
);

CREATE TABLE Joins (
    SessId INT,
    StudentId VARCHAR(10),
    PRIMARY KEY (SessId, StudentId),
    FOREIGN KEY (SessId) REFERENCES Sess(SessId),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId) 
);

CREATE TABLE Poll (
    PollId INT Identity,
    SessId INT,
    Prompt VARCHAR(100),
    OptionOne VARCHAR(30),
    OptionTwo VARCHAR(30),
    OptionThree VARCHAR(30),
    OptionFour VARCHAR(30),
    CorrectOption VARCHAR(30),
    PRIMARY KEY (PollId),
    FOREIGN KEY (SessId) REFERENCES Sess(SessId) ON DELETE CASCADE
);

CREATE TABLE Respond (
    PollId INT,
    StudentId VARCHAR(10),
    Respond VARCHAR (20),
    PRIMARY KEY (PollId,StudentId),
    FOREIGN KEY (PollId) REFERENCES Poll(PollId),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId) 
);

CREATE TABLE PollStatistics (
    PollId INT,
    PollAccuracy DECIMAL(4,2),
    OptionDensityOne DECIMAL(4,2),
    OptionDensityTwo DECIMAL(4,2),
    OptionDensityThree DECIMAL(4,2),
    OptionDensityFour DECIMAL(4,2),
    PRIMARY KEY (PollId),
    FOREIGN KEY (PollId) REFERENCES Poll(PollId) ON DELETE CASCADE
);

Insert into EndUser VALUES('1','abc','UBCO');
Insert into EndUser VALUES('2','def','UBCO');
Insert into EndUser VALUES('3','xyz','UBCO');

Insert into UserCredential VALUES('1','abc');
Insert into UserCredential VALUES('2','def');
Insert into UserCredential VALUES('3','xyz');

Insert into Student VALUES('1','COSC');
Insert into Student VALUES('2','COSC');

Insert into Instructor VALUES('3','COSC');

Insert into Course(CourseCode, CourseName, InstructorId) VALUES('COSC 310','Software Engineering','3');

Insert into Sess(CourseId, StartDate, EndDate, SessStatus) VALUES('1','2023-01-01','2023-04-01','ended');

Insert into Enroll VALUES('1',1);
Insert into Enroll VALUES('2',1);

Insert into Joins VALUES(1,'1');
Insert into Joins VALUES(1,'2');

Insert into Poll(SessId, Prompt, OptionOne, OptionTwo, OptionThree, OptionFour, CorrectOption) VALUES(1,'what is the day today','Mond','Tues','Wed','Thurs','Wed');

Insert into Respond VALUES(1,'1','Wed');
Insert into Respond VALUES(1,'2','Tues');

Insert into PollStatistics VALUES(1,0.5,0,0.5,0.5,0);
