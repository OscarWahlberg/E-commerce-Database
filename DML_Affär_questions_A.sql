

-- Fråga 1: Lista antalet produkter per kategori. --------------------------------------------
select Kategori.Namn, count(*) AS 'Antal produkter' from Kategori
 inner join Produkt on Kategori.KategoriID = Produkt.KategoriID
 group by Kategori.Namn;

-- Fråga 2: Skapa en kundlista med det totala ordervärdet kunden har -------------------------
-- beställt för. [Kundens för- och efternamn, samt det totala ordervärdet skall visas] 
select Kund.Förnamn, Kund.Efternamn, sum(Produkt.Pris) as 'ordervärde' from Kund
 inner join Beställning on Kund.KundID = Beställning.KundID
 inner join ProduktBeställning on Beställning.BeställningID = ProduktBeställning.BeställningID
 inner join Produkt on ProduktBeställning.ProduktID = Produkt.ProduktID
 group by Kund.Efternamn, Kund.Förnamn;
    
-- Fråga 3: Vilka kunder har köpt blåa byxor i storlek 32 av märket Nudie? -------------------
select Kund.Förnamn, Kund.Efternamn from Kund
 inner join Beställning on Kund.KundID = Beställning.KundID
 inner join ProduktBeställning on Beställning.BeställningID = ProduktBeställning.BeställningID
 inner join Produkt on ProduktBeställning.ProduktID = Produkt.ProduktID
 inner join Kategori on Kategori.KategoriID = Produkt.KategoriID
 where Produkt.KategoriID = (select KategoriID from Kategori where Namn = 'Byxor')
 and Produkt.Färg = 'blå'
 and Produkt.Storlek = 32
 and Produkt.Märke = 'Nudie'
 group by Kund.Efternamn, Kund.Förnamn;
    
-- Fråga 4: Skriv ut en lista på det totala ordervärdet per ort där ordervärdet är större än 1000 kr 
select Kund.Ort, sum(Produkt.Pris) as 'Tot. Ordervärde'from Kund
 inner join Beställning on Kund.KundID = Beställning.KundID
 inner join ProduktBeställning on Beställning.BeställningID = ProduktBeställning.BeställningID
 inner join Produkt on ProduktBeställning.ProduktID = Produkt.ProduktID
 group by Kund.Ort
 having sum(Produkt.Pris) >= 1000;

-- Fråga 5: Vilken månad hade man den största försäljningen? -----------------------------------

select DATE_FORMAT(Beställning.Datum,'%b') as 'Bästa Månaden', sum(Produkt.Pris) as 'Summa' from Beställning
	inner join ProduktBeställning on Beställning.BeställningID = ProduktBeställning.BeställningID
  inner join Produkt on ProduktBeställning.ProduktID = Produkt.ProduktID
  group by DATE_FORMAT(Beställning.Datum,'%b')
  order by sum(Produkt.Pris) desc
  limit 1;

-- LäggTillKundvagn() --------------------------------------------------------------------------

DELIMITER //
create procedure LäggTillKundvagn (IN _KundID int, IN _BeställningID int, IN _ProduktID int)
BEGIN
 DECLARE CONTINUE HANDLER FOR  SQLEXCEPTION
  BEGIN
   ROLLBACK;
   SELECT 'An error has occurred!';
  END;
    
  start transaction;

  if _BeställningID is null then
   begin
    insert into Beställning (KundID, Datum) VALUES (_KundID, current_date()); 
    insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(LAST_INSERT_ID(), _ProduktID, 1);
    update Lager set Antal = Antal - 1
    where ProduktID = _ProduktID;
   end;
  
  elseif exists(select * from ProduktBeställning where BeställningID = _BeställningID and ProduktID = _ProduktID) then
   begin
    update ProduktBeställning set Antal = Antal + 1
    where BeställningID = _BeställningID
    and ProduktID = _ProduktID;
    update Lager set Antal = Antal - 1
    where ProduktID = _ProduktID;
   end;
  else
   begin
    insert into ProduktBeställning (BeställningID, ProduktID, Antal) VALUES(_BeställningID, _ProduktID, 1);
    update Lager set Antal = Antal - 1
    where ProduktID = _ProduktID;
   end;
  end if;
    
  commit;
    
END //
DELIMITER ;

call LäggTillKundvagn(3, 3, 10);

drop procedure LäggTillKundvagn;
delete from Beställning where KundID = 1 and BeställningID = 5;

-- Trigger ----------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------
create table Slutilager
(
  SlutilagerID int not null auto_increment,
  Datum date,
  ProduktID int not null,
  primary key (SlutilagerID)
);

-- drop trigger LagerCheck;

DELIMITER //
CREATE TRIGGER LagerCheck AFTER UPDATE ON Lager
 FOR EACH ROW
 BEGIN
  if NEW.Antal < 1 then
   begin
    insert into Slutilager (Datum, ProduktID) VALUES(current_date(), NEW.ProduktID);
   end;
  end if;
 END //
DELIMITER ;
