set search_path = "FinalProject";

CREATE TABLE UserAccount
(
UserID Integer,
Pass VARCHAR(16) NOT NULL,
FName VARCHAR(20) NOT NULL,
LName VARCHAR(20) NOT NULL,
Email VARCHAR(30) NOT NULL,
City VARCHAR(20),
Province VARCHAR(20),
Country VARCHAR(20) NOT NULL,
Primary Key (UserID)
);

CREATE TABLE Profile
(
ageRange VARCHAR(4) NOT NULL, 
yearBorn numeric(4,0) NOT NULL,
gender CHAR(1) NOT NULL,
occupation VARCHAR,
device VARCHAR,
CONSTRAINT chk_gender CHECK (gender = 'm' OR gender = 'f' OR gender = 'o')
);



CREATE TABLE Topics
(
TopicID SERIAL PRIMARY KEY,
Description VARCHAR(100)
);

CREATE TABLE Movie
(
MovieID SERIAL PRIMARY KEY,
Name VARCHAR(30) NOT NULL,
Length INTEGER,	
released Date NOT NULL,
description VARCHAR(600) NOT NULL
);


CREATE TABLE Watches
(
MovieID Integer,
UserID Integer, 
time Date NOT NULL,
Repeats Integer,
rating SMALLINT NOT NULL,
Primary key (MovieID, UserID),
Foreign Key (MovieID) REFERENCES Movie (MovieID),
Foreign Key (UserID) REFERENCES UserAccount (UserID)
);

CREATE TABLE MovieTopics
(
TopicID INTEGER,
MovieID INTEGER,
langauge VARCHAR(30),
subtitles boolean NOT NULL,
country VARCHAR(50) NOT NULL,
PRIMARY KEY (TopicID, MovieID),
FOREIGN KEY (TopicID) REFERENCES Topics (TopicID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);


CREATE TABLE Actor
(
ActorID SERIAL PRIMARY KEY,
lname VARCHAR(100) NOT NULL,
fname VARCHAR(100) NOT NULL,
dateBirth Date NOT NULL
);

CREATE TABLE Role
(
RoleID SERIAL PRIMARY KEY,
roleName VARCHAR(50) NOT NULL,
ActorID INTEGER,
FOREIGN KEY (ActorID) REFERENCES Actor (ActorID)
);

CREATE TABLE Director
(
DirectorID SERIAL PRIMARY KEY,
lname VARCHAR(100) NOT NULL,
fname VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL
);

CREATE TABLE Directs
(
DirectorID INTEGER,
MovieID INTEGER,
Primary key (MovieID, DirectorID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID),
FOREIGN KEY (DirectorID) REFERENCES Director (DirectorID)
);


CREATE TABLE Studio
(
StudioID SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL
);

CREATE TABLE Sponsors
(
StudioID INTEGER,
MovieID INTEGER,
FOREIGN KEY (StudioID) REFERENCES Studio (StudioID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE Actor_Movie
(
ActorID INTEGER,
MovieID INTEGER,
FOREIGN KEY (ActorID) REFERENCES Actor (ActorID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE Director_Movie
(
DirectorID INTEGER,
MovieID INTEGER,
FOREIGN KEY (DirectorID) REFERENCES Director (DirectorID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE User_Movie
(
UserID INTEGER,
MovieID INTEGER,
FOREIGN KEY (UserID) REFERENCES UserAccount (UserID),
FOREIGN KEY (MovieID) REFERENCES MovieID (MovieID)
);