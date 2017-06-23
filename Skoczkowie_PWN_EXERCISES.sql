#MS1
create database myDB;
#MS2
drop database myDB;
#MS3
create database Skoczkowie;
use Skoczkowie;
#MS4
CREATE TABLE skocznie (
    id_skoczni integer,
    miasto text,
    kraj_s text,
    nazwa text,
    k integer,
    sedz integer
);
describe skocznie;
#MS5
CREATE TABLE trenerzy (
    kraj text,
    imie_t text,
    nazwisko_t text,
    data_ur_t date
);
describe trenerzy;
#MS6
CREATE TABLE zawodnicy (
    id_skoczka integer,
    imie text,
    nazwisko text,
    kraj character(3),
    data_ur date,
    wzrost integer,
    waga integer
);
describe zawodnicy;
#MS7
CREATE TABLE zawody (
    id_zawodow integer,
    id_skoczni integer,
    data date
);
describe zawody;
#MS8
CREATE TABLE kibice (
    imie_k TEXT,
    nazwisko_k TEXT,
    data_ur_k DATE,
    kraj TEXT,
    wzrost INTEGER
);
describe kibice;
#MS9
CREATE TABLE skladki (
    id_skladki INTEGER PRIMARY KEY,
    kwota_skladki NUMERIC(11 , 2 ) NOT NULL CHECK (kwota_skladki > 0),
    data_skladki DATE,
    id_kibica INTEGER REFERENCES kibice
);
alter table kibice drop column kraj;
alter table kibice add column pesel text;
alter table kibice add column kraj varchar(3);
describe kibice;
#MS10
INSERT INTO skocznie VALUES (1, 'Zakopane', 'POL', 'Wielka Krokiew', 120, 134);
INSERT INTO skocznie VALUES (2, 'Garmisch-Partenkirchen', 'GER', 'Wielka Skocznia Olimpijska', 115, 125);
INSERT INTO skocznie VALUES (4, 'Oberstdorf', 'GER', 'Skocznia Heiniego Klopfera', 185, 211);
INSERT INTO skocznie VALUES (3, 'Oberstdorf', 'GER', 'Grosse Schattenberg', 120, 134);
INSERT INTO skocznie VALUES (5, 'Willingen', 'GER', 'Grosse Muhlenkopfschanze', 130, 145);
INSERT INTO skocznie VALUES (6, 'Kuopio', 'FIN', 'Puijo', 120, 131);
INSERT INTO skocznie VALUES (7, 'Lahti', 'FIN', 'Salpausselka', 116, 128);
INSERT INTO skocznie VALUES (8, 'Trondheim', 'NOR', 'Granasen', 120, 132);
select * from skocznie;
#MS11
INSERT INTO trenerzy VALUES ('AUT', 'Alexander', 'Pointner', NULL);
INSERT INTO trenerzy VALUES ('FIN', 'Tommi', 'Nikunen', NULL);
INSERT INTO trenerzy VALUES ('NOR', 'Mika', 'Kojonkoski', '1963-04-19');
INSERT INTO trenerzy VALUES ('POL', 'Heinz', 'Kuttin', '1971-01-05');
INSERT INTO trenerzy VALUES ('GER', 'Wolfang', 'Steiert', '1963-04-19');
INSERT INTO trenerzy VALUES ('JPN', 'Hirokazu', 'Yagi', NULL);
select * from trenerzy;
#MS12
INSERT INTO zawodnicy VALUES (2, 'Marcin', 'BACHLEDA', 'POL', '1982-09-04', 166, 56);
INSERT INTO zawodnicy VALUES (3, 'Robert', 'MATEJA', 'POL', '1974-10-05', 180, 63);
INSERT INTO zawodnicy VALUES (4, 'Alexander', 'HERR', 'GER', '1978-10-04', 173, 65);
INSERT INTO zawodnicy VALUES (5, 'Stephan', 'HOCKE', 'GER', '1983-10-20', 178, 59);
INSERT INTO zawodnicy VALUES (6, 'Martin', 'SCHMITT', 'GER', '1978-01-29', 181, 64);
INSERT INTO zawodnicy VALUES (7, 'Michael', 'UHRMANN', 'GER', '1978-09-09', 184, 64);
INSERT INTO zawodnicy VALUES (8, 'Georg', 'SPAETH', 'GER', '1981-02-24', 187, 68);
INSERT INTO zawodnicy VALUES (9, 'Matti', 'HAUTAMAEKI', 'FIN', '1981-07-14', 174, 57);
INSERT INTO zawodnicy VALUES (10, 'Tami', 'KIURU', 'FIN', '1976-09-13', 183, 59);
INSERT INTO zawodnicy VALUES (11, 'Janne', 'AHONEN', 'FIN', '1977-05-11', 184, 67);
INSERT INTO zawodnicy VALUES (12, 'Martin', 'HOELLWARTH', 'AUT', '1974-04-13', 182, 67);
INSERT INTO zawodnicy VALUES (13, 'Thomas', 'MORGENSTERN', 'AUT', '1986-10-30', 174, 57);
INSERT INTO zawodnicy VALUES (15, 'Tommy', 'INGEBRIGTSEN', 'NOR', '1977-08-08', 179, 56);
INSERT INTO zawodnicy VALUES (16, 'Bjoern-Einar', 'ROMOEREN', 'NOR', '1981-04-01', 182, 63);
INSERT INTO zawodnicy VALUES (17, 'Roar', 'LJOEKELSOEY', 'NOR', '1976-05-31', 175, 62);
INSERT INTO zawodnicy VALUES (14, 'Alan', 'ALBORN', 'USA', '1980-12-13', 177, 57);
INSERT INTO zawodnicy VALUES (1, 'Adam', 'MAŁYSZ', 'POL', '1977-12-03', 169, 60);
select * from zawodnicy;
#MS13
INSERT INTO zawody VALUES (1, 1, '2017-01-23');
INSERT INTO zawody VALUES (2, 7, '2016-11-15');
INSERT INTO zawody VALUES (3, 3, '2016-12-26');
select * from zawody;
#MS14
INSERT INTO kibice (imie_k, nazwisko_k, kraj) VALUES ('Jan', 'Kowalski', 'POL');
INSERT INTO kibice (imie_k, nazwisko_k, wzrost) VALUES ('John', 'Smith', 172);
INSERT INTO kibice (imie_k, nazwisko_k, data_ur_k) VALUES ('Anna', 'Zawadzka', '1977-12-23');
#MS15
DELETE FROM kibice WHERE imie_k='John' and nazwisko_k='Smith';
#MS16
UPDATE kibice SET data_ur_k='1974-12-08' WHERE imie_k='Jan' and nazwisko_k='Kowalski';
#MS17
UPDATE kibice, kibice SET imie_k='Krzysztof' FROM trenerzy WHERE trenerzy.nazwisko_t='Kuttin' and trenerzy.kraj=kibice.kraj;
#MS18
UPDATE zawodnicy SET wzrost=wzrost+2;
UPDATE zawodnicy SET wzrost=wzrost-2;
#MS19
SELECT * FROM zawodnicy;
SELECT * FROM trenerzy;
#MS20
SELECT kraj,imie,nazwisko FROM zawodnicy;
#MS21
SELECT *,wzrost*1.46 AS narty FROM zawodnicy;
#MS22
SELECT *,(waga/pow((wzrost/100),2)) AS bmi FROM zawodnicy;
#MS23
SELECT imie,nazwisko,date_format(data_ur,'%d.%m.%Yr.') AS data_ur FROM zawodnicy;
SELECT imie,nazwisko,concat(dayofyear(data_ur),date_format(data_ur,' dnia %Y roku')) AS data_ur FROM zawodnicy;
#MS24
SELECT imie,nazwisko,round(waga/pow((wzrost/100),2),2) AS bmi FROM zawodnicy;
SELECT imie,nazwisko,round(waga/pow((wzrost/100),2),3) AS bmi FROM zawodnicy;
select *from zawodnicy;
#MS25
SELECT imie,nazwisko,round((wzrost*1.46),0) AS narty FROM zawodnicy;
#MS26
SELECT imie, concat(upper(substring(nazwisko,1,1)),lower(substring(nazwisko,2,length(nazwisko)))) AS nazwisko FROM zawodnicy;
#MS27
SELECT concat(imie, ' ', nazwisko, ' (', kraj, ')') AS zawodnik FROM zawodnicy;
#MS28
SELECT *,(year(curdate())-year(data_ur)) AS wiek FROM zawodnicy;
SELECT *,(to_days(curdate())- to_days(data_ur)) AS wiek FROM zawodnicy;
#MS29
SELECT *,(waga/pow((wzrost/100.0),2))>=20 AS bmi_ok FROM zawodnicy;
#MS30
SELECT *,data_ur_t IS NOT NULL AS data_znana FROM trenerzy;
#MS31
SELECT *,CASE WHEN waga/(wzrost/100.0)^2>=20 THEN 'waga w normie' ELSE 'zawodnik za lekki' END AS bmi FROM zawodnicy;
#MS32
SELECT imie_t,nazwisko_t, COALESCE(date_format(data_ur_t,'%Y-%M-%D'),'brak danych') AS data_ur_t FROM trenerzy;
#MS33
SELECT * FROM zawodnicy WHERE kraj='POL';
#MS34
SELECT * FROM zawodnicy WHERE kraj='GER' OR kraj='AUT';
#MS35
SELECT * FROM zawodnicy WHERE waga/(wzrost/100.0)^2<20;
#MS36
SELECT * FROM zawodnicy WHERE (date_sub(current_date(), interval year(data_ur) year) > 30); 
#MS37
SELECT * FROM trenerzy WHERE data_ur_t IS NULL;
#MS38
SELECT * FROM zawodnicy WHERE ((month(data_ur) > 11) OR (month(data_ur) < 3)); 
#MS39
SELECT * FROM zawodnicy ORDER BY wzrost;
#MS40
SELECT * FROM zawodnicy ORDER BY wzrost, nazwisko;
#MS41
SELECT * FROM zawodnicy ORDER BY imie, nazwisko;
#MS42
SELECT * FROM zawodnicy ORDER BY kraj;
#MS43
SELECT * FROM zawodnicy ORDER BY data_ur DESC;
#MS44
SELECT concat(imie, ' ', nazwisko, ' (', kraj, ')') AS zawodnik FROM zawodnicy ORDER BY nazwisko;
#MS45
SELECT * FROM trenerzy ORDER BY data_ur_t;
#MS46
SELECT * FROM trenerzy ORDER BY data_ur_t is not null, data_ur_t;
#MS47
SELECT imie,nazwisko, (waga/pow(wzrost/100.0, 2)) AS bmi FROM zawodnicy ORDER BY bmi;
#MS48
SELECT imie,nazwisko, (waga/pow(wzrost/100.0, 2)) >= 20 AS bmi_prawidlowe FROM zawodnicy ORDER BY bmi_prawidlowe;
#MS49
SELECT imie,nazwisko, (waga/pow(wzrost/100.0, 2)) >= 20 AS bmi_prawidlowe FROM zawodnicy ORDER BY bmi_prawidlowe, nazwisko;
#MS50
SELECT * FROM zawodnicy ORDER BY rand();
#MS51
SELECT * FROM zawodnicy ORDER BY wzrost DESC LIMIT 1 OFFSET 1;
#MS52
SELECT imie,nazwisko,kraj FROM zawodnicy UNION SELECT imie_t,nazwisko_t,kraj FROM trenerzy;
#MS53
SELECT imie, nazwisko, kraj, 'zawodnik' as rola FROM zawodnicy UNION SELECT imie_t, nazwisko_t, kraj, 'trener' FROM trenerzy;
#MS54
select * from zawodnicy, trenerzy where zawodnicy.kraj = trenerzy.kraj;
#MS55
select * from zawody,skocznie where zawody.id_skoczni = skocznie.id_skoczni;
#MS56
select * from zawodnicy natural join trenerzy;
#MS57
select * from zawodnicy natural left join trenerzy;
#MS58
select imie_t, nazwisko_t, imie, nazwisko from zawodnicy natural right join trenerzy;
#MS59
select trenerzy.* from zawodnicy natural right join trenerzy where id_skoczka is null;
#MS60
select distinct trenerzy.* from trenerzy natural join zawodnicy;
#MS61
select zawodnicy.* from zawodnicy natural left join trenerzy where imie_t is null;
#MS62
select * from zawody natural join skocznie;
#MS63
select * from zawodnicy join skocznie on (kraj=kraj_s) natural join zawody order by kraj, imie, nazwisko;
#MS64
select * from zawodnicy natural join trenerzy where zawodnicy.data_ur < trenerzy.data_ur_t;
select * from zawodnicy natural join trenerzy where zawodnicy.data_ur > trenerzy.data_ur_t;
#MS65
select * from zawodnicy as z1 join zawodnicy as z2 on (z1.kraj = z2.kraj and z1.wzrost>z2.wzrost);
#MS66
select count(*) from zawodnicy group by kraj;
#MS67
select count(*) from zawodnicy;
#MS68
select count(*) from zawodnicy where wzrost>180 group by kraj;
#MS69
select kraj from zawodnicy group by kraj order by avg(wzrost);
#MS70
select kraj, max(wzrost) from zawodnicy group by kraj;
#MS71
select max(wzrost) from zawodnicy;
#MS72
select date_format(data_ur, quarter(data_ur)) as kwartal, count(*) from zawodnicy group by kwartal;
#MS73
select date_format(data_ur, quarter(data_ur)) as kwartal, date_format(data_ur, year(data_ur)) as rok, count(*) from zawodnicy group by rok, kwartal order by rok, kwartal;
#MS74
select round(count(*)/count(distinct kraj),0) from zawodnicy;
#MS75
select kraj, count(*) from zawodnicy where wzrost>180 group by kraj having count(*)>1;
#MS76
select kraj from zawodnicy group by kraj having avg(wzrost)>=180;
#MS77
select * from zawodnicy where wzrost > (select wzrost from zawodnicy where imie='Adam' and nazwisko='MAŁYSZ');
#MS78
select * from zawodnicy where waga > (select waga from zawodnicy where imie='Adam' and nazwisko='MAŁYSZ');
#MS79
select * from zawodnicy where wzrost > (select wzrost from zawodnicy order by waga desc limit 1);
#MS80
select * from zawodnicy where data_ur < (select data_ur_t from trenerzy where imie_t='Heinz' and nazwisko_t='Kuttin');
#MS81
select * from zawodnicy where wzrost = (select wzrost from zawodnicy where imie='Janne' and nazwisko='AHONEN');
#MS82
select * from zawodnicy where wzrost = (select max(wzrost) from zawodnicy);
#MS83
select * from zawodnicy where waga > (select avg(waga) from zawodnicy);
#MS84
select * from zawodnicy z1 where waga > (select avg(waga) from zawodnicy z2 where z2.kraj = 'POL');
#MS85
select * from zawodnicy z1 where waga > (select avg(waga) from zawodnicy z2 where z2.kraj = z1.kraj);
#MS86
select kraj, sum(wzrost>180) from zawodnicy group by kraj;
#MS87
CREATE VIEW zawodnicy_pl as SELECT imie, nazwisko, kraj FROM zawodnicy WHERE kraj = 'POL';
alter view zawodnicy_pl as SELECT imie, nazwisko, data_ur from zawodnicy where kraj = 'POL';
select * from zawodnicy_pl;
#MS88
alter table trenerzy add column liczba_zawodników int;
UPDATE trenerzy SET liczba_zawodników = 2 where imie_t = 'Alexander';
select * from trenerzy;
select * from zawodnicy;
drop trigger trenerzy_trig;
create trigger trenerzy_trig after insert on zawodnicy for each row update trenerzy set liczba_zawodników = liczba_zawodników+1 where kraj = new.kraj;  
INSERT INTO zawodnicy VALUES (20, 'Adi', 'MIKO', 'AUT', '1977-12-03', 169, 60);
select * from trenerzy;
INSERT INTO zawodnicy VALUES (21, 'Miki', 'KRU', 'AUT', '1977-12-03', 169, 60);
select * from trenerzy;