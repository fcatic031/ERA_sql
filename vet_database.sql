#c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\Users\xyz\Documents\GitHub\ERA_sql\vet_database.sql

drop database if exists vet_database;
create database vet_database;
use vet_database;

create table owner(
    id_owner int not null primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(150),
    cellphone_number varchar(30)
);

create table species(
    id_species int not null primary key auto_increment,
    name_english varchar(50),
    name_latin varchar(150)
);
    
create table animal(
    id_animal int not null primary key auto_increment,
    name_animal varchar(50),
    species int not null,
    breed varchar(50),
    owner_animal int,
    day_of_birth datetime,
    chip_location varchar(50)
);

create table treatment(
    id_treatment int not null primary key auto_increment,
    date_visit datetime,
    weight_animal decimal(18,2),
    animal int,
    vacination varchar(50),
    next_treatment int
);

alter table animal add foreign key (owner_animal) references owner(id_owner);
alter table animal add foreign key (species) references species(id_species);
alter table treatment add foreign key (animal) references animal(id_animal);
alter table treatment add foreign key (next_treatment) references treatment(id_treatment);