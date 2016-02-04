-- use Affär;
-- drop database Affär;

-- Skapa kategorier -----------------------------------------------------------
insert into Kategori (Namn) VALUES('Byxor');
insert into Kategori (Namn) VALUES('Tröjor');
insert into Kategori (Namn) VALUES('Mössor');


-- Skapa Produkter ------------------------------------------------------------
-- Byxor --
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(1, 'Superbyxan', 'Blå', 32, 'Nudie', 800);
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(1, 'Superbyxan', 'Blå', 30, 'Nudie', 800);
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(1, 'Mjukisbyxan', 'Gul', 30, 'Lejsy', 400);
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(1, 'Mjukisbyxan', 'Blå', 32, 'Lejsy', 400);

-- Tröjor --
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(2, 'Supertröjan', 'Blå', 34, 'Nudie', 400);
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(2, 'Supertröjan', 'Blå', 30, 'Nudie', 400);
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(2, 'Mjukiströjan', 'Gul', 34, 'Lejsy', 300);
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(2, 'Mjukiströjan', 'Blå', 34, 'Lejsy', 300);

-- Mössor --
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(3, 'Batmanhjälmen', 'Svart', 59, 'Bruce Wayne Inc', 20000);
insert into Produkt (KategoriID, Namn, Färg, Storlek, Märke, Pris) VALUES(3, 'Tomteluvan', 'Röd', 59, 'Nordpolen Inc', 500);

-- Skapa Lager ----------------------------------------------------------------
insert into Lager (ProduktID, Antal) VALUES(1, 10);
insert into Lager (ProduktID, Antal) VALUES(2, 10);
insert into Lager (ProduktID, Antal) VALUES(3, 10);
insert into Lager (ProduktID, Antal) VALUES(4, 10);
insert into Lager (ProduktID, Antal) VALUES(5, 10);
insert into Lager (ProduktID, Antal) VALUES(6, 10);
insert into Lager (ProduktID, Antal) VALUES(7, 10);
insert into Lager (ProduktID, Antal) VALUES(8, 10);
insert into Lager (ProduktID, Antal) VALUES(9, 10);
insert into Lager (ProduktID, Antal) VALUES(10, 10);

-- Skapa Kund -----------------------------------------------------------------
insert into Kund (Förnamn, Efternamn, Ort, Adress) Values('Adam', 'Adamsson', 'Stockholm', 'Storgatan 1');
insert into Kund (Förnamn, Efternamn, Ort, Adress) Values('Bertil', 'Bertilsson', 'Stockholm', 'Storgatan 2');
insert into Kund (Förnamn, Efternamn, Ort, Adress) Values('Cesar', 'Cesarsson', 'Fylke', 'Lilla gropen 1');
insert into Kund (Förnamn, Efternamn, Ort, Adress) Values('Bat', 'Man', 'Gotham', 'Batmangrottan 1');

-- Skapa Beställningar ----------------------------------------------------------------
insert into Beställning (KundID, Datum) VALUES(1, '2015-01-01');
insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(1, 3, 1);
insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(1, 6, 1);

insert into Beställning (KundID, Datum) VALUES(2, '2015-02-01');
insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(2, 4, 5);
insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(2, 8, 9);

insert into Beställning (KundID, Datum) VALUES(3, '2015-03-01');
insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(3, 10, 1);

insert into Beställning (KundID, Datum) VALUES(4, '2015-04-01');
insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(4, 1, 1);
insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(4, 5, 1);
insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(4, 9, 1);

insert into Beställning (KundID, Datum) VALUES(1, '2015-05-01');
insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(5, 4, 1);



