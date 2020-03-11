-- Exercise Class 2

create database if not exists imdb;

use imdb;

create table if not exists film(
film_id	int not null auto_increment,
title varchar(30) not null,
description varchar(30),
release_year year(4),
constraint film_pk primary key (film_id)
); 

create table if not exists actor(
actor_id int not null auto_increment,
first_name varchar(30),
last_name varchar(30),
constraint actor_pk primary key (actor_id)
);

create table if not exists film_actor(
actor_id int not null,
film_id int not null
);


 alter table film 
 add last_update varchar(80)
 after description;

 alter table actor 
 add last_update varchar(80)
 after last_name;

 alter table film_actor add 
  constraint fk_film_actor_actor	
 foreign key (actor_id)
 references actor(actor_id);

 alter table film_actor add 
 constraint fk_film_actor_film	
 foreign key (film_id)
 references film(film_id);

 insert into film(title,description,last_update ,release_year)
 values ("Harry Potter","the chamber of secrets","nothing updated","2002");

 insert into film(title,description,last_update ,release_year)
 values ("Avengers","infinity war","nothing updated","2018");

 insert into actor(first_name ,last_name ,last_update)
 values ("Daniel","Radcliffe","nothing updated");

 insert into actor(first_name ,last_name ,last_update)
 values ("Emma","Watson","nothing updated");

 insert into actor(first_name ,last_name ,last_update)
 values ("Chris","Hemsworth","nothing updated");

 insert into actor(first_name ,last_name ,last_update)
 values ("Scarlett","Johansson","nothing updated");

 insert into film_actor (actor_id,film_id)
 values ("1","1");

 insert into film_actor (actor_id,film_id)
 values ("2","2");

 insert into film_actor (actor_id,film_id)
 values ("4","2");
	
 insert into film_actor (actor_id,film_id)
 values ("5","1");



