create database Affär;
use Affär;
-- drop database Affär;

-- CREATE USER 'oscar'@'localhost' IDENTIFIED BY 'password';
-- GRANT ALL ON Affär.* TO 'oscar@localhost';

create table Kategori
(
	KategoriID int not null auto_increment,
    Namn char(20) not null,
    primary key (KategoriID)
);

create table Produkt
(
	ProduktID int not null auto_increment,
    KategoriID int not null,
    Namn char(50) not null,
    Färg char(10) not null,
    Storlek int not null,
    Märke char(50) not null,
    Pris int not null,
    primary key (ProduktID),
    foreign key (KategoriID) REFERENCES Kategori(KategoriID)
);

create table Lager
(
	ProduktID int not null,
    Antal int not null,
    primary key (ProduktID)
);

create table Kund
(
	KundID int not null auto_increment,
    Förnamn varchar(50) not null,
    Efternamn varchar(50) not null,
    Ort varchar(50) not null,
    Adress varchar(50) not null,
    primary key (KundID)
);

create table Beställning
(
	BeställningID int not null auto_increment,
    KundID int,
    Datum date not null,
    primary key (BeställningID),
    foreign key (KundID) REFERENCES Kund(KundID)
);

create table ProduktBeställning
(
	ProduktID int not null,
    BeställningID int not null,
    Antal int not null,
    primary key (ProduktID, BeställningID),
    foreign key (ProduktID) REFERENCES Produkt(ProduktID) ON DELETE CASCADE,
    foreign key (BeställningID) REFERENCES Beställning(BeställningID) ON DELETE CASCADE
);
