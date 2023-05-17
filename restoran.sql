#c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\Users\xyz\Documents\GitHub\ERA_sql\restoran.sql


drop database if exists restoran;
create database restoran;
use restoran;

create table kategorija(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table jelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    kategorija int,
    sastojci varchar(300)
);

create table pice(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table narudzba(
    pice int,
    jelo int,
    stol int
);

alter table narudzba add foreign key (pice) references pice(sifra);
alter table narudzba add foreign key (jelo) references jelo(sifra);
alter table jelo add foreign key (kategorija) references kategorija(sifra);

insert into kategorija(naziv) values 
('RIBA'),('PASTA'),('PIZZA');

insert into jelo(naziv,kategorija,sastojci) values
('Bolonjez', 2, 'Tjestenina, mljeveno meso, paradajz'),
('Margarita', 3, 'Tijesto, sir, paradajz'),
('Šaran na žaru', 1 , 'Šaran, kruh, limun, krumpir');

insert into pice(naziv) values 
('Tomislav'), ('Osječko'), ('Crno vino'),('Bijelo vino'),('Mineralna voda');

insert into narudzba(pice,jelo,stol) values
(5,2,12),(3,2,12),(1,1,13),(2,2,7);