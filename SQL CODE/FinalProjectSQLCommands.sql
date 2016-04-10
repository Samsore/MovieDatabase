set search_path = "public";
set datestyle = mdy;

CREATE TABLE UserAccount
(
UserID SERIAL PRIMARY KEY,
username VARCHAR(20) NOT NULL,
Pass VARCHAR(16) NOT NULL,
lname VARCHAR(20), 
fname VARCHAR(20), 
email VARCHAR(30) NOT NULL,
city VARCHAR(20),
province VARCHAR(20),
country VARCHAR(20)
);

CREATE TABLE Profile
(
UserID Integer,
ageRange VARCHAR(4) NOT NULL, 
yearBorn numeric(4,0) NOT NULL,
gender CHAR(1) NOT NULL,
occupation VARCHAR,
device VARCHAR,
CONSTRAINT chk_gender CHECK (gender = 'm' OR gender = 'f' OR gender = 'o'),
FOREIGN KEY(UserID) REFERENCES UserAccount (UserID)
);

CREATE TABLE Topics
(
TopicID SERIAL PRIMARY KEY,
Description VARCHAR(100)
);

CREATE TABLE Movie
(
MovieID SERIAL PRIMARY KEY,
Name VARCHAR(250) NOT NULL,
Length INTEGER,	
released Date NOT NULL,
description VARCHAR(1200) NOT NULL,
links VARCHAR(2000)
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
languages VARCHAR(30),
subtitles boolean NOT NULL,
country VARCHAR(50) NOT NULL,
PRIMARY KEY (TopicID, MovieID),
FOREIGN KEY (TopicID) REFERENCES Topics (TopicID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE Actor
(
ActorID SERIAL PRIMARY KEY,
lname VARCHAR(100),
fname VARCHAR(100) NOT NULL,
dateBirth Date NOT NULL
);

CREATE TABLE Role
(
RoleID SERIAL PRIMARY KEY,
roleName VARCHAR(50) NOT NULL,
ActorID INTEGER,
MovieID INTEGER,
FOREIGN KEY (ActorID) REFERENCES Actor (ActorID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE Director
(
DirectorID SERIAL PRIMARY KEY,
lname VARCHAR(100) NOT NULL,
fname VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL
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
comment VARCHAR(2000),
FOREIGN KEY (UserID) REFERENCES UserAccount (UserID),
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

INSERT INTO Topics (description) values ('Horror');
INSERT INTO Topics (description) values ('Comedy');
INSERT INTO Topics (description) values ('Thriller');
INSERT INTO Topics (description) values ('Action');
INSERT INTO Topics (description) values ('Animation');
INSERT INTO Topics (description) values ('Adventure');
INSERT INTO Topics (description) values ('Crime');
INSERT INTO Topics (description) values ('Drama');
INSERT INTO Topics (description) values ('Fantasy');
INSERT INTO Topics (description) values ('Sci-Fi');
INSERT INTO Topics (description) values ('Family');
INSERT INTO Topics (description) values ('Romance');
INSERT INTO Topics (description) values ('War');
INSERT INTO Topics (description) values ('Biography');
INSERT INTO Topics (description) values ('Mystery');
INSERT INTO Topics (description) values ('Documentary');
INSERT INTO Topics (description) values ('Sport');
INSERT INTO Topics (description) values ('Western');
INSERT INTO Topics (description) values ('History');
INSERT INTO Topics (description) values ('Film Noir');

INSERT INTO Studio (name, country) values ('Regency Enterprises', 'United States');
INSERT INTO Studio (name, country) values ('Warner Bros', 'United States');
INSERT INTO Studio (name, country) values ('Universal', 'United States');
INSERT INTO Studio (name, country) values ('Paramount', 'United States');
INSERT INTO Studio (name, country) values ('Sony Pictures', 'United States');
INSERT INTO Studio (name, country) values ('20th Century Fox', 'United States');
INSERT INTO Studio (name, country) values ('Lionsgate', 'United States');
INSERT INTO Studio (name, country) values ('Walt Disney', 'United States');
INSERT INTO Studio (name, country) values ('New Line Cinema', 'United States');

INSERT INTO Movie (Name, Length, released, description, links) values ('The Revenant', 156, '1/8/2016', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('DiCaprio', 'Leonardo', '11/11/1974');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hardy', 'Tom', '9/15/1977');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gleeson', 'Domhall', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Poulter', 'Will', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'G. Iñárritu' , 'Alejandro', 'Mexico');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'The Revenant';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hardy' AND Movie.name = 'The Revenant';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gleeson' AND Movie.name = 'The Revenant';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Poulter' AND Movie.name = 'The Revenant';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Hugh Glass', ActorID, 1 FROM Actor WHERE lname = 'DiCaprio';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'John Fitzgerald', ActorID, 1 FROM Actor WHERE lname = 'Hardy'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Captain Andrew Henry', ActorID, 1 FROM Actor WHERE lname = 'Gleeson'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Bridger', ActorID, 1 FROM Actor WHERE lname = 'Poulter'; 
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'G. Iñárritu' AND Movie.name = 'The Revenant';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 1, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,1);


INSERT INTO Movie (Name, Length, released, description, links) values ('Batman Vs Superman', 151, '3/25/2016', 'Fearing that the actions of Superman are left unchecked, Batman takes on the Man of Steel, while the world wrestles with what kind of a hero it really needs.', 'fis-9Zqu2Ro');
INSERT INTO Actor (lname, fname, dateBirth) values ('Affleck', 'Ben', '8/15/1972');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cavill', 'Henry', '5/5/1983');
INSERT INTO Actor (lname, fname, dateBirth) values ('Adams', 'Amy', '8/20/1974');
INSERT INTO Actor (lname, fname, dateBirth) values ('Eisenberg', 'Jesse', '10/5/1983');
INSERT INTO Director (lname, fname,country) values ( 'Snyder' , 'Zack', 'United States'); 
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Affleck' AND Movie.name = 'Batman Vs Superman';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cavill' AND Movie.name = 'Batman Vs Superman';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Adams' AND Movie.name = 'Batman Vs Superman';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Eisenberg' AND Movie.name = 'Batman Vs Superman';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Batman', ActorID, 2 FROM Actor WHERE lname = 'Affleck';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Superman', ActorID, 2 FROM Actor WHERE lname = 'Cavill'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Louis Lane', ActorID, 2 FROM Actor WHERE lname = 'Adams'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Lex Luther', ActorID, 2 FROM Actor WHERE lname = 'Eisenberg'; 
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Snyder' AND Movie.name = 'Batman Vs Superman';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (4, 2, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,2);


INSERT INTO Movie (Name, Length, released, description, links) values ('Zootopia', 108, '3/4/2016', 'In a city of anthropomorphic animals, a rookie bunny cop and a cynical con artist fox must work together to uncover a conspiracy.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Goodwin', 'Ginnifer', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bateman', 'Jason', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Elba', 'Idris', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Slate', 'Jenny', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Howard' , 'Byron', 'United States'); 
INSERT INTO Director (lname, fname,country) values ( 'Moore' , 'Rich', 'United States'); 
INSERT INTO Director (lname, fname,country) values ( 'Bush' , 'Jared', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Goodwin' AND Movie.name = 'Zootopia';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bateman' AND Movie.name = 'Zootopia';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Elba' AND Movie.name = 'Zootopia';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Slate' AND Movie.name = 'Zootopia';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Judy Hopps', ActorID, 3 FROM Actor WHERE lname = 'Goodwin';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Nick Wilde', ActorID, 3 FROM Actor WHERE lname = 'Bateman'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Chief Bogo', ActorID, 3 FROM Actor WHERE lname = 'Elba'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Bellether', ActorID, 3 FROM Actor WHERE lname = 'Slate'; 
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Howard' AND Movie.name = 'Zootopia';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Moore' AND Movie.name = 'Zootopia';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Bush' AND Movie.name = 'Zootopia';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (5, 3, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (8,3);


INSERT INTO Movie (Name, Length, released, description, links) values ('10 Cloverfield Lane', 103, '3/11/2016', 'After getting in a car accident, a woman is held in a shelter with two men, who claim the outside world is affected by a widespread chemical attack.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Goodman', 'John', '5/20/1952');
INSERT INTO Actor (lname, fname, dateBirth) values ('Elizabeth-Winstead', 'Mary', '5/20/1952');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gallagher', 'John', '5/20/1952');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cooper', 'Bradley', '5/20/1952');
INSERT INTO Director (lname, fname,country) values ( 'Trachtenberg' , 'Dan', 'United States'); 
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Goodman' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Elizabeth-Winstead' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gallagher' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cooper' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Howard', ActorID, 4 FROM Actor WHERE lname = 'Goodman';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Michelle', ActorID, 4 FROM Actor WHERE lname = 'Elizabeth-Winstead'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Emmett', ActorID, 4 FROM Actor WHERE lname = 'Gallagher'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Ben', ActorID, 4 FROM Actor WHERE lname = 'Cooper';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Trachtenberg' AND Movie.name = '10 Cloverfield Lane';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (10, 4, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,4);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Witch', 93, '2/19/2016', 'A family in 1630s New England is torn apart by the forces of witchcraft, black magic and possession.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Taylor-Joy', 'Anya', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Ineson', 'Ralph', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Dickie', 'Kate', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Scrimshaw', 'Harvey', '1/1/9999');
INSERT INTO Director (lname, fname, country) values ('Eggers', 'Robert', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Taylor-Joy' AND Movie.name = 'The Witch';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Ineson' AND Movie.name = 'The Witch';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Dickie' AND Movie.name = 'The Witch';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Scrimshaw' AND Movie.name = 'The Witch';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Thomasin', ActorID, 5 FROM Actor WHERE lname = 'Taylor-Joy';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Williams', ActorID, 5 FROM Actor WHERE lname = 'Ineson'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Katherine', ActorID, 5 FROM Actor WHERE lname = 'Dickie'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Caleb', ActorID, 5 FROM Actor WHERE lname = 'Scrimshaw';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Eggers' AND Movie.name = 'The Witch';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (1, 5, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (7,5);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Brothers Grimsby', 83, '3/11/2016', 'A new assignment forces a top spy to team up with his football hooligan brother.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Baron Cohen', 'Sasha', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wilson', 'Rebel', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Strong', 'Mark', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Fisher', 'Isla', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Leterrier' , 'Louis', 'France');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Baron Cohen' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wilson' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Strong' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fisher' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Nobby', ActorID, 6 FROM Actor WHERE lname = 'Baron Cohen';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Dawn', ActorID, 6 FROM Actor WHERE lname = 'Wilson'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Sebastian', ActorID, 6 FROM Actor WHERE lname = 'Strong'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Jodie', ActorID, 6 FROM Actor WHERE lname = 'Fisher';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Leterrier' AND Movie.name = 'The Brothers Grimsby';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 6, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,6);


INSERT INTO Movie (Name, Length, released, description, links) values ('Dirty Grandpa', 102, '1/22/2016', 'Right before his wedding, an uptight guy is tricked into driving his grandfather, a lecherous former Army Lieutenant-Colonel, to Florida for spring break.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Efron', 'Zac', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Plaza', 'Aubrey', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Deutch', 'Zoey', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('De Niro', 'Robert', '8/17/1943');
INSERT INTO Director (lname, fname,country) values ( 'Mazer' , 'Dan', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Efron' AND Movie.name = 'Dirty Grandpa';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Plaza' AND Movie.name = 'Dirty Grandpa';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Deutch' AND Movie.name = 'Dirty Grandpa';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Dirty Grandpa';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Ben', ActorID, 7 FROM Actor WHERE lname = 'Efron';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Shadia', ActorID, 7 FROM Actor WHERE lname = 'Plaza'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Meridth', ActorID, 7 FROM Actor WHERE lname = 'Deutch'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Dick', ActorID, 7 FROM Actor WHERE lname = 'De Niro';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Mazer' AND Movie.name = 'Dirty Grandpa';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 7, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,7);


INSERT INTO Movie (Name, Length, released, description, links) values ('Ride Along 2', 102, '1/15/2016', 'As his wedding day approaches, Ben heads to Miami with his soon-to-be brother-in-law James to bring down a drug dealer whos supplying the dealers of Atlanta with product.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Jackson', 'O''Shea', '6/15/1969');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hart', 'Kevin', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sumpter', 'Tika', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bratt', 'Benjamin', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Story' , 'Tim', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Jackson' AND Movie.name = 'Ride Along 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hart' AND Movie.name = 'Ride Along 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sumpter' AND Movie.name = 'Ride Along 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bratt' AND Movie.name = 'Ride Along 2';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'James Payton', ActorID, 8 FROM Actor WHERE lname = 'Jackson';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Ben Barber', ActorID, 8 FROM Actor WHERE lname = 'Hart'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Angela', ActorID, 8 FROM Actor WHERE lname = 'Sumpter'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Antonio', ActorID, 8 FROM Actor WHERE lname = 'Bratt';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Story' AND Movie.name = 'Ride Along 2';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 8, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,8);


INSERT INTO Movie (Name, Length, released, description, links) values ('Daddy''s Home', 96, '12/25/2015', 'Stepdad, Brad Whitaker, is a radio host trying to get his stepchildren to love him and call him Dad. But his plans turn upside down when the biological father, Dusty Mayron, returns.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Ferrel', 'Will', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wahlberg', 'Mark', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cardellini', 'Linda', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Vaccaro', 'Owen', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Anders' , 'Sean', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Ferrel' AND Movie.name = 'Daddy''s Home';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wahlberg' AND Movie.name = 'Daddy''s Home';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cardellini' AND Movie.name = 'Daddy''s Home';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Vaccaro' AND Movie.name = 'Daddy''s Home';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Good Dad', ActorID, 9 FROM Actor WHERE lname = 'Ferrel';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Bad Dad', ActorID, 9 FROM Actor WHERE lname = 'Wahlberg'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Mom', ActorID, 9 FROM Actor WHERE lname = 'Cardellini'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Child', ActorID, 9 FROM Actor WHERE lname = 'Varccaro';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Anders' AND Movie.name = 'Daddy''s Home';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 9, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,9);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Hunger Games: Mockingjay Part 2', 137, '11/20/2015', 'As the war of Panem escalates to the destruction of other districts, Katniss Everdeen, the reluctant leader of the rebellion, must bring together an army against President Snow, while all she holds dear hangs in the balance.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Lawrence', 'Jennifer', '8/15/1990');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hutcherson', 'Josh', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hemsworth', 'Liam', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Harrelson', 'Woody', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Lawrence' , 'Francis', 'Austria');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON (Actor.lname = 'Lawrence' AND Actor.fname = 'Jennifer') AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hutcherson' AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hemsworth' AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Harrelson' AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Katniss', ActorID, 10 FROM Actor WHERE lname = 'Lawrence' AND fname = 'Jennifer';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Peeta', ActorID, 10 FROM Actor WHERE lname = 'Hutcherson'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Gale', ActorID, 10 FROM Actor WHERE lname = 'Hemsworth'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Haymitch', ActorID, 10 FROM Actor WHERE lname = 'Harrelson';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Lawrence' AND Movie.name = 'The Hunger Games: Mockingjay Part 2';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (6, 10, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,10);


INSERT INTO Movie (Name, Length, released, description, links) values ('Divergent', 139, '3/21/2014', 'In a world divided by factions based on virtues, Tris learns she''s Divergent and won''t fit in. When she discovers a plot to destroy Divergents, Tris and the mysterious Four must find out what makes Divergents dangerous before it''s too late.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Woodley', 'Shailene', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('James', 'Theo', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Judd', 'Ashley', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Courtney', 'Jai', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Burger' , 'Neil', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Woodley' AND Movie.name = 'Divergent';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'James' AND Movie.name = 'Divergent';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Judd' AND Movie.name = 'Divergent';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Courtney' AND Movie.name = 'Divergent';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Tris', ActorID, 11 FROM Actor WHERE lname = 'Woodley';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Four', ActorID, 11 FROM Actor WHERE lname = 'James'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Natalie', ActorID, 11 FROM Actor WHERE lname = 'Judd'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Eric', ActorID, 11 FROM Actor WHERE lname = 'Courtney';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Burger' AND Movie.name = 'Divergent';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (6, 11, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,11);


INSERT INTO Movie (Name, Length, released, description, links) values ('Maze Runner: The Scorch Trials', 132, '9/18/2015', 'After having escaped the Maze, the Gladers now face a new set of challenges on the open roads of a desolate landscape filled with unimaginable obstacles.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('O''Brien', 'Dylan', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hong Lee', 'Ki', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Scoldelario', 'Kaya', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Darden', 'Dexter', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Ball' , 'Wes', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'O''Brien' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hong Lee' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Scolderlario' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Darden' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Thomas', ActorID, 12 FROM Actor WHERE lname = 'O''Brien';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Minho', ActorID, 12 FROM Actor WHERE lname = 'Hong Lee'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Teresa', ActorID, 12 FROM Actor WHERE lname = 'Scoldelario'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Newt', ActorID, 12 FROM Actor WHERE lname = 'Darden';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Ball' AND Movie.name = 'Maze Runner: The Scorch Trials';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (6, 12, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,12);


INSERT INTO Movie (Name, Length, released, description, links) values ('American History X', 119, '11/20/1998', 'A former neo-nazi skinhead tries to prevent his younger brother from going down the same wrong path that he did.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Norton', 'Edward', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Furlong', 'Edward', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Lien', 'Jennifer', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brooks', 'Edward', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Kaye' , 'Tony', 'United Kingdom');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Norton' AND Movie.name = 'American History X';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Furlong' AND Movie.name = 'American History X';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Lien' AND Movie.name = 'American History X';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brooks' AND Movie.name = 'American History X';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Derrick', ActorID, 13 FROM Actor WHERE lname = 'Norton';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Danny', ActorID, 13 FROM Actor WHERE lname = 'Furlong'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Dorris', ActorID, 13 FROM Actor WHERE lname = 'Lien'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Davina', ActorID, 13 FROM Actor WHERE lname = 'Brooks';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Kaye' AND Movie.name = 'American History X';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 13, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,13);


INSERT INTO Movie (Name, Length, released, description, links) values ('Fight Club', 139, '08/15/1999', 'An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more... ', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bonham Carter', 'Helena', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Loaf', 'Meat', '1/1/9999');
-- Brad Pitt and Edward Norton Already Added
INSERT INTO Director (lname, fname,country) values ( 'Fincher' , 'David', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bonham Carter' AND Movie.name = 'Fight Club';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pitt' AND Movie.name = 'Fight Club';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Norton' AND Movie.name = 'Fight Club';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Loaf' AND Movie.name = 'Fight Club';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Marla Singer', ActorID, 14 FROM Actor WHERE lname = 'Bohman Carter';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Tyler Durden', ActorID, 14 FROM Actor WHERE lname = 'Pitt'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'The Narrator', ActorID, 14 FROM Actor WHERE lname = 'Norton'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Bob', ActorID, 14 FROM Actor WHERE lname = 'Loaf';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Fincher' AND Movie.name = 'Fight Club';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 14, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,14);


INSERT INTO Movie (Name, Length, released, description, links) values ('Pulp Fiction', 154, '10/14/1994', 'The lives of two mob hit men, a boxer, a gangster''s wife, and a pair of diner bandits intertwine in four tales of violence and redemption. ', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Roth', 'Tim', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('L. Jackson', 'Samuel', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Willis', 'Bruce', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Travolta', 'John', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Tarantino' , 'Quentin', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Roth' AND Movie.name = 'Pulp Fiction';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'L. Jackson' AND Movie.name = 'Pulp Fiction';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Willis' AND Movie.name = 'Pulp Fiction';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Travolta' AND Movie.name = 'Pulp Fiction';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Pumpkin', ActorID, 15 FROM Actor WHERE lname = 'Roth';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Jules', ActorID, 15 FROM Actor WHERE lname = 'L.Jackson'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Vincent', ActorID, 15 FROM Actor WHERE lname = 'Travolta'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Boxer', ActorID, 15 FROM Actor WHERE lname = 'Willis';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Tarantino' AND Movie.name = 'Pulp Fiction';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 15, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,15);


INSERT INTO Movie (Name, Length, released, description, links) values ('Django Unchained', 165, '12/25/2012', 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Foxx', 'Jamie', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Waltz', 'Christoph', '1/1/9999');
-- Samuel L. Jackson and Leonardo DiCaprio Already added
-- Q.T added already
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Foxx' AND Movie.name = 'Django Unchained';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'L.Jackson' AND Movie.name = 'Django Unchained';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Waltz' AND Movie.name = 'Django Unchained';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'Django Unchained';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Django', ActorID, 16 FROM Actor WHERE lname = 'Foxx';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Slave Leader', ActorID, 16 FROM Actor WHERE lname = 'L.Jackson'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Dr Shultz', ActorID, 16 FROM Actor WHERE lname = 'Waltz'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Calvin Candie', ActorID, 16 FROM Actor WHERE lname = 'DiCaprio';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Tarantino' AND Movie.name = 'Django Unchained';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (4, 16, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,16);


INSERT INTO Movie (Name, Length, released, description, links) values ('Inglourious Basterds', 153, '08/21/2009', 'In Nazi-occupied France during World War II, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers coincides with a theatre owner''s vengeful plans for the same.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Fassbender', 'Michael', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Roth', 'Eli', '1/1/9999');
-- Brad Pitt and Cristoph Waltz Already Added
-- Q.T added already
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON (Actor.lname = 'Roth' AND Actor.fname = 'Eli') AND Movie.name = 'Inglourious Basterds';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fassbender' AND Movie.name = 'Inglourious Basterds';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pitt' AND Movie.name = 'Inglourious Basterds';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Waltz' AND Movie.name = 'Inglourious Basterds';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Bear', ActorID, 17 FROM Actor WHERE lname = 'Roth' AND fname = 'Eli';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Ben Barber', ActorID, 17 FROM Actor WHERE lname = 'Fassbender'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Nazi Killer', ActorID, 17 FROM Actor WHERE lname = 'Pitt'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Nazi General', ActorID, 17 FROM Actor WHERE lname = 'Waltz';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Tarantino' AND Movie.name = 'Inglourious Basterds';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (13, 17, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (6,17);


INSERT INTO Movie (Name, Length, released, description, links) values ('Se7en', 127, '9/22/1995', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his modus operandi. ', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Pitt', 'Brad', '12/18/1963');
INSERT INTO Actor (lname, fname, dateBirth) values ('Freeman', 'Morgan', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Spacey', 'Kevin', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Paltrow', 'Gwyneth', '1/1/9999');
-- David Fincher added already
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pitt' AND Movie.name = 'Se7en';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Freeman' AND Movie.name = 'Se7en';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Spacey' AND Movie.name = 'Se7en';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Paltrow' AND Movie.name = 'Se7en';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Cop 1', ActorID, 18 FROM Actor WHERE lname = 'Pitt';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Cop 2', ActorID, 18 FROM Actor WHERE lname = 'Freeman'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Killer', ActorID, 18 FROM Actor WHERE lname = 'Spacey'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Girlfriend of Cop 1', ActorID, 18 FROM Actor WHERE lname = 'Paltrow';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Fincher' AND Movie.name = 'Se7en';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 18, 'English', true, 'United States');
INSERT INTO Sponsors (StudioID, MovieID) values (4,18);


INSERT INTO Movie (Name, Length, released, description, links) values ('Silver Linings Playbook', 122, '12/25/2012', 'After a stint in a mental institution, former teacher Pat Solitano moves back in with his parents and tries to reconcile with his ex-wife. Things get more challenging when Pat meets Tiffany, a mysterious girl with problems of her own.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Tucker', 'Chris', '1/1/9999');
--Robert Deniro Jennifer Lawrence, Bradley Cooper Already added
INSERT INTO Director (lname, fname,country) values ( 'O''Russell' , 'David', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Tucker' AND Movie.name = 'Silver Linings Playbook';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cooper' AND Movie.name = 'Silver Linings Playbook';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Silver Linings Playbook';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON (Actor.lname = 'Lawrence' AND Actor.fname = 'Jennifer') AND Movie.name = 'Silver Linings Playbook';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Funny Guy', ActorID, 19 FROM Actor WHERE lname = 'Tucker';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Boyfriend', ActorID, 19 FROM Actor WHERE lname = 'Cooper'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Father', ActorID, 19 FROM Actor WHERE lname = 'De Niro'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Girlfriend', ActorID, 19 FROM Actor WHERE lname = 'Lawrence' AND fname = 'Jennifer';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'O''Russell' AND Movie.name = 'Silver Linings Playbook';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 19, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (6,19);


INSERT INTO Movie (Name, Length, released, description, links) values ('Life of Pi', 127, '11/21/2012', 'A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sharma', 'Suraj', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Khan', 'Irrfan', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Depardieu', 'Gerard', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Saito', 'James', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Lee' , 'Ang', 'Taiwan');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sharma' AND Movie.name = 'Life of Pi';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Khan' AND Movie.name = 'Life of Pi';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Depardieu' AND Movie.name = 'Life of Pi';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Saito' AND Movie.name = 'Life of Pi';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Pi', ActorID, 20 FROM Actor WHERE lname = 'Sharma' AND fname = 'Suraj';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Reported', ActorID, 20 FROM Actor WHERE lname = 'Khan'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Boat Owner', ActorID, 20 FROM Actor WHERE lname = 'Depardieu'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Fisherman', ActorID, 20 FROM Actor WHERE lname = 'Bratt';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Lee' AND Movie.name = 'Life of Pi';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 20, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,20);


INSERT INTO Movie (Name, Length, released, description, links) values ('Argo', 120, '10/12/2012', 'Acting under the cover of a Hollywood producer scouting a location for a science fiction film, a CIA agent launches a dangerous operation to rescue six Americans in Tehran during the U.S. hostage crisis in Iran in 1980.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cranston', 'Bryan', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Arkin', 'Alan', '1/1/9999');
-- Ben Affleck, John Goodman
INSERT INTO Director (lname, fname,country) values ( 'Affleck' , 'Ben', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cranston' AND Movie.name = 'Argo';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Arkin' AND Movie.name = 'Argo';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Affleck' AND Movie.name = 'Argo';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Goodman' AND Movie.name = 'Argo';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Tony', ActorID, 21 FROM Actor WHERE lname = 'Cranston';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Jack', ActorID, 21 FROM Actor WHERE lname = 'Arkin'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Lester', ActorID, 21 FROM Actor WHERE lname = 'Affleck'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Stevey', ActorID, 21 FROM Actor WHERE lname = 'Goodman';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Lee' AND Movie.name = 'Argo';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 21, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,21);


INSERT INTO Movie (Name, Length, released, description, links) values ('Gravity', 91, '10/4/2013', 'A medical engineer and an astronaut work together to survive after an accident leaves them adrift in space.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bullock', 'Sandra', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Clooney', 'George', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Harris', 'Ed', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sharma', 'Phaldut', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Cuaron' , 'Alfonso', 'Mexico');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bullock' AND Movie.name = 'Gravity';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Clooney' AND Movie.name = 'Gravity';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Harris' AND Movie.name = 'Gravity';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON (Actor.lname = 'Sharma' AND Actor.fname = 'Phaldut') AND Movie.name = 'Gravity';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Sarah James', ActorID, 22 FROM Actor WHERE lname = 'Bullock';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Astronaut', ActorID, 22 FROM Actor WHERE lname = 'Clooney'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'NASA', ActorID, 22 FROM Actor WHERE lname = 'Harris'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Astronaut 2', ActorID, 22 FROM Actor WHERE lname = 'Sharma' AND fname = 'Phaldut';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Cuaron' AND Movie.name = 'Gravity';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (10, 22, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,22);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Hurt Locker', 131, '7/31/2008', 'During the Iraq War, a Sergeant recently assigned to an army bomb squad is put at odds with his squad mates due to his maverick way of handling his work.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Renner', 'Jeremey', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Pearce', 'Guy', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Fiennes', 'Ralph', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Morse', 'David', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Bigelow' , 'Kathryn',  'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Renner' AND Movie.name = 'The Hurt Locker';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pearce' AND Movie.name = 'The Hurt Locker';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fiennes' AND Movie.name = 'The Hurt Locker';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Morse' AND Movie.name = 'The Hurt Locker';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Bomb Disposal', ActorID, 23 FROM Actor WHERE lname = 'Renner';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Dead Solider', ActorID, 23 FROM Actor WHERE lname = 'Pearce'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'General', ActorID, 23 FROM Actor WHERE lname = 'Fiennes'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Captain', ActorID, 23 FROM Actor WHERE lname = 'Morse';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Bigelow' AND Movie.name = 'The Hurt Locker';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (13, 23, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,23);


INSERT INTO Movie (Name, Length, released, description, links) values ('No Country for Old Men', 122, '11/22/2007', 'Violence and mayhem ensue after a hunter stumbles upon a drug deal gone wrong and more than two million dollars in cash near the Rio Grande.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Lee Jones', 'Tommy', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bardem', 'Javier', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brolin', 'Josh', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Harrelson', 'Woody', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Coen' , 'Joel', 'United States');
INSERT INTO Director (lname, fname,country) values ( 'Coen' , 'Ethan', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Lee Jones' AND Movie.name = 'No Country for Old Men';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bardem' AND Movie.name = 'No Country for Old Men';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brolin' AND Movie.name = 'No Country for Old Men';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Harrelson' AND Movie.name = 'No Country for Old Men';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Sherrif', ActorID, 24 FROM Actor WHERE lname = 'Lee Jones';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Killer', ActorID, 24 FROM Actor WHERE lname = 'Bardem'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Moss', ActorID, 24 FROM Actor WHERE lname = 'Brolin'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Contract Hitman', ActorID, 24 FROM Actor WHERE lname = 'Harrelson';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Coen' AND Director.fname = 'Joel' AND Movie.name = 'Gravity';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Coen' AND Director.fname = 'Ethan' AND Movie.name = 'Gravity';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 24, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,24);


INSERT INTO Movie (Name, Length, released, description, links) values ('There Will Be Blood', 158, '1/25/2008', 'A story of family, religion, hatred, oil and madness, focusing on a turn-of-the-century prospector in the early days of the business.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Day-Lewis', 'Daniel', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Dano', 'Paul', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hinds', 'Ciaran', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Carver', 'Randall', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Thomas Anderson' , 'Paul', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Day-Lewis' AND Movie.name = 'There Will Be Blood';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Dano' AND Movie.name = 'There Will Be Blood';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hinds' AND Movie.name = 'There Will Be Blood';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Carver' AND Movie.name = 'There Will Be Blood';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Oil Baron', ActorID, 25 FROM Actor WHERE lname = 'Day-Lewis';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Priest', ActorID, 25 FROM Actor WHERE lname = 'Dano'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Brother', ActorID, 25 FROM Actor WHERE lname = 'Hinds'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Police Officer', ActorID, 25 FROM Actor WHERE lname = 'Carver';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Thomas Anderson' AND Movie.name = 'There Will Be Blood';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 25, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,25);


INSERT INTO Movie (Name, Length, released, description, links) values ('Taxi Driver', 113, '2/8/1976', 'A mentally unstable Vietnam War veteran works as a night-time taxi driver in New York City where the perceived decadence and sleaze feeds his urge for violent action, attempting to save a preadolescent prostitute in the process.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Foster', 'Jodie', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Cybill', 'Shepard', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brooks', 'Albert', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Scorsese' , 'Martin', 'United States');
-- Robert Deniro Already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Foster' AND Movie.name = 'Taxi Driver';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Cybill' AND Movie.name = 'Taxi Driver';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brooks' AND Movie.name = 'Taxi Driver';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Taxi Driver';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Girl', ActorID, 26 FROM Actor WHERE lname = 'Foster';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Man', ActorID, 26 FROM Actor WHERE lname = 'Cybill'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Farmer', ActorID, 26 FROM Actor WHERE lname = 'Brooks'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Taxi Driver', ActorID, 26 FROM Actor WHERE lname = 'De Niro';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'Taxi Driver';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 26, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,26);


INSERT INTO Movie (Name, Length, released, description, links) values ('Goodfellas', 146, '9/21/1990', 'Henry Hill and his friends work their way up through the mob hierarchy.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Liotta', 'Ray', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Pesci', 'Joe', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bracco', 'Lorraine', '1/1/9999');
-- Robert De Niro already added
-- Dir: Martin Scorsese already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Liotta' AND Movie.name = 'Goodfellas';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pesci' AND Movie.name = 'Goodfellas';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bracco' AND Movie.name = 'Goodfellas';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'Goodfellas';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Gangster', ActorID, 27 FROM Actor WHERE lname = 'Liotta';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Gangmember', ActorID, 27 FROM Actor WHERE lname = 'Pesci'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Shooter', ActorID, 27 FROM Actor WHERE lname = 'Bracco'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Driver', ActorID, 27 FROM Actor WHERE lname = 'De Niro';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'Goodfellas';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 27, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,27);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Godfather: Part II', 202, '12/20/1974', 'The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on his crime syndicate stretching from Lake Tahoe, Nevada to pre-revolution 1958 Cuba.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Pacino', 'Al', '4/25/1940');
INSERT INTO Actor (lname, fname, dateBirth) values ('Duvall', 'Robert', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Keaton', 'Diane', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Ford Coppola' , 'Francis', 'United States');
--Robert Deniro Alraedy added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pacino' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Duvall' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Keaton' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'The Godfather: Part II';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Vito', ActorID, 28 FROM Actor WHERE lname = 'Pacino';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Spaggeti', ActorID, 28 FROM Actor WHERE lname = 'Duvall'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Italian', ActorID, 28 FROM Actor WHERE lname = 'Keaton'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Godfather', ActorID, 28 FROM Actor WHERE lname = 'De Niro';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Ford Coppola' AND Movie.name = 'The Godfather: Part II';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 28, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,28);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Godfather', 175, '3/24/1972', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Brando', 'Marlon', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Caan', 'James', '1/1/9999');
-- Robert De Niro and Alpacino already added
-- Dir: Francis Ford already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Pacino' AND Movie.name = 'The Godfather';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Caan' AND Movie.name = 'The Godfather';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Brando' AND Movie.name = 'The Godfather';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'De Niro' AND Movie.name = 'The Godfather';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Vito', ActorID, 29 FROM Actor WHERE lname = 'Pacino';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Gangmember', ActorID, 29 FROM Actor WHERE lname = 'Caan'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Goldguy', ActorID, 29 FROM Actor WHERE lname = 'Brando'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Driver', ActorID, 29 FROM Actor WHERE lname = 'De Niro';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Ford Coppola' AND Movie.name = 'The Godfather';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 29, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,29);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Shawshank Redemption', 142, '10/14/1994', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Robbins', 'Tim', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gunton', 'Rob', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sadler', 'William', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Darabont' , 'Frank', 'United States');
-- Morgan Freeman Already added
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Robbins' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gunton' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sadler' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Freeman' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Convict', ActorID, 30 FROM Actor WHERE lname = 'Robbins';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Prison Guard', ActorID, 30 FROM Actor WHERE lname = 'Gunton'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Prisoner', ActorID, 30 FROM Actor WHERE lname = 'Sadler'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Red', ActorID, 30 FROM Actor WHERE lname = 'Freeman';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Darabont' AND Movie.name = 'The Shawshank Redemption';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 30, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (2,30);


INSERT INTO Movie (Name, Length, released, description, links) values ('Forrest Gump', 144, '7/6/1994', 'Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hanks', 'Tom', '7/9/1956');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wright', 'Robin', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Sinse', 'Gary', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Field', 'Sally', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Zemeckis' , 'Robert', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hanks' AND Movie.name = 'Forrest Gump';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wright' AND Movie.name = 'Forrest Gump';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Sinse' AND Movie.name = 'Forrest Gump';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Field' AND Movie.name = 'Forrest Gump';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Forrest', ActorID, 31 FROM Actor WHERE lname = 'Hanks';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'July', ActorID, 31 FROM Actor WHERE lname = 'Wright'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Dan', ActorID, 31 FROM Actor WHERE lname = 'Sinse'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Matthew', ActorID, 31 FROM Actor WHERE lname = 'Field';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Zemeckis' AND Movie.name = 'Forrest Gump';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (8, 31, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,31);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Matrix', 134, '3/31/1999', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Reeves', 'Keanu', '9/2/1964');
INSERT INTO Actor (lname, fname, dateBirth) values ('Fishburne', 'Lawrence', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Weaving', 'Hugo', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Moss', 'Carrie-Anne', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Wachowski' , 'Lana', 'United States');
INSERT INTO Director (lname, fname,country) values ( 'Wachowski' , 'Lilly', 'United States');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Reeves' AND Movie.name = 'The Matrix';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Fishburne' AND Movie.name = 'The Matrix';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Weaving' AND Movie.name = 'The Matrix';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Moss' AND Movie.name = 'The Matrix';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Neo', ActorID, 32 FROM Actor WHERE lname = 'Reeves';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Leader', ActorID, 32 FROM Actor WHERE lname = 'Fishburne'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Bob', ActorID, 32 FROM Actor WHERE lname = 'Weaving'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Dan', ActorID, 32 FROM Actor WHERE lname = 'Moss';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Wachowski' AND Director.fname = 'Lana' AND Movie.name = 'The Matrix';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Wachowski' AND Director.fname = 'Lilly' AND Movie.name = 'The Matrix';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (4, 32, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (5,32);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Lord of the Rings: The Fellowship of the Ring', 178, '12/19/2001', 'A meek Hobbit and eight companions set out on a journey to destroy the One Ring and the Dark Lord Sauron.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Wood', 'Elijah', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bean', 'Sean', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bloom', 'Orlando', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('McKellen', 'Ian', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Jackson' , 'Peter', 'New Zealand');
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wood' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bean' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bloom' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McKellen' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Frodo', ActorID, 33 FROM Actor WHERE lname = 'Wood';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Borameear', ActorID, 33 FROM Actor WHERE lname = 'Bean'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Legolas', ActorID, 33 FROM Actor WHERE lname = 'Bloom'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Galdalf', ActorID, 33 FROM Actor WHERE lname = 'McKellen';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Jackson' AND Movie.name = 'The Lord of the Rings: The Fellowship of the Ring';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 33, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (1,33);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Lord of the Rings: The Two Towers', 179, '12/18/2002', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman, and his hordes of Isengard.', 'LoebZZ8K5N0');
--Same as other LOTR ^^
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wood' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bean' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bloom' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McKellen' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Frodo', ActorID, 34 FROM Actor WHERE lname = 'Wood';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Borameear', ActorID, 34 FROM Actor WHERE lname = 'Bean'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Legolas', ActorID, 34 FROM Actor WHERE lname = 'Bloom'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Galdalf', ActorID, 34 FROM Actor WHERE lname = 'McKellen';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Jackson' AND Movie.name = 'The Lord of the Rings: The Two Towers';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 34, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (4,34);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Lord of the Rings: The Return of the King', 201, '12/17/2003', 'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 'LoebZZ8K5N0');
--Same as other LOTR ^^
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wood' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bean' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bloom' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McKellen' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Frodo', ActorID, 35 FROM Actor WHERE lname = 'Wood';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Borameear', ActorID, 35 FROM Actor WHERE lname = 'Bean'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Legolas', ActorID, 35 FROM Actor WHERE lname = 'Bloom'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Galdalf', ActorID, 35 FROM Actor WHERE lname = 'McKellen';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Jackson' AND Movie.name = 'The Lord of the Rings: The Return of the King';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (9, 35, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (6,35);


INSERT INTO Movie (Name, Length, released, description, links) values ('Inception', 148, '7/16/2010', 'A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Gordon-Levitt', 'Joseph', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Page', 'Ellen', '1/1/9999');
INSERT INTO Director (lname, fname,country) values ( 'Nolan' , 'Christoper', 'United States');
-- Hardy and DiCaprio
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Gordon-Levitt' AND Movie.name = 'Inception';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Page' AND Movie.name = 'Inception';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hardy' AND Movie.name = 'Inception';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'Inception';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'James', ActorID, 36 FROM Actor WHERE lname = 'Gordon-Levitt';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Character 2', ActorID, 36 FROM Actor WHERE lname = 'Page'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Steve', ActorID, 36 FROM Actor WHERE lname = 'Hardy'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Inceptor', ActorID, 36 FROM Actor WHERE lname = 'DiCaprio';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Nolan' AND Movie.name = 'Inception';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 36, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (7,36);


INSERT INTO Movie (Name, Length, released, description, links) values ('Interstellar', 169, '11/7/2014', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('McConaughey', 'Matthew ', '11/4/1969');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hathaway', 'Anne', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Castain', 'Jessica', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Foy', 'Mackenzie', '1/1/9999');
-- Dir: Christoper Nolan
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McConaughey' AND Movie.name = 'Interstellar';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hathaway' AND Movie.name = 'Interstellar';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Castain' AND Movie.name = 'Interstellar';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Foy' AND Movie.name = 'Interstellar';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Astronaught', ActorID, 37 FROM Actor WHERE lname = 'McConaughey';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Astronaught Female', ActorID, 37 FROM Actor WHERE lname = 'Hathaway'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Director', ActorID, 37 FROM Actor WHERE lname = 'Castain'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Child', ActorID, 37 FROM Actor WHERE lname = 'Foy';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Nolan' AND Movie.name = 'Interstellar';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 37, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (7,37);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Wolf of Wall Street', 180, '12/25/2013', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hill', 'Jonah', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Robbie', 'Margot', '1/1/9999');
--Leo and Matthew McConaughey
-- Dir Scorsese
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hill' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Robbie' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'McConaughey' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Banker', ActorID, 38 FROM Actor WHERE lname = 'Hill';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Rich Female', ActorID, 38 FROM Actor WHERE lname = 'Robbie'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Tyler', ActorID, 38 FROM Actor WHERE lname = 'DiCaprio'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Banker Friend', ActorID, 38 FROM Actor WHERE lname = 'McConaughey';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'The Wolf of Wall Street';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (2, 38, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (9,38);


INSERT INTO Movie (Name, Length, released, description, links) values ('Shutter Island', 138, '2/19/2010', 'A U.S Marshal investigates the disappearance of a murderess who escaped from a hospital for the criminally insane.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Ruffalo', 'Mark', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Kingsley', 'Ben', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Mortimer', 'Emily', '1/1/9999');
--Leo
-- Dir Scorsese
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Ruffalo' AND Movie.name = 'Shutter Island';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Kingsley' AND Movie.name = 'Shutter Island';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Mortimer' AND Movie.name = 'Shutter Island';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'Shutter Island';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Nurse', ActorID, 39 FROM Actor WHERE lname = 'Ruffalo';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Patient 1', ActorID, 39 FROM Actor WHERE lname = 'Kingsley'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Patient 2', ActorID, 39 FROM Actor WHERE lname = 'Mortimer'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Jack', ActorID, 39 FROM Actor WHERE lname = 'DiCaprio';
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'Shutter Island';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (1, 39, 'English', true, 'United States'); 
INSERT INTO Sponsors (StudioID, MovieID) values (3,39);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Prestige', 130, '10/20/2006', 'Two stage magicians engage in competitive one-upmanship in an attempt to create the ultimate stage illusion.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Bale', 'Christian', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Jackman', 'Hugh', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Johansson', 'Scarlett', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Hall', 'Rebecca', '1/1/9999');
-- Dir Nolan	
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Bale' AND Movie.name = 'The Prestige';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Jackman' AND Movie.name = 'The Prestige';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Johansson' AND Movie.name = 'The Prestige';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Hall' AND Movie.name = 'The Prestige';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Magician 1', ActorID, 40 FROM Actor WHERE lname = 'Bale';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Tom', ActorID, 40 FROM Actor WHERE lname = 'Jackman'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Steve Bateman', ActorID, 40 FROM Actor WHERE lname = 'Johansson'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'James', ActorID, 40 FROM Actor WHERE lname = 'Hall'; 
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Nolan' AND Movie.name = 'The Prestige';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (3, 40, 'English', true, 'United States');
INSERT INTO Sponsors (StudioID, MovieID) values (3,40);


INSERT INTO Movie (Name, Length, released, description, links) values ('The Departed', 151, '10/6/2006', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', 'LoebZZ8K5N0');
INSERT INTO Actor (lname, fname, dateBirth) values ('Damon', 'Matt', '1/1/9999');
INSERT INTO Actor (lname, fname, dateBirth) values ('Nicholson', 'Jack', '1/1/9999');
--Mark Wahlberg and Leo
-- Dir: Scorsese
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'DiCaprio' AND Movie.name = 'The Departed';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Damon' AND Movie.name = 'The Departed';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Nicholson' AND Movie.name = 'The Departed';
INSERT INTO Actor_Movie (ActorID, MovieID) SELECT Actor.ActorID, Movie.MovieID FROM Actor INNER JOIN Movie ON Actor.lname = 'Wahlberg' AND Movie.name = 'The Departed';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Billy', ActorID, 41 FROM Actor WHERE lname = 'DiCaprio';
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Colin Sullivan', ActorID, 41 FROM Actor WHERE lname = 'Damon'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Frank Costello', ActorID, 41 FROM Actor WHERE lname = 'Nicholson'; 
INSERT INTO Role (roleName, ActorID, MovieID) SELECT 'Dignam', ActorID, 41 FROM Actor WHERE lname = 'Eisenberg'; 
INSERT INTO Director_Movie (DirectorID, MovieID) SELECT Director.DirectorID, Movie.MovieID FROM Director INNER JOIN Movie ON Director.lname = 'Scorsese' AND Movie.name = 'The Departed';
INSERT INTO MovieTopics (TopicID, MovieID, languages, subtitles, country) values (7, 41, 'English', true, 'United States');
INSERT INTO Sponsors (StudioID, MovieID) values (1,41);

INSERT INTO UserAccount (username, Pass, lname, fname, email, city, province, country) 
values ('bruce555', 'pass1', 'Greene', 'Bruce', 'gb1996@gmail.com', 'Toronto', 'ON', 'Canada');
INSERT INTO Profile (UserID, ageRange, yearBorn, gender, occupation, device)
SELECT UserID, 'pg13', 1996, 'm','doctor', 'phone' FROM UserAccount WHERE username = 'bruce555';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '1/1/2016', 1, 7 FROM Movie m, UserAccount u WHERE m.name = 'The Revenant' and u.username = 'bruce555';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '1/1/2016', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'Ride Along 2' and u.username = 'bruce555';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '1/1/2016', 1, 9 FROM Movie m, UserAccount u WHERE m.name = 'The Witch' and u.username = 'bruce555';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '1/1/2016', 1, 4 FROM Movie m, UserAccount u WHERE m.name = 'Shutter Island' and u.username = 'bruce555';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '1/1/2016', 1, 1 FROM Movie m, UserAccount u WHERE m.name = 'The Wolf of Wall Street' and u.username = 'bruce555';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '1/1/2016', 1, 7 FROM Movie m, UserAccount u WHERE m.name = 'Interstellar' and u.username = 'bruce555';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '1/1/2016', 1, 4 FROM Movie m, UserAccount u WHERE m.name = 'Forrest Gump' and u.username = 'bruce555';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '1/1/2016', 1, 6 FROM Movie m, UserAccount u WHERE m.name = 'The Shawshank Redemption' and u.username = 'bruce555';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '1/1/2016', 1, 9 FROM Movie m, UserAccount u WHERE m.name = 'The Godfather' and u.username = 'bruce555';

INSERT INTO UserAccount (username, Pass, lname, fname, email, city, province, country) 
values ('steve123', 'pass2', 'Smith', 'Steve', 'ss007@gmail.com','Austin', 'TX', 'United States');
INSERT INTO Profile (UserID, ageRange, yearBorn, gender, occupation, device)
SELECT UserID, 'pg13', 1996, 'm','doctor', 'phone' FROM UserAccount WHERE username = 'seteve123';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 7 FROM Movie m, UserAccount u WHERE m.name = 'The Revenant' and u.username = 'steve123';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'The Witch' and u.username = 'steve123';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 6 FROM Movie m, UserAccount u WHERE m.name = 'The Prestige' and u.username = 'steve123';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'Batman Vs Superman' and u.username = 'steve123';

INSERT INTO UserAccount (username, Pass, lname, fname, email, city, province, country) 
values ('xpeke', 'pass3', 'Kovid', 'Adam', 'ak47@gmail.com','Ottawa', 'ON', 'Canada');
INSERT INTO Profile (UserID, ageRange, yearBorn, gender, occupation, device)
SELECT UserID, 'pg13', 1996, 'm','doctor', 'computer' FROM UserAccount WHERE username = 'xpeke';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 5 FROM Movie m, UserAccount u WHERE m.name = 'Zootopia' and u.username = 'xpeke';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 5 FROM Movie m, UserAccount u WHERE m.name = '10 Cloverfield Lane' and u.username = 'xpeke';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 5 FROM Movie m, UserAccount u WHERE m.name = 'The Wolf of Wall Street' and u.username = 'xpeke';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 5 FROM Movie m, UserAccount u WHERE m.name = 'Goodfellas' and u.username = 'xpeke';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 5 FROM Movie m, UserAccount u WHERE m.name = 'Taxi Driver' and u.username = 'xpeke';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 5 FROM Movie m, UserAccount u WHERE m.name = 'There Will Be Blood' and u.username = 'xpeke';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 5 FROM Movie m, UserAccount u WHERE m.name = 'No Country for Old Men' and u.username = 'xpeke';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 5 FROM Movie m, UserAccount u WHERE m.name = 'Gravity' and u.username = 'xpeke';

INSERT INTO UserAccount (username, Pass, lname, fname, email, city, province, country) 
values ('doublelift', 'pass4', 'Shams', 'Sam', 'ss123@gmail.com','Ottawa', 'ON', 'Canada');
INSERT INTO Profile (UserID, ageRange, yearBorn, gender, occupation, device)
SELECT UserID, 'pg13', 1996, 'm','doctor', 'computer' FROM UserAccount WHERE username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'The Revenant' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'Pulp Fiction' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'The Witch' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'The Lord of the Rings: The Fellowship of the Ring' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'The Lord of the Rings: The Two Towers' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'Interstellar' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 3 FROM Movie m, UserAccount u WHERE m.name = 'The Lord of the Rings: The Return of the King' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'Inglourious Basterds' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'Fight Club' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'American History X' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 5 FROM Movie m, UserAccount u WHERE m.name = 'Maze Runner: The Scorch Trials' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'Divergent' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 6 FROM Movie m, UserAccount u WHERE m.name = 'Dirty Grandpa' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'Ride Along 2' and u.username = 'doublelift';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'The Brothers Grimsby' and u.username = 'doublelift';

INSERT INTO UserAccount (username, Pass, lname, fname, email, city, province, country) 
values ('kiwikid', 'pass5', 'Burns', 'Micheal', 'bm14752@gmail.com', 'Montreal', 'QC', 'Canada');
INSERT INTO Profile (UserID, ageRange, yearBorn, gender, occupation, device)
SELECT UserID, 'pg13', 1996, 'm','doctor', 'phone' FROM UserAccount WHERE username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'The Revenant' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'Daddy''s Home' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'The Brothers Grimsby' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 4 FROM Movie m, UserAccount u WHERE m.name = 'Django Unchained' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'The Godfather: Part II' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 2 FROM Movie m, UserAccount u WHERE m.name = 'No Country for Old Men' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 3 FROM Movie m, UserAccount u WHERE m.name = 'The Hurt Locker' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'Argo' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'Life of Pi' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'Silver Linings Playbook' and u.username = 'kiwikid';
INSERT INTO Watches (MovieID, UserID, time, Repeats, rating) 
SELECT m.MovieID, u.UserID, '2016/1/1', 1, 8 FROM Movie m, UserAccount u WHERE m.name = 'Se7en' and u.username = 'kiwikid';


INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 1, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (2, 2, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 3, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 4, 'BEST MOVIE I HAVE EVER SEEN');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 5, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 6, 'BEST MOVIE I HAVE EVER SEEN');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 7, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 8, 'BEST MOVIE I HAVE EVER SEEN');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 9, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 10, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 11, 'BEST MOVIE I HAVE EVER SEEN');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 12, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 13, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 14, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 15, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 16, 'BAD MOVIE');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 17, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 18, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 19, 'Wow what a great movie!!');
INSERT INTO User_Movie (UserID, MovieID, comment) values (1, 20, 'Wow what a great movie!!');





---------------------------------------------------- Given Movie Queries -----------------------------------------
--Find the Actors in a Movie
SELECT lname, fname
FROM Movie
INNER JOIN Actor_Movie ON Movie.MovieID = Actor_Movie.MovieID INNER JOIN
	Actor ON Actor_Movie.ActorID = Actor.ActorID
WHERE Movie.MovieID = (Select MovieID 
			FROM Movie
			Where name = 'The Revenant');

--Find the EXTRA info on the movie
SELECT t.Description, languages, subtitles, country FROM MovieTopics mt, Topics t
WHERE mt.MovieID = (Select MovieID
				FROM Movie
				Where name = 'Ride Along 2')
	AND (mt.TopicID = t.TopicID); 

--Find the Director of a given Movie
SELECT lname, fname
FROM Movie
INNER JOIN Director_Movie ON Movie.MovieID = Director_Movie.MovieID INNER JOIN
	Director ON Director_Movie.DirectorID = Director.DirectorID
WHERE Movie.MovieID = (Select MovieID 
			FROM Movie
			Where name = 'The Revenant');

----------------------------------------------------- Given Actor Queries -----------------------------------------
--Find the Movies a given Actor is in
Select Movie.name, Movie.released
FROM Actor
INNER JOIN Actor_Movie ON Actor.ActorID = Actor_Movie.ActorID INNER JOIN
	Movie ON Actor_Movie.MovieID = Movie.MovieID
WHERE Actor.ActorID = (Select ActorID
			FROM Actor
			WHERE lname = 'DiCaprio' AND fname = 'Leonardo');

--Find the movies 2 different actors are both in
SELECT name 
	FROM MOVIE m
	JOIN Actor_Movie  AM1 ON AM1.movieid = m.MovieID JOIN Actor A1 ON AM1.actorID=a1.actorID
	JOIN Actor_Movie  AM2 ON AM2.movieid = m.MovieID JOIN Actor A2 ON AM2.actorID=a2.actorID
WHERE A1.lname = 'Bloom' AND A2.lname ='Wood';

--actors ordered by the number of movies they are in
SELECT lname,fname,
         COUNT(*) AS num_movies
    FROM MOVIE m
    JOIN Actor_Movie  AM ON AM.movieid = m.MovieID
    JOIN ACTOR        a  ON a.ActorID = AM.actorid
GROUP BY lname, fname
ORDER BY num_movies DESC, lname, fname;  

-- Find the Role of an Actor in a Specific Movie
Select r.RoleName
From  Movie m, Actor a, Role r
WHERE r.ActorID = a.ActorID AND r.MovieID = m.MovieID AND m.name = 'The Revenant' AND a.lname = 'DiCaprio';

-- Find All the roles of an Actor
Select r.RoleName, m.name
From  Actor a, Role r, Movie m
WHERE r.ActorID = a.ActorID AND a.lname = 'DiCaprio' AND r.MovieID = m.MovieID;

-- find movies with a certain actor director pair
SELECT name 
	FROM MOVIE m
	 JOIN Actor_Movie  AM ON AM.movieid = m.MovieID
    JOIN ACTOR        a  ON a.ActorID = AM.actorid
    JOIN Director_Movie  DM ON DM.movieid = m.MovieID
    JOIN Director       d  ON d.DirectorID = DM.Directorid
WHERE a.lname = 'DiCaprio' AND a.fname = 'Leonardo' AND d.lname ='Scorsese' AND d.fname = 'Martin';


------------------------------------------------------- Given Genre Queries -----------------------------------------------
-- Find all movies of a specific Genre
Select m.name, m.released, t.description
FROM Movie m, MovieTopics mt, Topics t
WHERE m.MovieID = mt.MovieID AND mt.TopicID = t.TopicID AND t.description = 'Comedy';


------------------------------------------------------- Rating Queries-----------------------------------------------------

-- Number of ratings for a given moviwe
SELECT m.name, Count(w.rating)
FROM Watches w, Movie m
WHERE w.MovieID = m.MovieID AND m.name = 'The Revenant'
GROUP BY m.name;

-- Find the Average Rating of a Movie
Select Round(AVG(w.rating), 1)
FROM Watches w, Movie m
WHERE m.name = 'Gravity' AND w.MovieID = m.MovieID;

-- Single Best Movie
SELECT Movie.name, ROUND(AVG(rating),1) 
	FROM Watches, Movie
	WHERE Movie.movieID = Watches.MovieID
	GROUP BY Movie.name
	ORDER BY ROUND(AVG(rating),1) DESC
	LIMIT 1;
	
-- Ranked the movies from best to worst
SELECT Movie.name, ROUND(AVG(rating),1) 
	FROM Watches, Movie
	WHERE Movie.movieID = Watches.MovieID
	GROUP BY Movie.name
	ORDER BY ROUND(AVG(rating),1) DESC;	