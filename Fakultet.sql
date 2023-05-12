drop database if exists fakultet;
create database fakultet;
use fakultet;

create table kolegij(
	sifra int not null primary key auto_increment,
	nositelj_kolegija int,
	semestar int,
	studij varchar(50)
);

create table rok(
	sifra int not null primary key auto_increment,
	kolegij int,
	datum_pisanja datetime,
	datum_otkazivanja datetime,
	max_izlazaka int
);

create table nositelj_kolegija(
	sifra int not null primary key auto_increment,
	osoba int,
	titula varchar(50)
);

create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	email varchar(100),
	oib char(50),
	datum_rodenja datetime
);

create table student(
	sifra int not null primary key auto_increment,
	osoba int,
	godina int,
	godina_upisa int
);

create table student_rok(
	student int,
	rok int,
	broj_izlaska int, 
	max_izlazaka int
);



alter table rok add foreign key(kolegij) references kolegij(sifra);
alter table nositelj_kolegija add foreign key (osoba) references osoba(sifra);
alter table student add foreign key (osoba) references osoba(sifra);
alter table kolegij add foreign key (nositelj_kolegija) references nositelj_kolegija(sifra);

alter table student_rok add foreign key(student) references student(sifra);
alter table student_rok add foreign key(rok) references rok(sifra);
