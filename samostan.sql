#c:\xampp\mysql\bin\mysql -uroot <C:\Users\FILIP\OneDrive\Documents\DBeaver_files\Samostan\samostan.sql

drop database if exists samostan;
create database samostan;
use samostan;

create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(20),
    nadredeni int
);

create table posao(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    opis varchar(1000)
);

create table posao_svecenik(
    posao int,
    svecenik int,
    datum_pocetka datetime,
    datum_kraja datetime
);

alter table svecenik add foreign key (nadredeni) references svecenik(sifra);
alter table posao_svecenik add foreign key (posao) references posao(sifra);
alter table posao_svecenik add foreign key (svecenik) references svecenik(sifra);

