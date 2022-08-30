Naredbe za kreiranje tabela

Use master;
go
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE  name = 'Knjizara')
DROP DATABASE Knjizara;
go
create database Knjizara
go
use Knjizara
go

CREATE TABLE VrsteProizvoda(
ProizvodiID int primary key,
KnjigeID  int NOT NULL,
SkolskiPriborID int NOT NULL,
KancelariskiMaterijalID  int NOT NULL,
GiftProgramID int NOT NULL,
CONSTRAINT fk_vrsteproizvoda
FOREIGN KEY (proizvodiid) REFERENCES porudzbina (sviproizvodiid));

CREATE TABLE Knjige(
KnjigaID int primary key,
PisacID nvarchar(30) NOT NULL,
IzdavacID nvarchar(35) NOT NULL,
Naziv nvarchar(60),
Zanr nvarchar(30) NOT NULL,
Cena int,
Stanje nchar(15) NOT NULL,
CONSTRAINT fk_knjige_vrsteproizvoda
FOREIGN KEY (knjigaid) REFERENCES vrsteproizvoda (knjigeid));

CREATE TABLE SkolskiPribor(
PriborID int primary key,
Naziv nvarchar(50),
Dizajn nvarchar(50),
Cena int,
Stanje nchar(15) NOT NULL,
CONSTRAINT fk_skolskipribor_vrsteproizvoda
FOREIGN KEY (priborid) REFERENCES vrsteproizvoda (skolskipriborid));


CREATE TABLE KancelarijskiMaterijal(
KancelarijaID int primary key,
Naziv nvarchar(50),
Dizajn nvarchar(50),
Cena int,
Stanje nchar(15) NOT NULL,
CONSTRAINT fk_kancelarijskimaterijal_vrsteproizvoda
FOREIGN KEY (kancelarijaid) REFERENCES vrsteproizvoda (kancelarijskimaterijalid));

CREATE TABLE GiftProgram(
GiftID int primary key,
Naziv nvarchar(50),
Dizajn nvarchar(50),
Cena int,
Stanje nchar(15) NOT NULL,
CONSTRAINT fk_giftprogram_vrsteproizvoda
FOREIGN KEY (giftid) REFERENCES vrsteproizvoda (giftprogramid));

CREATE TABLE Cena(
CenaPorudzbineID int primary key,
Porudzbina int,
CenaKnjigaID int,
CenaPriboraID int,
CenaKancelarijeID int,
CenaGiftaID int);

CREATE TABLE Stanje(
PorudzbinaID int primary key,
StanjeID int,
CONSTRAINT fk_stanje_porudzbina
FOREIGN KEY (porudzbinaid) REFERENCES porudzbina (sviproizvodiid));

CREATE TABLE Porudzbina(
PorudzbinaID int primary key,
SviProizvodiID int,
PotrosacID nvarchar(30) NOT NULL,
KorpaID int,
Datum date NOT NULL,
CONSTRAINT fk_porudzbina_stanje
FOREIGN KEY (porudzbinaid) REFERENCES stanje (stanjeid));


CREATE TABLE Potrosac(
PotrosacID nvarchar(30) primary key,
Ime nchar(15) NOT NULL,
Prezime nchar(15) NOT NULL,
Mesto nvarchar(30) NOT NULL,
Adresa nvarchar(50) NOT NULL,
CONSTRAINT fk_potrosac_porudzbina
FOREIGN KEY (potrosacid) REFERENCES porudzbina (potrosacid));

Naredbe za umetanje vrednosti u tabele

Insert into vrsteproizvoda values(k00001,sp0002,km0003,gp0004),

Insert into knjige values (k00100,'Gijom Muso','Vulkan izdavastvo','Zivot je roman','roman',790,'Na stanju'),
(k00101,'Zoran Predin','Vulkan izdavastvo','Glavom kroz zid','roman',850,'Na stanju'),
(k00102,'Dragan Velikic','Vulkan izdavasvo','Astragan','roman',720,'Na stanju'),
(k00103,'Miroslav Antic','Laguna','Garavi sokak','poezija',720,'Na stanju'),
(k00104,'Miroslav Aleksic','Arhipelag','Arapski kaprico','poezija',550,'Na stanju'),
(k00105,'Suada Malkoc Kovacevic','Kreativna radionica Balkan','Pjesme zavicajne','poezija',300,'Na stanju'),
(k00106,'Grupa autora','Prometej','Jezik oko nas','recnik',1100,'Na stanju'),
(k00107,'Herman Melvil','Laguna','Mobi Dik','knjizevnost',930,'Nema na stanju'),
(k00108,'Peter Handke','Laguna','Nesreca bez zelja','drama',460,'Na stanju'),
(k00109,'Jelena Bacic Alimpic','Laguna','Neki drugi zivot','drama',750,'Na stanju');


Insert into skolskipribor values (335945,'SveskaA4','linije plava',115,'Na stanju'),
(305489,'SveskaA4','kocke plava',115,'Na stanju'),
(361105,'SveskaA4','linije roza',115,'Na stanju'),
(298767,'SveskaA4','kocke roza',115,'Na stanju'),
(290030,'SveskaA4','linije crna',115,'Na stanju'),
(301466,'SveskaA4','kocke crna',115,'Na stanju'),
(456721,'SveskaA5','linije cvece',65,'Na stanju'),                       
(825631,'SveskaA5','kocke auto',65,'Na stanju'),
(148569,'Grafitna olovka','HB',45,'Na stanju'),
(115445,'Grafitna olovka','B',50,'Na stanju'),
(562214,'Hemijska olovka','plava',60,'Na stanju'),
(515414,'Hemijska olovka','crvena',70,'Nema na stanju'),
(452525,'Gumica za brisanje','Stabilo crna',50,'Na stanju'),
(866461,'Rezac','Staedtler metalni',85,'Na stanju'),
(253620,'Korektor','Stabilo cetkica',120,'Na stanju');

