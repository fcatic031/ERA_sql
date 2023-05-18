#c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\Users\xyz\Documents\GitHub\ERA_sql\frizerski_salon.sql


drop database if exists frizerski_salon;
create database frizerski_salon;
use frizerski_salon;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
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
    vrijeme_posjete datetime
);

alter table posjeta add foreign key (korisnik) references korisnik(sifra);
alter table posjeta add foreign key (djelatnik) references djelatnik(sifra);
alter table posjeta add foreign key (usluga) references usluga(sifra);

insert into osoba (ime,prezime) values
('Sanja','Vučić'),('Senka','Senkić'),('Stefan','Sakić'),
('Gordan',null),('Dražen',null),('Karla',null);

insert into djelatnik(osoba) values
(1),(2),(3);

insert into korisnik(osoba) values
(4),(5),(6);

insert into usluga(naziv,cijena) values
('Muško šišanje', 5.5),('Žensko šišanje',7),('Pramenovi',30);

insert into posjeta(korisnik,djelatnik,usluga,vrijeme_posjete) values
(1,1,1,null),(2,1,1,'2023-05-08 06:00:00 PM'),(3,3,3,null);