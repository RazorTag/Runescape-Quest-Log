#Tables
set foreign_key_checks = 0;
DROP TABLE IF EXISTS Quest, Skill, QuestPrerequisite, SkillRequirement, Difficulty, Length, User, CompletedQuests;
set foreign_key_checks = 1;

CREATE TABLE Skill(
	skillName VARCHAR(30),
	PRIMARY KEY(skillName)
) ENGINE = Innodb;

CREATE TABLE Difficulty
(
	difficulty VARCHAR(20),
	PRIMARY KEY(difficulty)
) ENGINE = Innodb;

CREATE TABLE Length
(
	length VARCHAR(20),
	PRIMARY KEY(length)
) ENGINE = Innodb;

CREATE TABLE Quest 
(
	questName VARCHAR(150),
	questPointsNeeded INTEGER,
	questPointsProvided INTEGER,
	membersOnly BOOLEAN,
	difficulty VARCHAR(20),
	length VARCHAR(20),
	PRIMARY KEY(questName),
	FOREIGN KEY(difficulty) REFERENCES Difficulty(difficulty),
	FOREIGN KEY(length) REFERENCES Length(length)
) ENGINE = Innodb;

CREATE TABLE QuestPrerequisite
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	baseQuest VARCHAR(150),
	prerequisiteQuest VARCHAR(150),
	PRIMARY KEY(id),
	FOREIGN KEY(baseQuest) REFERENCES Quest(questName),
	FOREIGN KEY(prerequisiteQuest) REFERENCES Quest(questName)
) ENGINE = Innodb;

CREATE TABLE SkillRequirement
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	questName VARCHAR(150),
	skillName VARCHAR(30),
	skillLevel INTEGER,
	PRIMARY KEY(id),
	FOREIGN KEY(questName) REFERENCES Quest(questName),
	FOREIGN KEY(skillName) REFERENCES Skill(skillName)
) ENGINE = Innodb;

CREATE TABLE CompletedQuests
(
	userID VARCHAR(50),
	questName VARCHAR(150),
	PRIMARY KEY(userID, questName),
	FOREIGN KEY(questName) REFERENCES Quest(questName)
) ENGINE = Innodb;