Insert into kancelarijskimaterijal values (136541,'Registrator',0,140,'Na stanju'),
(156684,'Registrator','set-6kom',250,'Na stanju'),
(236541,'Registrator',0,140,'Na stanju'),
(514645,'Heftalica',0,600,'Na stanju'),
(846963,'Registrator','sa povezom',170,'Na stanju'),
(634681,'Fascikla','zuta',120,'Na stanju'),
(514688,'Fascikla','crvena',120,'Na stanju'),
(646882,'Ading rolna','57mm',25,'Na stanju'),                                     
(916341,'Ading rolna','70mm',45,'Nema na stanju'),
(651567,'Usluge fotokopiranja','greys scale',10,'Na stanju'),
(614682,'Toner','crni',1300, 'Na stanju'),
(614682,'Toner','color',1700, 'Na stanju');

Insert into giftprogram values (785796,'Ram za slike','zlatni',400,'Na stanju'),
(156684,'Ram za slike','drveni',250,'Na stanju'),
(157784,'Foto album','veliki',700,'Na stanju'),
(156684,'Foto album','mali',800,'Na stanju'),
(256684,'Solja','zelena',300,'Na stanju'),
(854684,'Solja','crvena',300,'Nema na stanju'),
(458725,'Covece ne ljuti se',0,400,'Na stanju'),
(469841,'Kisobran','na sklapanje',550,'Na stanju'),
(986377,'Kisobran','sa drskom',650,'Na stanju'),
(567489,'Usluzno pakovanje poklona',0,50,'Na stanju');

Insert into cena values(k00100, 790)
(k00101, 850),
(k00102, 720),
(k00103, 720),
(k00104, 550),
(k00105, 300),
(k00106, 1100),
(k00107, 930),
(k00108, 460),
(k00109, 750),

(335945, 115),
(305489, 115),
(361105, 115),
(298767, 115),
(290030, 115),
(301466, 115),
(456721, 65),
(825631, 65),
(148569, 45),
(115445, 50),
(562214, 60),
(515414, 70),
(452525, 50),
(866461, 85),
(253620, 120),

(136541, 140),
(156684, 250),
(236541, 140),
(514645, 600),
(846963, 170),
(634681, 120),
(514688, 120),
(646882, 25),
(916341, 45),
(651567, 10),
(614682, 1300),
(483435, 1700),

(785796, 400),
(157784, 250),
(156684, 700),
(256684, 300),
(854684, 300),
(458725, 400),
(469841, 550),
(986377, 650),
(567489, 50);

Insert into stanje values(k00100, 'Na stanju'),
(k00101, 'Na stanju'),
(k00102, 'Na stanju'),
(k00103, 'Na stanju'),
(k00104, 'Na stanju'),
(k00105, 'Na stanju'),
(k00106, 'Na stanju'),
(k00107, 'Nema na stanju'),
(k00108, 'Na stanju'),
(k00109, 'Na stanju'),

(335945, 'Na stanju'),
(305489, 'Na stanju'),
(361105, 'Na stanju'),
(298767, 'Na stanju'),
(290030, 'Na stanju'),
(301466, 'Na stanju'),
(456721, 'Na stanju'),
(825631, 'Na stanju'),
(148569, 'Na stanju'),
(115445, 'Na stanju'),
(562214, 'Na stanju'),
(515414, 'Nema na stanju'),
(452525, 'Na stanju'),
(866461, 'Na stanju'),
(253620, 'Na stanju'),

(136541, 'Na stanju'),
(156684, 'Na stanju'),
(236541, 'Na stanju'),
(514645, 'Na stanju'),
(846963, 'Na stanju'),
(634681, 'Na stanju'),
(514688, 'Na stanju'),
(646882, 'Na stanju'),
(916341, 'Nema na stanju'),
(651567, 'Na stanju'),
(614682, 'Na stanju'),
(483435, 'Na stanju'),

(785796, 'Na stanju'),
(157784, 'Na stanju'),
(156684, 'Na stanju'),
(256684, 'Na stanju'),
(854684, 'Nema na stanju'),
(458725, 'Na stanju'),
(469841, 'Na stanju'),
(986377, 'Na stanju'),
(567489, 'Na stanju');

Insert into potrosaci values(101,'Marko','Petrovic','Prvomajska 15','Beograd'),
(102,'Petar','Markovic','Cetinjska 145','Beograd'), 
(103,'Jelena','Nikolic', 'Gandijeva 4','Beograd'),
(104,'Nikola','Pavlovic','Ugrinovacka 53','Beograd'),
(105,'Ana','Savic', 'Novogradska 88','Beograd');


Naredbe za prikazivanje tabela

SELECT * FROM VrsteProizvoda
SELECT * FROM Knjige
SELECT * FROM SkolskiPribor
SELECT * FROM KancelarijskiMaterijal
SELECT * FROM GiftProgram
SELECT * FROM Cena
SELECT * FROM Stanje
SELECT * FROM Porudzbina
SELECT * FROM Potrosac
