# _Volunteer Tracker_

#### _This app will allow users to add volunteers to a database and modify their information, Friday, May 5, 2017_

#### By _**Nicole Santamaria**_

## Description

_This app will use a SQL database to track volunteers. Users will be able to add volunteers to a specific project. Volunteers and projects can be modified._

## Specifications:

| Behavior |  Input   |  Output  |
|----------|:--------:|:--------:|
| As a non-profit employee, I want to view and add projects. | Project Name: 'Clean Up' | Project List: -'Clean Up'|
| As a non-profit employee, I want to update projects. | Project Name: 'Clean Up' New Project Name: 'Park Clean Up'| Project List: -'Park Clean Up'|
| As a non-profit employee, I want to delete projects. | Project Name: 'Park Clean Up', Delete Project | Project List: |
| As a non-profit employee, I want to view and add volunteers. | Volunteer Name: 'Steve Jobs' | Volunteer List: -'Steve Jobs'|
| As a non-profit employee, I want to update volunteers. | Volunteer Name: 'Steve Jobs' New Volunteer Name: 'Steven Jobs'| Volunteer List: -'Steven Jobs'|
| As a non-profit employee, I want to delete volunteers. | Volunteer Name: 'Steven Jobs', Delete Volunteer | Volunteer List: |
|As a non-profit employee, I want to add volunteers to a project.|Volunteer Name: 'Steve Jobs' Project Name: 'Park Clean Up'| Project Details: 'Park Clean Up' Volunteer List: 'Steve Jobs'
|As a non-profit employee, I want a sort function so projects can be sorted alphabetically.|Sort Projects| Project List: -'Beach Clean Up' -'Park Clean Up'|
|As a non-profit employee, I want a sort function so volunteers can be sorted alphabetically.|Sort Volunteers| Volunteer List: -'Dave Apple' -'Steve Jobs'|
|As a non-profit employee, I want to track how many hours each volunteer has worked.|Volunteer Name: 'Steve Jobs' Hours: 10| Volunteer List: 'Steve Jobs | Hours: 10'|

## Setup/Installation Requirements

ACCESS ATOM FILES

* _Ensure connection to the Internet_
* _On a mac using spotlight search type in terminal_
* _Once in terminal run the command: cd desktop_
* _Run the command: git clone https://github.com/nrsantamaria/volunteer_tracker.git_
* _Run the command: cd volunteer_tracker_
* _Run the command: atom ._
* _This will open all of the files included in the volunteer_tracker folder including Gemfile, Gemfile.lock, app.rb, README.md, views folder, spec folder, public folder, lib folder_
* _To make changes to the text on the page that the user will see you will need to access the files in the views folder._
* _To make changes to the look of the file you will need to access the styles.css file._
* _To make changes to the functions of the form you will need to access the volunteer.rb file or project.rb file._

CREATE SQL DATABASE AND TABLES

* _Open a new tab in terminal_
* _Enter the command: postgres_
* _Open a new tab in terminal_
* _Enter the command: psql_
* _Enter the command: CREATE DATABASE volunteer_tracker;_
* _Enter the command: \c volunteer_tracker;_
* _Enter the command: CREATE TABLE volunteers (id serial PRIMARY KEY, first_name varchar, last_name varchar, hours integer, project_id integer);_
* _Enter the command: CREATE TABLE projects (id serial PRIMARY KEY, project_name varchar);_
* _Enter the command: \c #your system name#_
* _Enter the command: CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;_

## Known Bugs

_No known bugs._

## Support and contact details

_Please contact Nicole Santamaria at NicoleRSantamaria@gmail.com if you have any questions._

## Technologies Used

_postgres_
_psql_

### License

*This software is licensed under MIT license.*

Copyright (c) 2017 **_Nicole Santamaria_**
