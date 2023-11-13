# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;

show tables;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills(
    skills_id int not null,
    skills_name varchar(225) not null,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    primary key (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills( skills_id, skills_name, skills_description, skills_tag, skills_url, skills_time_commitment ) values
    (1, 'moonwalking', 'gliding across surfaces and walking on the moon', 'Skill 1', 'skills.com/moonwalk', 2),
    (2, 'jellybean mind juggling', 'juggling a total of 20 jellybeans with the mind', 'Skill 2', 'skills.com/jelly', 100),
    (3, 'speed snack stacking', 'like speed cup stacking, but with snacks only', 'Skill 3', 'skills.com/speed-snack-stack', 3),
    (4, 'toothpaste mural artist', 'creating murals out of toothpaste', 'Skill 4', 'skills.com/toothpast-art', 500),
    (5, 'bubble warp producer', 'producing sick rap beats with bubble wrap', 'Skill 5', 'skills.com/bubble-music', 600),
    (6, 'python coding', 'writing python programs', 'Skill 6', 'skills.com/python', 4),
    (7, 'ballon animal interpretation', 'translate the silent messages of inflatable creatures', 'Skill 7', 'skills.com/ballon-animal-interpret', 80),
    (8, 'lock picker', 'crack any lock no matter how complicated', 'Skill 8', 'skills.com/lock-picker', 50)
    ;

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(256),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(256),
    people_linkedin_url varchar(256),
    people_headshot_url varchar(256),
    people_discord_handle varchar(256),
    people_breif_bio varchar(256),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,people_first_name, people_last_name, people_email, people_linkedin_url,
people_headshot_url, people_discord_handle, people_breif_bio, people_date_joined ) values 
    (1,'Emily', 'Person 1', 'emily.johnson@hr.com', 'linkedin.com/emily-johnson/', 'headshot.com/emily-johnson/', 
    '@JelloJester', 'junior frontend developer', '21-01-12'),
    (2,'Ethan', 'Person 2', 'ethan.williams@hr.com', 'linkedin.com/ethan-williams/', 'headshot.com/ethan-williams/', 
    '@QuackMAster', 'junior backend developer', '21-12-14'),
    (3,'Grace', 'Person 3', 'grace.mitchell@hr.com', 'linkedin.com/grace-mitchell/', 'headshot.com/grace-mitchell/', 
    '@Frog&feathers', 'product manager', '16-02-11'),
    (4,'Daniel', 'Person 4', 'daniel.carter@hr.com', 'linkedin.com/daniel-carter/', 'headshot.com/daniel-carter/', 
    '@PJNinja', 'Ui/UX designer', '18-09-05'),
    (5,'Lily', 'Person 5', 'lily.anderson@hr.com', 'linkedin.com/lily-anderson/', 'headshot.com/lily-anderson/', 
    '@g4latic_bun', 'qa tester', '19-04-17'),
    (6,'Jacob', 'Person 6', 'jacob.taylor@hr.com', 'linkedin.com/jacob-taylor/', 'headshot.com/jacob-taylor/', 
    '@CupcakeC0mmander', 'cupcake maker', '23-07-02'),
    (7,'Olivia', 'Person 7', 'olivia.wright@hr.com', 'linkedin.com/olivia-wright/', 'headshot.com/oliva-wright/', 
    '@ZzzMaster', 'junior frontend developer', '20-06-19'),
    (8,'Noah', 'Person 8', 'noah.martinez@hr.com', 'linkedin.com/noah-martinez/', 'headshot.com/noah-martinez/', 
    '@PixelPenguin', 'junior backend developer', '21-11-17'),
    (9,'Sophia', 'Person 9', 'sophia.brown@hr.com', 'linkedin.com/sophia-brown/', 'headshot.com/sophia-brown/', 
    '@Banj0Banana', 'senior frontend developer', '18-01-12'),
    (10,'Liam', 'Person 10', 'liam.davis@hr.com', 'linkedin.com/liam-davis/', 'headshot.com/liam-davis/', 
    '@DiscoDino', 'project manager', '18-08-06')
    ;

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

create table peopleskills (
    id int auto_increment,
    skills_id int not null,
    people_id int not null,
    date_acquired date default (current_date),
    primary key (id),
    foreign key (skills_id) references skills (skills_id),
    foreign key (people_id) references people (people_id),
    unique (skills_id,people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id, skills_id) values
    (1,1),
    (1,3),
    (1,6),
    (2,3),
    (2,4),
    (2,5),
    (3,1),
    (3,5),
    (5,3),
    (5,6),
    (6,2),
    (6,3),
    (6,4),
    (7,3),
    (7,5),
    (7,6),
    (8,1),
    (8,3),
    (8,5),
    (8,6),
    (9,2),
    (9,5),
    (9,6),
    (10,1),
    (10,4),
    (10,5);

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

create table roles (
   roles_id int,
   roles_name varchar(256), 
   roles_sort_priority int,
   primary key (roles_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (roles_id, roles_name, roles_sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60)
    ;

# Section 10
# Create peopleroles( peopleroles_id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

create table peopleroles (
    peopleroles_id int auto_increment not null,
    people_id int not null,
    roles_id int not null,
    date_assigned date not null,
    primary key (peopleroles_id),
    foreign key (people_id) references people (people_id),
    foreign key (roles_id) references roles (roles_id),
    unique (people_id,roles_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id, roles_id, date_assigned) values
    (1, 2, '2022-08-03'),
    (2, 5, '2021-09-22'),
    (2, 6, '2022-03-07'),
    (3, 2, '2021-05-18'),
    (3, 4, '2021-05-18'),
    (4, 3, '2021-09-14'),
    (5, 3, '2022-02-09'),
    (6, 2, '2021-08-17'),
    (6, 1, '2021-08-17'),
    (7, 1, '2021-06-17'),
    (8, 1, '2022-08-03'),
    (8, 4, '2022-08-03'),
    (9, 2, '2019-09-15'),
    (10, 2, '2020-12-10'),
    (10, 1, '2020-12-10')
    ;
