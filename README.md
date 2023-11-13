# Homework 7 - CMSC508 - Fall 2023

This homework deals with using python, SQL, and quarto to set up a connection 
to a database to set up a database and query information from it.

## Overview

This database represent a company-wide resume capturing the collective skills and cerifications of all the people in company. The databse captures skills, employees, and their roles within the company. This database will help find specific queries such as unused skills, unsed roles, and people with specific skills.

## Homwork Tasks Database

1. Drops all the tables at the top of the file;
2. Creates the tables listed above with columns named EXACTLY as listed in the schemas;
3. Defines primary keys in each table as appropriate;
4. Defines foreign keys as appropriate with CASCADES on delete;
5. Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, 6“Skill 2”, etc.
6. Populates the people table with 10 people, their last names must exactly be “Person 1”, “Person 2”, etc.  Other fields are free for all
7. Populates the peopleskills table.  
8. Populates the roles table with six roles as specified in the scaffold file.
9. Populates the peopleroles table.  

## Homwork Tasks HTML

1. Overview of project and description of database
2. Crows-foot diagram of the entities
3. Listings of the three entity tables (people, roles, skills)
4. A section titled “reports” with subsections that
    a. List all skill names, tags, and descriptions in alphabetical order by name,
    b. List all people and their email addresses in alphabetical order by last_name,
    c. List all skills of Person 1;
    d. List all people with Skill 6;
    e. List all the people with a DEVELOPER role.
    f. List all names and email addresses of people without any skills;
    g. List all names and tags of skills not used by any people;
    h. List all the skills of people in the BOSS role.
    i. List all the unused roles
5. Include a paragraph expressing your thoughts, feelings, and insights about your experience with this assignment.  Pause and breath before writing - I'm trying to encourage critical thinking and self-awareness while allowing you to explore the connections between theory and practice.

## Files and folders

All necessary files are stored in the *./hw6* folder.
Files turned to turn in: hw6.html, hw7-ddl.sql

## Notes

Query of skills name of people with roles of boss incomplete. 
Could not figure out how to join three tables.


