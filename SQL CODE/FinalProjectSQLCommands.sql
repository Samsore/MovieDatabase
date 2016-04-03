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
Name VARCHAR(250) NOT NULL,
Length INTEGER,	
released Date NOT NULL,
description VARCHAR(1200) NOT NULL
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
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID)
);

INSERT INTO Movie (Name, Length, released, description) values ('The Revenant', 156, '1/8/2016', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.');
INSERT INTO Movie (Name, Length, released, description) values ('Batman Vs. Superman', 151, '3/25/2016', 'Fearing that the actions of Superman are left unchecked, Batman takes on the Man of Steel, while the world wrestles with what kind of a hero it really needs.');
INSERT INTO Movie (Name, Length, released, description) values ('Zootopia', 108, '3/4/2016', 'In a city of anthropomorphic animals, a rookie bunny cop and a cynical con artist fox must work together to uncover a conspiracy.');
INSERT INTO Movie (Name, Length, released, description) values ('10 Cloverfield Lane', 103, '3/11/2016', 'After getting in a car accident, a woman is held in a shelter with two men, who claim the outside world is affected by a widespread chemical attack.');
INSERT INTO Movie (Name, Length, released, description) values ('The Witch', 93, '2/19/2016', 'A family in 1630s New England is torn apart by the forces of witchcraft, black magic and possession.');
INSERT INTO Movie (Name, Length, released, description) values ('The Brothers Grimsby', 83, '3/11/2016', 'A new assignment forces a top spy to team up with his football hooligan brother.');
INSERT INTO Movie (Name, Length, released, description) values ('Dirty Gramdpa', 102, '1/22/2016', 'Right before his wedding, an uptight guy is tricked into driving his grandfather, a lecherous former Army Lieutenant-Colonel, to Florida for spring break.');
INSERT INTO Movie (Name, Length, released, description) values ('Ride Along 2', 102, '1/15/2016', 'As his wedding day approaches, Ben heads to Miami with his soon-to-be brother-in-law James to bring down a drug dealer whos supplying the dealers of Atlanta with product.');
INSERT INTO Movie (Name, Length, released, description) values ('Daddy''s is Home', 96, '12/25/2015', 'Stepdad, Brad Whitaker, is a radio host trying to get his stepchildren to love him and call him Dad. But his plans turn upside down when the biological father, Dusty Mayron, returns.');
INSERT INTO Movie (Name, Length, released, description) values ('The Hunger Games: Mockingjay - Part 2', 137, '11/20/2015', 'As the war of Panem escalates to the destruction of other districts, Katniss Everdeen, the reluctant leader of the rebellion, must bring together an army against President Snow, while all she holds dear hangs in the balance.');
INSERT INTO Movie (Name, Length, released, description) values ('Divergent', 139, '3/21/2014', 'In a world divided by factions based on virtues, Tris learns she''s Divergent and won''t fit in. When she discovers a plot to destroy Divergents, Tris and the mysterious Four must find out what makes Divergents dangerous before it''s too late.');
INSERT INTO Movie (Name, Length, released, description) values ('Maze Runner: The Scorch Trials', 132, '9/18/2015', 'After having escaped the Maze, the Gladers now face a new set of challenges on the open roads of a desolate landscape filled with unimaginable obstacles.');
INSERT INTO Movie (Name, Length, released, description) values ('American History X', 119, '11/20/1998', 'A former neo-nazi skinhead tries to prevent his younger brother from going down the same wrong path that he did.');
INSERT INTO Movie (Name, Length, released, description) values ('Fight Club', 139, '08/15/1999', 'An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more... ');
INSERT INTO Movie (Name, Length, released, description) values ('Pulp Fiction', 154, '10/14/1994', 'The lives of two mob hit men, a boxer, a gangster''s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.  ');
INSERT INTO Movie (Name, Length, released, description) values ('Django Unchained ', 165, '12/25/2012', 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.');
INSERT INTO Movie (Name, Length, released, description) values ('Inglourious Basterds', 153, '08/21/2009', 'In Nazi-occupied France during World War II, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers coincides with a theatre owner''s vengeful plans for the same.');
INSERT INTO Movie (Name, Length, released, description) values ('Se7en', 127, '9/22/1995', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his modus operandi. ');
INSERT INTO Movie (Name, Length, released, description) values ('Silver Linings Playbook', 122, '12/25/2012', 'After a stint in a mental institution, former teacher Pat Solitano moves back in with his parents and tries to reconcile with his ex-wife. Things get more challenging when Pat meets Tiffany, a mysterious girl with problems of her own.');
INSERT INTO Movie (Name, Length, released, description) values ('Life of Pi', 127, '11/21/2012', 'A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.');
INSERT INTO Movie (Name, Length, released, description) values ('Argo', 120, '10/12/2012', 'Acting under the cover of a Hollywood producer scouting a location for a science fiction film, a CIA agent launches a dangerous operation to rescue six Americans in Tehran during the U.S. hostage crisis in Iran in 1980.');
INSERT INTO Movie (Name, Length, released, description) values ('Gravity', 91, '10/4/2013', 'A medical engineer and an astronaut work together to survive after an accident leaves them adrift in space.');
INSERT INTO Movie (Name, Length, released, description) values ('The Hurt Locker', 131, '7/31/2008', 'During the Iraq War, a Sergeant recently assigned to an army bomb squad is put at odds with his squad mates due to his maverick way of handling his work.');
INSERT INTO Movie (Name, Length, released, description) values ('No Country for Old Men', 122, '11/22/2007', 'Violence and mayhem ensue after a hunter stumbles upon a drug deal gone wrong and more than two million dollars in cash near the Rio Grande.');
INSERT INTO Movie (Name, Length, released, description) values ('There Will Be Blood ', 158, '1/25/2008', 'A story of family, religion, hatred, oil and madness, focusing on a turn-of-the-century prospector in the early days of the business.');
INSERT INTO Movie (Name, Length, released, description) values ('Taxi Driver', 113, '2/8/1976', 'A mentally unstable Vietnam War veteran works as a night-time taxi driver in New York City where the perceived decadence and sleaze feeds his urge for violent action, attempting to save a preadolescent prostitute in the process.');
INSERT INTO Movie (Name, Length, released, description) values ('Goodfellas', 146, '9/21/1990', 'Henry Hill and his friends work their way up through the mob hierarchy.');
INSERT INTO Movie (Name, Length, released, description) values ('The Godfather: Part II', 202, '12/20/1974', 'The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on his crime syndicate stretching from Lake Tahoe, Nevada to pre-revolution 1958 Cuba.');
INSERT INTO Movie (Name, Length, released, description) values ('The Godfather', 175, '3/24/1972', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.');
INSERT INTO Movie (Name, Length, released, description) values ('The Shawshank Redemption', 142, '10/14/1994', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.');
INSERT INTO Movie (Name, Length, released, description) values ('Forrest Gump', 144, '7/6/1994', 'Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.');
INSERT INTO Movie (Name, Length, released, description) values ('The Matrix', 134, '3/31/1999', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.');
INSERT INTO Movie (Name, Length, released, description) values ('The Lord of the Rings: The Fellowship of the Ring', 178, '12/19/2001', 'A meek Hobbit and eight companions set out on a journey to destroy the One Ring and the Dark Lord Sauron.');
INSERT INTO Movie (Name, Length, released, description) values ('The Lord of the Rings: The Two Towers', 179, '12/18/2002', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman, and his hordes of Isengard.');
INSERT INTO Movie (Name, Length, released, description) values ('The Lord of the Rings: The Return of the King', 201, '12/17/2003', 'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.');
INSERT INTO Movie (Name, Length, released, description) values ('Inception', 148, '7/16/2010', 'A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.');
INSERT INTO Movie (Name, Length, released, description) values ('Interstellar', 169, '11/7/2014', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.');
INSERT INTO Movie (Name, Length, released, description) values ('The Wolf of Wall Street', 180, '12/25/2013', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.');
INSERT INTO Movie (Name, Length, released, description) values ('Shutter Island', 138, '2/19/2010', 'A U.S Marshal investigates the disappearance of a murderess who escaped from a hospital for the criminally insane.');
INSERT INTO Movie (Name, Length, released, description) values ('The Prestige', 130, '10/20/2006', 'Two stage magicians engage in competitive one-upmanship in an attempt to create the ultimate stage illusion.');
INSERT INTO Movie (Name, Length, released, description) values ('The Departed', 151, '10/6/2006', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.');




