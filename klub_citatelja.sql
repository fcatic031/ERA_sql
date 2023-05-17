#c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\Users\xyz\Documents\GitHub\ERA_sql\klub_citatelja.sql

drop database if exists klub_citatelja;
create database klub_citatelja;
use klub_citatelja;

create table clan(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(30),
    email varchar(50),
    datum_upisa datetime 
);

create table knjiga(
    sifra int not null primary key auto_increment,
    naslov varchar(50) not null,
    opis varchar(1000),
    vlasnik int not null,
    autor varchar(50) not null
);

create table izlaganje(
    sifra int not null primary key auto_increment,
    vrijeme_izlaganja datetime,
    knjiga int not null,
    clan int not null
);

alter table knjiga add foreign key (vlasnik) references clan(sifra);
alter table izlaganje add foreign key (knjiga) references knjiga(sifra);
alter table izlaganje add foreign key (clan) references clan(sifra);
#1
insert into clan(ime, prezime,email, datum_upisa) values 
('Siniša','Vuco','sinisavule@gmail.com','2019-07-03 19:33:33 PM');
#2
insert into clan(ime, prezime,email, datum_upisa) values 
('Đuka', 'Čaić','sjevernitok332@hotmail.com',null);
#3
insert into clan(ime, prezime,email, datum_upisa) values 
('Seve','Severina','seve22@seve.hr','2020-03-24 18:45:22 PM');

insert into knjiga(naslov,vlasnik,autor) values
('Povratak kralja',3,'J. R. R. Tolkien');

insert into knjiga(naslov,vlasnik,autor) values
('Prstenova družina',2,'J. R. R. Tolkien'); 

insert into knjiga(naslov,vlasnik,autor) values
('Dvije kule',1,'J. R. R. Tolkien'); 

insert into izlaganje(vrijeme_izlaganja,knjiga,clan) values
(null,1,2);

insert into izlaganje(vrijeme_izlaganja,knjiga,clan) values
(null,2,1);

insert into izlaganje(vrijeme_izlaganja,knjiga,clan) values
(null,3,3);
