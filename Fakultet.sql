drop database if exists fakultet;
create database fakultet;
use fakultet;

create table kolegij(
	sifra int not null primary key auto_increment,
	nositelj_kolegija int not null,
	godina int not null,
	naziv varchar(50) not null
);

create table rok(
	sifra int not null primary key auto_increment,
	kolegij int not null,
	datum_pisanja datetime not null,
	datum_otkazivanja datetime,
	max_izlazaka int
);

create table profesor(
	sifra int not null primary key auto_increment,
	osoba int not null,
	titula varchar(50)
);

create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	email varchar(100),
	oib char(50),
	datum_rodenja datetime
);

create table student(
	sifra int not null primary key auto_increment,
	osoba int not null,
	godina_upisana int not null,
	datum_upisa datetime
);

create table student_rok(
	student int not null,
	rok int not null,
	broj_izlaska int, 
	max_izlazaka int
);



alter table rok add foreign key(kolegij) references kolegij(sifra);
alter table profesor add foreign key (osoba) references osoba(sifra);
alter table student add foreign key (osoba) references osoba(sifra);
alter table kolegij add foreign key (nositelj_kolegija) references profesor(sifra);

alter table student_rok add foreign key(student) references student(sifra);
alter table student_rok add foreign key(rok) references rok(sifra);

insert into osoba(ime,prezime) values
('Kaligula','Srnić'),('Galvan','Tripol'),('Slavoljub','Gusjenič'),
('Robi','Galić'),('Senka','Senić'),('Petar','Portugal');

insert into profesor(osoba) values
(1),(2),(3);

insert into student(osoba,godina_upisana) values
(4,3),(5,1),(6,2);

insert into kolegij(nositelj_kolegija,godina,naziv) values
(1,3,'Uvod u nuklearnu fiziku'),(2,1,'Engleski jezik 2'),(3,2,'Linearna algebra');

insert into rok(kolegij,datum_pisanja) values
(1,'2023-06-24 09:30:00 AM'),(2,'2023-06-25 10:00:00 AM'),(3,'2023-06-26 11:00:00 AM');

insert into student_rok(student,rok,broj_izlaska) values
(1,1,2),(2,2,3),(3,3,1);

#c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\Users\xyz\Documents\GitHub\ERA_sql\Fakultet.sql
