#Tables
set foreign_key_checks = 0;
DROP TABLE IF EXISTS Quest, Skill, QuestPrerequisite, SkillRequirement, Difficulty, Length, User, CompletedQuests;
set foreign_key_checks = 1;

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
);

CREATE TABLE Skill(
	skillName VARCHAR(30),
	PRIMARY KEY(skillName)
);

CREATE TABLE QuestPrerequisite
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	baseQuest VARCHAR(150),
	prerequisiteQuest VARCHAR(150),
	PRIMARY KEY(id),
	FOREIGN KEY(baseQuest) REFERENCES Quest(questName),
	FOREIGN KEY(prerequisiteQuest) REFERENCES Quest(questName)
);

CREATE TABLE SkillRequirement
(
	id INTEGER NOT NULL AUTO_INCREMENT,
	questName VARCHAR(150),
	skillName VARCHAR(30),
	skillLevel INTEGER,
	PRIMARY KEY(id),
	FOREIGN KEY(questName) REFERENCES Quest(questName),
	FOREIGN KEY(skillName) REFERENCES Skill(skillName)
);

CREATE TABLE Difficulty
(
	difficulty VARCHAR(20),
	PRIMARY KEY(difficulty)
);

CREATE TABLE Length
(
	length VARCHAR(20),
	PRIMARY KEY(length)
);

CREATE TABLE CompletedQuests
(
	userID VARCHAR(50),
	questName VARCHAR(150),
	PRIMARY KEY(userID, questName),
	FOREIGN KEY(questName) REFERENCES Quest(questName)
);

#Free-to-Play Skills
INSERT INTO Skill(skillName) VALUES("Attack");
INSERT INTO Skill(skillName) VALUES("Strength");
INSERT INTO Skill(skillName) VALUES("Defence");
INSERT INTO Skill(skillName) VALUES("Ranged");
INSERT INTO Skill(skillName) VALUES("Prayer");
INSERT INTO Skill(skillName) VALUES("Magic");
INSERT INTO Skill(skillName) VALUES("Runecrafting");
INSERT INTO Skill(skillName) VALUES("Hitpoints");
INSERT INTO Skill(skillName) VALUES("Crafting");
INSERT INTO Skill(skillName) VALUES("Mining");
INSERT INTO Skill(skillName) VALUES("Smithing");
INSERT INTO Skill(skillName) VALUES("Fishing");
INSERT INTO Skill(skillName) VALUES("Cooking");
INSERT INTO Skill(skillName) VALUES("Firemaking");
INSERT INTO Skill(skillName) VALUES("Woodcutting");

#Member's Only Skills
INSERT INTO Skill(skillName) VALUES("Agility");
INSERT INTO Skill(skillName) VALUES("Herblore");
INSERT INTO Skill(skillName) VALUES("Thieving");
INSERT INTO Skill(skillName) VALUES("Fletching");
INSERT INTO Skill(skillName) VALUES("Slayer");
INSERT INTO Skill(skillName) VALUES("Farming");
INSERT INTO Skill(skillName) VALUES("Construction");
INSERT INTO Skill(skillName) VALUES("Hunter");


