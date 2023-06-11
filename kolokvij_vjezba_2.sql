#c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 <C:\Users\xyz\Documents\GitHub\ERA_sql\kolokvij_vjezba_2.sql

drop database if exists kolokvij_vjezba_2;
create database kolokvij_vjezba_2;
use kolokvij_vjezba_2;

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno bit,
    majica varchar(40) not null,
    decko int
);
create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno bit not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstrovertno bit not null,
    prviputa datetime,
    svekar int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

alter table cura add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table prijatelj add foreign key (svekar) references svekar(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

#1
insert into decko (asocijalno) values 
(1),(1),(0);
insert into zarucnica (bojakose,lipa,indiferentno) values 
('zelena',8.7,1),('plava',13.2,1),('ljubicasta',12.5,0);
insert into decko_zarucnica (decko,zarucnica) values 
(1,1),(2,2),(3,3);
insert into cura(haljina,drugiput,majica) values 
('crvena','2015-09-03','Jai oliva'),('bež','2015-08-08','SAint sInner'),('siva','2012-03-03','OK');
insert into neprijatelj(haljina,modelnaocala,kuna,cura) values
('Zelena','Ray Bann',399.2,1),('Ljubicasta','Lenon',23.3,2),('Glava','Crvene s plaže',33.2,3);

#2
#update prijatelj set treciputa='2020-04-30';

#3
delete from brat where ogrlica!=14;

#4 
select suknja from cura where drugiputa is null;

#5
select a.novcica,f.neprijatelj,e.haljina
from zarucnica a 
inner join decko_zarucnica b on a.sifra=b.zarucnica
inner join decko c on b.decko=c.sifra
inner join cura d on c.sifra=d.decko
inner join neprijatelj e on d.sifra=e.cura
inner join brat f on e.sifra=f.neprijatelj
where d.drugiputa not null and c.vesta like '%ba%';

#6
select a.vesta, a.asocijalno
from decko a
left join decko_zarucnica b on a.sifra=b.decko;

#33 minute
