#

drop database if exists app;
create database app;
use database;

create table obitelj(
    id int not null primary key auto_increment,
    prezime_obitelji varchar(50)
);

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    email varchar(50),
    spol boolean,
    obitelj int
);

create table kategorija(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table dnevna_potrosnja(
    id int not null primary key auto_increment,
    korisnik int,
    datum datetime,
    kategorija int,
    potrosnja decimal(18,2)
);

alter table korisnik add foreign key (obitelj) references obitelj(id);
alter table dnevna_potrosnja add foreign key (korisnik) references korisnik(id);
alter table dnevna_potrosnja add foreign key (kategorija) references kategorija(id);