#Quests
INSERT INTO Quest(questName) VALUES("Animal Magnetism");
INSERT INTO Quest(questName) VALUES("Another Slice of H.A.M.");
INSERT INTO Quest(questName) VALUES("Between a Rock...");
INSERT INTO Quest(questName) VALUES("Big Chompy Bird Hunting");
INSERT INTO Quest(questName) VALUES("Biohazard");
INSERT INTO Quest(questName) VALUES("Black Knights' Fortress");
INSERT INTO Quest(questName) VALUES("Cabin Fever");
INSERT INTO Quest(questName) VALUES("Clock Tower");
INSERT INTO Quest(questName) VALUES("Cold War");
INSERT INTO Quest(questName) VALUES("Contact!");
INSERT INTO Quest(questName) VALUES("Cook's Assistant");
INSERT INTO Quest(questName) VALUES("Creature of Fenkenstrain");
INSERT INTO Quest(questName) VALUES("Darkness of Hallowvale");
INSERT INTO Quest(questName) VALUES("Death Plateau");
INSERT INTO Quest(questName) VALUES("Death to the Dorgeshuun");
INSERT INTO Quest(questName) VALUES("Demon Slayer");
INSERT INTO Quest(questName) VALUES("Desert Treasure");
INSERT INTO Quest(questName) VALUES("Devious Minds");
INSERT INTO Quest(questName) VALUES("The Digsite");
INSERT INTO Quest(questName) VALUES("Doric's Quest");
INSERT INTO Quest(questName) VALUES("Dragon Slayer");
INSERT INTO Quest(questName) VALUES("Dream Mentor");
INSERT INTO Quest(questName) VALUES("Druidic Ritual");
INSERT INTO Quest(questName) VALUES("Dwarf Cannon");
INSERT INTO Quest(questName) VALUES("Eadgar's Ruse");
INSERT INTO Quest(questName) VALUES("Eagle's Peak");
INSERT INTO Quest(questName) VALUES("Elemental Workshop I");
INSERT INTO Quest(questName) VALUES("Elemental Workshop II");
INSERT INTO Quest(questName) VALUES("Enakhra's Lament");
INSERT INTO Quest(questName) VALUES("Enlightened Journey");
INSERT INTO Quest(questName) VALUES("Ernest the Chicken");
INSERT INTO Quest(questName) VALUES("The Eyes of Glouphrie");
INSERT INTO Quest(questName) VALUES("Fairytale I - Growing Pains");
INSERT INTO Quest(questName) VALUES("Fairytale II - Cure a Queen");
INSERT INTO Quest(questName) VALUES("Family Quest");
INSERT INTO Quest(questName) VALUES("The Fued");
INSERT INTO Quest(questName) VALUES("Fight Arena");
INSERT INTO Quest(questName) VALUES("Fishing Contest");
INSERT INTO Quest(questName) VALUES("Forgettable Tale of a Drunken Dwarf");
INSERT INTO Quest(questName) VALUES("The Fremennik Isles");
INSERT INTO Quest(questName) VALUES("The Fremennik Trials");
INSERT INTO Quest(questName) VALUES("Garden of Tranquillity");
INSERT INTO Quest(questName) VALUES("Gertrude's Cat");
INSERT INTO Quest(questName) VALUES("Ghosts Ahoy");
INSERT INTO Quest(questName) VALUES("The Giant Dwarf");
INSERT INTO Quest(questName) VALUES("Goblin Diplomacy");
INSERT INTO Quest(questName) VALUES("The Golem");
INSERT INTO Quest(questName) VALUES("The Grand Tree");
INSERT INTO Quest(questName) VALUES("The Great Brain Robbery");
INSERT INTO Quest(questName) VALUES("Grim Tales");
INSERT INTO Quest(questName) VALUES("The Hand in the Sand");
INSERT INTO Quest(questName) VALUES("Haunted Mine");
INSERT INTO Quest(questName) VALUES("Hazeel Cult");
INSERT INTO Quest(questName) VALUES("Heroes' Quest");
INSERT INTO Quest(questName) VALUES("Holy Grail");
INSERT INTO Quest(questName) VALUES("Horror from the Deep");
INSERT INTO Quest(questName) VALUES("Icthlarin's Little Helper");
INSERT INTO Quest(questName) VALUES("Imp Catcher");
INSERT INTO Quest(questName) VALUES("In Aid of the Myreque");
INSERT INTO Quest(questName) VALUES("In Search of the Myreque");
INSERT INTO Quest(questName) VALUES("Jungle Potion");
INSERT INTO Quest(questName) VALUES("King's Ransom");
INSERT INTO Quest(questName) VALUES("The Knight's Sword");
INSERT INTO Quest(questName) VALUES("Legends' Quest");
INSERT INTO Quest(questName) VALUES("Lost City");
INSERT INTO Quest(questName) VALUES("The Lost Tribe");
INSERT INTO Quest(questName) VALUES("Lunar Diplomacy");
INSERT INTO Quest(questName) VALUES("Making History");
INSERT INTO Quest(questName) VALUES("Merlin's Crystal");
INSERT INTO Quest(questName) VALUES("Monkey Madness");
INSERT INTO Quest(questName) VALUES("Monkey Madness II");
INSERT INTO Quest(questName) VALUES("Monk's Friend");
INSERT INTO Quest(questName) VALUES("Mountain Daughter");
INSERT INTO Quest(questName) VALUES("Mourning's Ends Part I");
INSERT INTO Quest(questName) VALUES("Mourning's Ends Part II");
INSERT INTO Quest(questName) VALUES("Murder Mystery");
INSERT INTO Quest(questName) VALUES("My Arm's Big Adventure");
INSERT INTO Quest(questName) VALUES("Nature Spirit");
INSERT INTO Quest(questName) VALUES("Observatory Quest");
INSERT INTO Quest(questName) VALUES("Olaf's Quest");
INSERT INTO Quest(questName) VALUES("One Small Favour");
INSERT INTO Quest(questName) VALUES("Pirate's Treasure");
INSERT INTO Quest(questName) VALUES("Plague City");
INSERT INTO Quest(questName) VALUES("Priest in Peril");
INSERT INTO Quest(questName) VALUES("Prince Ali Rescue");
INSERT INTO Quest(questName) VALUES("Rag and Bone Man");
INSERT INTO Quest(questName) VALUES("Rat Catchers");
INSERT INTO Quest(questName) VALUES("Recipe for Disaster");
INSERT INTO Quest(questName) VALUES("Recruitment Drive");
INSERT INTO Quest(questName) VALUES("Regicide");
INSERT INTO Quest(questName) VALUES("The Restless Ghost");
INSERT INTO Quest(questName) VALUES("Romeo & Juliet");
INSERT INTO Quest(questName) VALUES("Roving Elves");
INSERT INTO Quest(questName) VALUES("Royal Trouble");
INSERT INTO Quest(questName) VALUES("Rum Deal");
INSERT INTO Quest(questName) VALUES("Rune Mysteries");
INSERT INTO Quest(questName) VALUES("Scorpion Catcher");
INSERT INTO Quest(questName) VALUES("Sea Slug");
INSERT INTO Quest(questName) VALUES("Shades of Mort'ton");
INSERT INTO Quest(questName) VALUES("Shadow of the Storm");
INSERT INTO Quest(questName) VALUES("Sheep Herder");
INSERT INTO Quest(questName) VALUES("Sheep Shearer");
INSERT INTO Quest(questName) VALUES("Shield of Arrav");
INSERT INTO Quest(questName) VALUES("Shilo Village");
INSERT INTO Quest(questName) VALUES("The Slug Menace");
INSERT INTO Quest(questName) VALUES("A Soul's Bane");
INSERT INTO Quest(questName) VALUES("Spirits of the Elid");
INSERT INTO Quest(questName) VALUES("Swan Song");
INSERT INTO Quest(questName) VALUES("Tai Bwo Wannai Trio");
INSERT INTO Quest(questName) VALUES("A Tail of Two Cats");
INSERT INTO Quest(questName) VALUES("Tears of Guthix");
INSERT INTO Quest(questName) VALUES("Temple of Ikov");
INSERT INTO Quest(questName) VALUES("Throne of Miscellania");
INSERT INTO Quest(questName) VALUES("The Tourist Trap");
INSERT INTO Quest(questName) VALUES("Tower of Life");
INSERT INTO Quest(questName) VALUES("Tree Gnome Village");
INSERT INTO Quest(questName) VALUES("Tribal Totem");
INSERT INTO Quest(questName) VALUES("Troll Romance");
INSERT INTO Quest(questName) VALUES("Troll Stronghold");
INSERT INTO Quest(questName) VALUES("Underground Pass");
INSERT INTO Quest(questName) VALUES("Vampire Slayer");
INSERT INTO Quest(questName) VALUES("Wanted!");
INSERT INTO Quest(questName) VALUES("Watchtower");
INSERT INTO Quest(questName) VALUES("Waterfall Quest");
INSERT INTO Quest(questName) VALUES("What Lies Below");
INSERT INTO Quest(questName) VALUES("Witch's House");
INSERT INTO Quest(questName) VALUES("Witch's Potion");
INSERT INTO Quest(questName) VALUES("Zogre Flesh Eaters");


