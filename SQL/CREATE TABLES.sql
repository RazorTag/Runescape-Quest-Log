set foreign_key_checks = 0;
DROP TABLE IF EXISTS Quest, Skill, QuestPrerequisite, SkillRequirement, Difficulty, Length;
set foreign_key_checks = 1;

CREATE TABLE Quest 
(
	questName VARCHAR(255),
	questPointsNeeded INTEGER,
	questPointsProvided INTEGER,
	membersOnly BOOLEAN,
	difficulty VARCHAR(255),
	length VARCHAR(255),
	PRIMARY KEY(questName),
	FOREIGN KEY(difficulty) REFERENCES Difficulty(difficulty),
	FOREIGN KEY(length) REFERENCES Length(length)
);

CREATE TABLE Skill(
	skillName VARCHAR(255),
	PRIMARY KEY(skillName)
);

CREATE TABLE QuestPrerequisite
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	baseQuest VARCHAR(255),
	prerequisiteQuest VARCHAR(255),
	PRIMARY KEY(id),
	FOREIGN KEY(baseQuest) REFERENCES Quest(questName),
	FOREIGN KEY(prerequisiteQuest) REFERENCES Quest(questName)
);

CREATE TABLE SkillRequirement
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	questName VARCHAR(255),
	skillName VARCHAR(255),
	skillLevel INTEGER,
	PRIMARY KEY(id),
	FOREIGN KEY(questName) REFERENCES Quest(questName),
	FOREIGN KEY(skillName) REFERENCES Skill(skillName)
);

CREATE TABLE Difficulty
(
	difficulty VARCHAR(255),
	PRIMARY KEY(difficulty)
);

CREATE TABLE Length
(
	length VARCHAR(255),
	PRIMARY KEY(length)
);