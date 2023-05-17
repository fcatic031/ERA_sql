#c:\xampp\mysql\bin\mysql -uroot <C:\Users\FILIP\OneDrive\Documents\DBeaver_files\frizerski_salon.sql


drop database if exists frizerski_salon;
create database frizerski_salon;
use frizerski_salon;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(30),
    email varchar(50)
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2) not null
);

create table posjeta(
    sifra int not null primary key auto_increment,
    korisnik int not null,
    djelatnik int not null,
    usluga int not null,
    vrijeme_posjete datetime not null
);

alter table posjeta add foreign key (korisnik) references korisnik(sifra);
alter table posjeta add foreign key (djelatnik) references djelatnik(sifra);
alter table posjeta add foreign key (usluga) references usluga(sifra);