#Quest Prerequisites
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Animal Magnetism", "The Restless Ghost");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Animal Magnetism", "Ernest the Chicken");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Animal Magnetism", "Priest in Peril");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Another Slice of H.A.M.", "Death to the Dorgeshuun");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Another Slice of H.A.M.", "The Giant Dwarf");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Another Slice of H.A.M.", "The Digsite");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Between a Rock...", "Dwarf Cannon");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Between a Rock...", "Fishing Contest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Biohazard", "Plague City");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Cabin Fever", "Pirate's Treasure");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Cabin Fever", "Rum Deal");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Contact!", "Prince Ali Rescue");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Contact!", "Gertrude's Cat");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Contact!", "Icthlarin's Little Helper");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Creature of Fenkenstrain", "Priest in Peril");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Creature of Fenkenstrain", "The Restless Ghost");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Darkness of Hallowvale", "In Aid of the Myreque");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Death to the Dorgeshuun", "The Lost Tribe");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Desert Treasure", "Digsite Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Desert Treasure", "Priest in Peril");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Desert Treasure", "Temple of Ikov");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Desert Treasure", "The Tourist Trap");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Desert Treasure", "Troll Stronghold");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Desert Treasure", "Waterfall Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Devious Minds", "Wanted!");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Devious Minds", "Troll Stringhold");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Devious Minds", "Recruitment Drive");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Devious Minds", "Doric's Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Dream Mentor", "Lunar Diplomacy");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Dream Mentor", "Eadgar's Ruse");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Eadgar's Ruse", "Druidic Ritual");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Eadgar's Ruse", "Troll Stronghold");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Elemental Workshop II", "Elemental Workshop I");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("The Eyes of Glouphrie", "The Grand Tree");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("FairyTale I - Growing Pains", "The Lost City");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("FairyTale I - Growing Pains", "Nature Spirit");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Fairytale II - Cure a Queen", "FairyTale I - Growing Pains");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Forgettable Tale of a Drunken Dwarf", "The Giant Dwarf");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Forgettable Tale of a Drunken Dwarf", "Fishing Contest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("The Fremennik Isles", "The Fremennik Trials");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Garden of Tranquillity", "Creature of Fenkenstrain");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Ghosts Ahoy", "Priest in Peril");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Ghosts Ahoy", "The Restless Ghost");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("The Great Brain Robbery", "Creature of Fenkenstrain");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("The Great Brain Robbery", "Cabin Fever");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("The Great Brain Robbery", "Recipe for Disaster");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Grim Tales", "Witch's House");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Haunted Mine", "Priest in Peril");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Heroes' Quest", "Shield of Arrav");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Heroes' Quest", "The Lost City");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Heroes' Quest", "Dragon Slayer");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Heroes' Quest", "Merlin's Crystal");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Holy Grail", "Merlin's Crystal");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Icthlarin's Little Helper", "Gertrude's Cat");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("In Aid of the Myreque", "In Search of te Myreque");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("In Aid of the Myreque", "Nature Spirit");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("In Search of the Myreque", "Nature Spirit");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Jungle Potion", "Druidic Ritual");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("King's Ransom", "Black Knight's Fortress");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("King's Ransom", "Merlin's Crystal");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("King's Ransom", "Holy Grail");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("King's Ransom", "Murder Mystery");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("King's Ransom", "One Small Favour");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Legends' Quest", "Family Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Legends' Quest", "Heroes Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Legends' Quest", "Shilo Village Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Legends' Quest", "Underground Pass");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Legends' Quest", "Waterfall Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("The Lost Tribe", "Goblin Diplomacy");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("The Lost Tribe", "Rune Mysteries");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Lunar Diplomacy", "Fremennik Trials");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Lunar Diplomacy", "The Lost City");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Lunar Diplomacy", "Rune Mysteries");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Lunar Diplomacy", "Shilo Village");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Making History", "Priest in Peril");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Making History", "The Restless Ghost");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Monkey Madness", "The Grand Tree");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Monkey Madness", "Tree Gnome Village");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Monkey Madness II", "Enlightened Journey");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Monkey Madness II", "The Eyes of Glouphrie");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Monkey Madness II", "Recipe for Disaster");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Monkey Madness II", "Troll Stronghold");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Monkey Madness II", "Watchtower");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Mourning's Ends Part I", "Big Chompy Bird Hunting");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Mourning's Ends Part I", "Roving Elves");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Mourning's Ends Part I", "Sheep Herder");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Mourning's Ends Part II", "Mourning's End Part I");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("My Arm's Big Adventure", "Eadgar's Ruse");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("My Arm's Big Adventure", "The Fued");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("My Arm's Big Adventure", "Jungle Potion");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Nature Spirit", "Priest in Peril");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Nature Spirit", "The Restless Ghost");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Olaf's Quest", "The Fremennik Trials");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("One Small Favour", "Druidic Ritual");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("One Small Favour", "Rune Mysteries");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("One Small Favour", "Shilo Village");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Rat Catchers", "Gertrude's Cat");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Rat Catchers", "Icthlarin's Little Helper");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Cook's Assistant");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Fishing Contest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Goblin Diplomacy");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Big Chompy Bird Hunting");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Murder Mystery");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Nature Spirit");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Witch's House");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Gertrude's Cat");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Shadow of the Storm");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Legends' Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Monkey Madness");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Desert Treasure");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recipe for Disaster", "Horror from the Deep");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recruitment Drive", "Black Knight's Fortress");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Recruitment Drive", "Druidic Ritual");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Regicide", "Underground Pass");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Roving Elves", "Regicide");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Roving Elves", "Waterfall Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Royal Trouble", "Throne of Miscellania");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Rum Deal", "Zogre Flesh Eaters");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Shades of Mort'ton", "Priest in Peril");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Shadow of the Storm", "Demon Slayer");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Shadow of the Storm", "The Golem");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Shilo Village", "Jungle Potion");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("The Slug Menace", "Wanted!");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("The Slug Menace", "Sea Slug");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Swan Song", "One Small Favour");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Swan Song", "Garden of Tranquillity");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Tai Bwo Wannai Trio", "Jungle Potion");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("A Tail of Two Cats", "Gertrude's Cat");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("A Tail of Two Cats", "Icthlarin's Little Helper");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Throne of Miscellania", "Fremennik Trials");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Throne of Miscellania", "Heroes Quest");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Troll Romance", "Troll Stronghold");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Troll Romance", "Death Plateau");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Troll Stronghold", "Death Plateau");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Underground Pass", "Biohazard");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Wanted!", "The Lost Tribe");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Wanted!", "Priest in Peril");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Wanted!", "Recruitment Drive");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Wanted!", "Rune Mysteries");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("What Lies Below", "Rune Mysteries");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Zogre Flesh Eaters", "Big Chompy Bird Hunting");
INSERT INTO QuestPrerequisite(baseQuest, prerequisiteQuest) VALUES("Zogre Flesh Eaters", "Jungle Potion");