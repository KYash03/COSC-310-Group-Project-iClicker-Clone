Drop DATABASE iClicker IF EXISTS;
CREATE DATABASE iClicker;
USE iClicker;

DROP TABLE IF EXISTS EndUser;
DROP TABLE IF EXISTS UserCredential;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Sess;
DROP TABLE IF EXISTS Enroll;
DROP TABLE IF EXISTS Joins;
DROP TABLE IF EXISTS Poll;
DROP TABLE IF EXISTS Respond;
DROP TABLE IF EXISTS PollStatistics;


CREATE TABLE EndUser (
    UserId VARCHAR(10) PRIMARY KEY,
    UserName VARCHAR(20),
    University VARCHAR(20)
);

CREATE TABLE UserCredential (
    UserId VARCHAR(10) PRIMARY KEY,
    Pass VARCHAR(30),
    FOREIGN KEY (UserId) REFERENCES EndUser(UserId) on delete cascade
);

CREATE TABLE Student (
    StudentId VARCHAR(10) PRIMARY KEY,
    Major VARCHAR(20),
    FOREIGN KEY (StudentId) REFERENCES EndUser(UserId) on delete cascade
);

CREATE TABLE Instructor (
    InstructorId VARCHAR(10) PRIMARY KEY,
    Department VARCHAR(20),
    FOREIGN KEY (InstructorId) REFERENCES EndUser(UserId) on delete cascade
);

CREATE TABLE Course (
    CourseId INT NOT NULL AUTO_INCREMENT,
    CourseCode VARCHAR(20),
    CourseName VARCHAR(100),
    InstructorId VARCHAR(10),
    PRIMARY KEY (CourseId),
    FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId) on delete cascade
);

CREATE TABLE Sess (
    SessId INT NOT NULL AUTO_INCREMENT,
    CourseId INTEGER,
    StartDate DATE,
    EndDate DATE,
    SessStatus VARCHAR(20),
    PRIMARY KEY (SessId),
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId) on delete cascade
);

CREATE TABLE Enroll (
    StudentId VARCHAR(10),
    CourseId INTEGER,
    PRIMARY KEY (StudentId, CourseId),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId) on delete cascade ,
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId) on delete cascade
);

CREATE TABLE Joins (
    SessId INTEGER,
    StudentId VARCHAR(10),
    PRIMARY KEY (SessId, StudentId),
    FOREIGN KEY (SessId) REFERENCES Sess(SessId) on delete cascade ,
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId) on delete cascade
);

CREATE TABLE Poll (
    PollId INT NOT NULL AUTO_INCREMENT,
    SessId INTEGER,
    Prompt VARCHAR(100),
    OptionOne VARCHAR(30),
    OptionTwo VARCHAR(30),
    OptionThree VARCHAR(30),
    OptionFour VARCHAR(30),
    CorrectOption VARCHAR(30),
    PRIMARY KEY (PollId),
    FOREIGN KEY (SessId) REFERENCES Sess(SessId) on delete cascade
);

CREATE TABLE Respond (
    PollId INTEGER,
    StudentId VARCHAR(10),
    Respond VARCHAR (20),
    PRIMARY KEY (PollId,StudentId),
    FOREIGN KEY (PollId) REFERENCES Poll(PollId) on delete cascade,
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId) on delete cascade
);

CREATE TABLE PollStatistics (
    PollId INTEGER,
    PollAccuracy DECIMAL(4,2),
    OptionDensityOne DECIMAL(4,2),
    OptionDensityTwo DECIMAL(4,2),
    OptionDensityThree DECIMAL(4,2),
    OptionDensityFour DECIMAL(4,2),
    PRIMARY KEY (PollId),
    FOREIGN KEY (PollId) REFERENCES Poll(PollId) on delete cascade
);

Insert into EndUser VALUES("1","abc","UBCO");
Insert into EndUser VALUES("2","def","UBCO");
Insert into EndUser VALUES("3","xyz","UBCO");

Insert into UserCredential VALUES("1","abc");
Insert into UserCredential VALUES("2","def");
Insert into UserCredential VALUES("3","xyz");

Insert into Student VALUES("1","COSC");
Insert into Student VALUES("2","COSC");

Insert into Instructor VALUES("3","COSC");

Insert into Course(CourseCode, CourseName, InstructorId) VALUES("COSC 310","Software Engineering","3");

Insert into Sess(CourseId, StartDate, EndDate, SessStatus) VALUES("1","2023-01-01","2023-04-01","INACTIVE");

Insert into Enroll VALUES("1","1");
Insert into Enroll VALUES("2","1");

Insert into Joins VALUES("1","1");
Insert into Joins VALUES("1","2");

Insert into Poll(SessId, Prompt, OptionOne, OptionTwo, OptionThree, OptionFour, CorrectOption) VALUES("1","what is the day today","Mond","Tues","Wed","Thurs","Wed");

Insert into Respond VALUES(1,"1","Wed");
Insert into Respond VALUES(1,"2","Tues");

Insert into PollStatistics VALUES(1,0.5,0,0.5,0.5,0);