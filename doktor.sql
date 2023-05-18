#c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\Users\xyz\Documents\GitHub\ERA_sql\doktor.sql


drop database if exists doktor;
create database doktor;
use doktor;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(20),
    email varchar(50),
    spol_musko boolean,
    spol_zensko boolean
);

create table doktor(
    sifra int not null primary key auto_increment,
    osoba int not null,
    odjel int,
    opis_posla varchar(500),
    specijalnost varchar(30)
);
create table odjel(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table pacijent(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table med_sestra(
    sifra int not null primary key auto_increment,
    osoba int not null,
    odjel int,
    opis_posla varchar(50)
);

create table posjeta(
    sifra int not null primary key auto_increment,
    termin datetime,
    pacijent int not null,
    doktor int not null,
    med_sestra int not null
);

alter table doktor add foreign key (osoba) references osoba(sifra);
alter table med_sestra add foreign key (osoba) references osoba(sifra);
alter table pacijent add foreign key (osoba) references osoba(sifra);
alter table med_sestra add foreign key (odjel) references odjel(sifra);
alter table doktor add foreign key (odjel) references odjel(sifra);
alter table posjeta add foreign key (pacijent) references pacijent(sifra);
alter table posjeta add foreign key (doktor) references doktor(sifra);
alter table posjeta add foreign key (med_sestra) references med_sestra(sifra);

insert into osoba(ime,prezime,spol_musko,spol_zensko) values
('Jozo','Trović',true,false),('Slavka','Trgić',false,true),('Stanko','Vlakić',true,false),
('Siniša','Vujco',true,false),('Gladan','Parz',true,false),('Golubica','Litva',false,true),
('Slatko','Kiselić',true,false),('Vlatka','Pokosić',false,true),('Stijenka','Davorko',false,true);

insert into odjel(naziv) values
('Dermatologija'),('Abdominalna kirurgija'),('Epidemologija');

insert into doktor(osoba,odjel) values
(1,1),(2,2),(3,3);

insert into med_sestra(osoba,odjel) values
(4,1),(5,2),(6,3);

insert into pacijent(osoba) values
(7),(8),(9);

insert into posjeta(termin,pacijent,doktor,med_sestra) values
('2022-06-07 17:43:22 PM', 1,1,1),('2023-01-02 03:03:53 AM',2,2,2),('2023-05-04 11:02:07 AM',3,3,3);