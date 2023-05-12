drop database if exists edunovajp28;
create database edunovajp28;
use edunovajp28;

create table smjer(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	cijena decimal(18,2),
	upisnina decimal(18,2),
	trajanje int not null,
	vertifikacija boolean
);

create table grupa(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	smjer int not null,
	max_polaznika int,
	predavac int,
	datum_pocetka datetime
);

create table polaznik(
	sifra int not null primary key auto_increment,
	broj_ugovora varchar(20),
	osoba int not null
);

create table predavac(
	sifra int not null primary key auto_increment,
	iban varchar(50),
	osoba int not null
);

create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib char(11),
	email varchar(100)
);

create table clan(
	grupa int not null,
	polaznik int not null
);

alter table grupa add foreign key(smjer) references smjer(sifra);
alter table grupa add foreign key(predavac) references predavac(sifra);
alter table predavac add foreign key(osoba) references osoba(sifra);
alter table polaznik add foreign key(osoba) references osoba(sifra);
alter table clan add foreign key(polaznik) references polaznik(sifra);
alter table clan add foreign key(grupa) references grupa(sifra);