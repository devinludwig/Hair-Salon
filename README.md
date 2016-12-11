# _Hair Salon Manager_

#### _An app to save and edit clients and stylists for a hair salon., 12-9-2016_

#### By _**Devin Ludwig**_

## Description

_This app allows a salon owner to add stylists and clients to a database as well as delete them. Clients may be assigned to a stylist and updated to reassign to a new stylist. Stylist names can be updated after they are added to the database._

## Setup/Installation Requirements

* _Clone this repository._
* _Install Ruby on your machine._
* _Run the 'bundle' command in your computer's terminal._
* _Install postgres on your machine. You may use the instructions here if you need help: https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef_
* _Run postgres and use psql to create the necessary databases:_
  * _Enter the command 'CREATE DATABASE hair_salon;'._
  * _Enter the command '\c hair_salon' to connect to this database._
  * _Enter the command 'CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);'._
  * _Enter the command 'CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);'._

* _Enter 'ruby app.rb' in your terminal to run the Sinatra gem._
* _Navigate to http://localhost:4567/ in your web browser._

## Support and contact details

_If you have any issues with this application please don't hesitate to contact me at devinludwig@hotyahoos.com. You are welcome to contribute to the code and please let me know if you do!_

## Technologies Used

_This was made with Ruby, utilizing Bootstrap for some of the styling._

### License

*This project is licensed under the GPL license.*

Copyright (c) 2016 **_Devin Arthur Ludwig_**
