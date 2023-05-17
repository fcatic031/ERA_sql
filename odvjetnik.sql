#c:\xampp\mysql\bin\mysql -uroot <C:\Users\FILIP\OneDrive\Documents\DBeaver_files\odvjetnik.sql

drop database if exists odvjetnik;
create database odvjetnik;
use odvjetnik;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(30),
    email varchar(50)
);

create table odvjetnik(
    sifra int not null primary key auto_increment,
    osoba int
);

create table klijent(
    sifra int not null primary key auto_increment,
    osoba int
);

create table odvjetnik_suradnik(
    sifra int not null primary key auto_increment,
    obrana int,
    glavni_odvjetnik int,
    suradnik int
);

create table obrana(
    sifra int not null primary key auto_increment,
    datum datetime,
    klijent int
);

alter table odvjetnik_suradnik add foreign key (obrana) references obrana(sifra);
alter table odvjetnik_suradnik add foreign key (glavni_odvjetnik) references odvjetnik(sifra);
alter table odvjetnik_suradnik add foreign key (suradnik) references odvjetnik(sifra);
alter table odvjetnik add foreign key (osoba) references osoba(sifra);
alter table klijent add foreign key (osoba) references osoba(sifra);
alter table obrana add foreign key (klijent) references klijent(sifra);