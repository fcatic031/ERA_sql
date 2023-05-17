#c:\xampp\mysql\bin\mysql -uroot <C:\Users\FILIP\OneDrive\Documents\DBeaver_files\doktor.sql


drop database if exists doktor;
create database doktor;
use doktor;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(20),
    email varchar(50),
    spol_musko boolean,
    spol_zensko boolean
);

create table doktor(
    sifra int not null primary key auto_increment,
    osoba int,
    odjel int,
    opis_posla varchar(500),
    titula varchar(30)
);
create table odjel(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table pacijent(
    sifra int not null primary key auto_increment,
    osoba int
);

create table med_sestra(
    sifra int not null primary key auto_increment,
    osoba int,
    odjel int,
    opis_posla varchar(50)
);

create table posjeta(
    sifra int not null primary key auto_increment,
    termin datetime,
    pacijent int,
    doktor int,
    med_sestra int
);

alter table doktor add foreign key (osoba) references osoba(sifra);
alter table med_sestra add foreign key (osoba) references osoba(sifra);
alter table pacijent add foreign key (osoba) references osoba(sifra);
alter table med_sestra add foreign key (odjel) references odjel(sifra);
alter table doktor add foreign key (odjel) references odjel(sifra);
alter table posjeta add foreign key (pacijent) references pacijent(sifra);
alter table posjeta add foreign key (doktor) references doktor(sifra);
alter table posjeta add foreign key (med_sestra) references med_sestra(sifra);

