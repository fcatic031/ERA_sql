#c:\xampp\mysql\bin\mysql -uroot <C:\Users\FILIP\OneDrive\Documents\DBeaver_files\restoran.sql


drop database if exists restoran;
create database restoran;
use restoran;

create table kategorija(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table jelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    kategorija int,
    sastojci varchar(300)
);

create table pice(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table narudzba(
    pice int,
    jelo int
);

alter table narudzba add foreign key (pice) references pice(sifra);
alter table narudzba add foreign key (jelo) references jelo(sifra);
alter table jelo add foreign key (kategorija) references kategorija(sifra);