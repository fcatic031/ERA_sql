#c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\Users\xyz\Documents\GitHub\ERA_sql\premier_league.sql


drop database if exists premier_league;
create database premier_league;
use premier_league;

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datum_rodjenja datetime,
    spol boolean not null
);

create table trener(
    id int not null primary key auto_increment,
    osoba int,
    klub int
);

create table klub(
    id int not null primary key auto_increment,
    naziv varchar(50),
    glavni_trener int
);

create table igrac(
    id int not null primary key auto_increment,
    osoba int,
    klub int,
    pozicija varchar(50),
    vrijednost int
);

create table utakmica(
    id int not null primary key auto_increment,
    datum datetime,
    klub_1 int,
    klub_2 int,
    rezultat_1 int,
    rezultat_2 int,
    opis varchar(300)
);

create table korisnik(
    id int not null primary key auto_increment,
    osoba int,
    email varchar(50)
);

create table kladionica(
    korisnik int,
    utakmica int,
    ulozeno decimal(18,2),
    ocekivano varchar(5),
    kvota decimal(18,2),
    iznos decimal(18,2),
    rezultat boolean
);

create table nagradna_igra(
    korisnik int,
    iznos decimal(18,2),
    rezultat boolean
);

create table ulaznica(
    korisnik int,
    utakmica int,
    sektor varchar(5),
    sjedalo int,
    cijena decimal(18,2)
);






alter table trener add foreign key (osoba) references osoba(id);
alter table trener add foreign key (klub) references klub(id);
alter table igrac add foreign key (osoba) references osoba(id);
alter table igrac add foreign key (klub) references klub(id);
alter table korisnik add foreign key (osoba) references osoba(id);
alter table klub add foreign key (glavni_trener) references trener(id);
alter table utakmica add foreign key (klub_1) references klub(id);
alter table utakmica add foreign key (klub_2) references klub(id);
alter table kladionica add foreign key (korisnik) references korisnik(id);
alter table kladionica add foreign key (utakmica) references utakmica(id);
alter table nagradna_igra add foreign key (korisnik) references korisnik(id);
alter table ulaznica add foreign key (korisnik) references korisnik(id);
alter table ulaznica add foreign key (utakmica) references utakmica(id);

