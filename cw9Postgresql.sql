CREATE DATABASE geochronologia;
CREATE SCHEMA geo;

--TABELA EON
CREATE TABLE geo.eon
(
    id_eonu INT NOT NULL PRIMARY KEY,
    nazwa_eonu VARCHAR(10) NOT NULL
);

INSERT INTO geo.eon VALUES(1, 'Fanerozoik');

--TABELA ERA

CREATE TABLE geo.era
(
    id_ery INT NOT NULL PRIMARY KEY,
    id_eonu INT REFERENCES geo.eon(id_eonu),
    nazwa_ery VARCHAR(10) NOT NULL
);

INSERT INTO geo.era VALUES(1, 1, 'Paleozoik');
INSERT INTO geo.era VALUES(2, 1, 'Mezozoik');
INSERT INTO geo.era VALUES(3, 1, 'Kenozoik');

--TABELA OKRES

CREATE TABLE geo.okres
(
    id_okresu INT NOT NULL PRIMARY KEY,
    id_ery INT REFERENCES geo.era(id_ery),
    nazwa_okresu VARCHAR(25) NOT NULL
);

INSERT INTO geo.okres VALUES(1, 1, 'Dewon');
INSERT INTO geo.okres VALUES(2, 1, 'Karbon');
INSERT INTO geo.okres VALUES(3, 1, 'Perm');
INSERT INTO geo.okres VALUES(4, 2, 'Trias');
INSERT INTO geo.okres VALUES(5, 2, 'Jura');
INSERT INTO geo.okres VALUES(6, 2, 'Kreda');
INSERT INTO geo.okres VALUES(7, 3, 'Trzeciorząd-Paleogen');
INSERT INTO geo.okres VALUES(8, 3, 'Trzeciorząd-Neogen');
INSERT INTO geo.okres VALUES(9, 3, 'Czwartorząd');

--TABELA EPOKA
CREATE TABLE geo.epoka
(
    id_epoki INT NOT NULL PRIMARY KEY,
    id_okresu INT REFERENCES geo.okres(id_okresu),
    nazwa_epoki VARCHAR(10) NOT NULL
);

INSERT INTO geo.epoka VALUES(1, 1, 'Dolny');
INSERT INTO geo.epoka VALUES(2, 1, 'Środkowy');
INSERT INTO geo.epoka VALUES(3, 1, 'Górny');
INSERT INTO geo.epoka VALUES(4, 2, 'Dolny');
INSERT INTO geo.epoka VALUES(5, 2, 'Górny');
INSERT INTO geo.epoka VALUES(6, 3, 'Dolny');
INSERT INTO geo.epoka VALUES(7, 3, 'Górny');
INSERT INTO geo.epoka VALUES(8, 4, 'Dolna');
INSERT INTO geo.epoka VALUES(9, 4, 'Środkowa');
INSERT INTO geo.epoka VALUES(10, 4, 'Górna');
INSERT INTO geo.epoka VALUES(11, 5, 'Dolna');
INSERT INTO geo.epoka VALUES(12, 5, 'Środkowa');
INSERT INTO geo.epoka VALUES(13, 5, 'Górna');
INSERT INTO geo.epoka VALUES(14, 6, 'Dolna');
INSERT INTO geo.epoka VALUES(15, 6, 'Górna');
INSERT INTO geo.epoka VALUES(16, 7, 'Paleocen');
INSERT INTO geo.epoka VALUES(17, 7, 'Eocen');
INSERT INTO geo.epoka VALUES(18, 7, 'Oligocen');
INSERT INTO geo.epoka VALUES(19, 8, 'Miocen');
INSERT INTO geo.epoka VALUES(20, 8, 'Pliocen');
INSERT INTO geo.epoka VALUES(21, 9, 'Plejstocen');
INSERT INTO geo.epoka VALUES(22, 9, 'Halocen');

--TABELA PIETRO
CREATE TABLE geo.pietro
(
    id_pietra INTEGER NOT NULL PRIMARY KEY,
    id_epoki INTEGER REFERENCES geo.epoka(id_epoki),
    nazwa_pietra VARCHAR(20) NOT NULL
);

INSERT INTO geo.pietro VALUES (1, 1, 'Lachkow');
INSERT INTO geo.pietro VALUES (2, 1, 'Prag');
INSERT INTO geo.pietro VALUES (3, 1, 'Ems');
INSERT INTO geo.pietro VALUES (4, 2, 'Eifel');
INSERT INTO geo.pietro VALUES (5, 2, 'Zywet');
INSERT INTO geo.pietro VALUES (6, 3, 'Fran');
INSERT INTO geo.pietro VALUES (7, 3, 'Famen');
INSERT INTO geo.pietro VALUES (8, 6, 'Assel');
INSERT INTO geo.pietro VALUES (9, 6, 'Sakmar');
INSERT INTO geo.pietro VALUES (10, 6, 'Artinsk');
INSERT INTO geo.pietro VALUES (11, 6, 'Kangur');
INSERT INTO geo.pietro VALUES (12, 7, 'Ufa');
INSERT INTO geo.pietro VALUES (13, 7, 'Kazan');
INSERT INTO geo.pietro VALUES (14, 7, 'Tatar');
INSERT INTO geo.pietro VALUES (15, 8, 'Ind');
INSERT INTO geo.pietro VALUES (16, 8, 'Olenek');
INSERT INTO geo.pietro VALUES (17, 9, 'Anizyk');
INSERT INTO geo.pietro VALUES (18, 9, 'Ladyn');
INSERT INTO geo.pietro VALUES (19, 10, 'Karnik');
INSERT INTO geo.pietro VALUES (20, 10, 'Noryk');
INSERT INTO geo.pietro VALUES (21, 10, 'Retyk');
INSERT INTO geo.pietro VALUES (22, 11, 'Hetang');
INSERT INTO geo.pietro VALUES (23, 11, 'Synemur');
INSERT INTO geo.pietro VALUES (24, 11, 'Pliensbach');
INSERT INTO geo.pietro VALUES (25, 11, 'Toark');
INSERT INTO geo.pietro VALUES (26, 12, 'Aalen');
INSERT INTO geo.pietro VALUES (27, 12, 'Bajos');
INSERT INTO geo.pietro VALUES (28, 12, 'Baton');
INSERT INTO geo.pietro VALUES (29, 12, 'Kelowej');
INSERT INTO geo.pietro VALUES (30, 13, 'Oksford');
INSERT INTO geo.pietro VALUES (31, 13, 'Kimeryd');
INSERT INTO geo.pietro VALUES (32, 13, 'Tyton');
INSERT INTO geo.pietro VALUES (33, 14, 'Berias');
INSERT INTO geo.pietro VALUES (34, 14, 'Walanzyn');
INSERT INTO geo.pietro VALUES (35, 14, 'Hoteryw');
INSERT INTO geo.pietro VALUES (36, 14, 'Barrem');
INSERT INTO geo.pietro VALUES (37, 14, 'Apt');
INSERT INTO geo.pietro VALUES (38, 14, 'Alb');
INSERT INTO geo.pietro VALUES (39, 15, 'Cenoman');
INSERT INTO geo.pietro VALUES (40, 15, 'Turon');
INSERT INTO geo.pietro VALUES (41, 15, 'Koniak');
INSERT INTO geo.pietro VALUES (42, 15, 'Santon');
INSERT INTO geo.pietro VALUES (43, 15, 'Kampan');
INSERT INTO geo.pietro VALUES (44, 15, 'Mastrycht');
INSERT INTO geo.pietro VALUES (45, 16, 'Dan');
INSERT INTO geo.pietro VALUES (46, 16, 'Zeland');
INSERT INTO geo.pietro VALUES (47, 16, 'Tanet');
INSERT INTO geo.pietro VALUES (48, 17, 'Iprez');
INSERT INTO geo.pietro VALUES (49, 17, 'Lutet');
INSERT INTO geo.pietro VALUES (50, 17, 'Barton');
INSERT INTO geo.pietro VALUES (51, 17, 'Priabon');
INSERT INTO geo.pietro VALUES (52, 18, 'Rupel');
INSERT INTO geo.pietro VALUES (53, 18, 'Szat');
INSERT INTO geo.pietro VALUES (54, 19, 'Akwitan');
INSERT INTO geo.pietro VALUES (55, 19, 'Burdygal');
INSERT INTO geo.pietro VALUES (56, 19, 'Lang');
INSERT INTO geo.pietro VALUES (57, 19, 'Serrawal');
INSERT INTO geo.pietro VALUES (58, 19, 'Torton');
INSERT INTO geo.pietro VALUES (59, 19, 'Mesyn');
INSERT INTO geo.pietro VALUES (60, 20, 'Zankl');
INSERT INTO geo.pietro VALUES (61, 20, 'Piacent');
INSERT INTO geo.pietro VALUES (62, 21, 'Gelas');
INSERT INTO geo.pietro VALUES (63, 21, 'Kalabr');
INSERT INTO geo.pietro VALUES (64, 21, 'Chiban');
INSERT INTO geo.pietro VALUES (65, 21, 'Późny');
INSERT INTO geo.pietro VALUES (66, 22, 'Grenland');
INSERT INTO geo.pietro VALUES (67, 22, 'Northgrip');
INSERT INTO geo.pietro VALUES (68, 22, 'Megalaj');

-- TWORZE TABELE GŁÓWNĄ
CREATE TABLE geo.tabela AS (SELECT * FROM geo.pietro NATURAL JOIN geo.epoka NATURAL
JOIN geo.okres NATURAL JOIN geo.era NATURAL JOIN geo.eon );
SELECT * FROM geo.tabela;

--LICZBY DZIESIEC I MILION

CREATE SCHEMA liczby;

CREATE TABLE liczby.dziesiec(
	wartosc INT NOT NULL
);

INSERT INTO liczby.dziesiec VALUES(0);
INSERT INTO liczby.dziesiec VALUES(1);
INSERT INTO liczby.dziesiec VALUES(2);
INSERT INTO liczby.dziesiec VALUES(3);
INSERT INTO liczby.dziesiec VALUES(4);
INSERT INTO liczby.dziesiec VALUES(5);
INSERT INTO liczby.dziesiec VALUES(6);
INSERT INTO liczby.dziesiec VALUES(7);
INSERT INTO liczby.dziesiec VALUES(8);
INSERT INTO liczby.dziesiec VALUES(9);

SELECT a1.wartosc+10*a2.wartosc+100*a3.wartosc+1000*a4.wartosc+10000*a5.wartosc+100000*a6.wartosc AS liczba
INTO liczby.milion
FROM liczby.dziesiec a1, liczby.dziesiec a2, liczby.dziesiec a3, liczby.dziesiec a4, liczby.dziesiec a5, liczby.dziesiec a6;

SELECT * FROM liczby.milion
ORDER BY liczby.milion.liczba;



--TEST 1
SELECT COUNT(*) FROM liczby.milion INNER JOIN geo.tabela ON (mod(milion.liczba,68)=(geo.tabela.id_pietra));

--TEST 2
SELECT COUNT(*) FROM liczby.milion INNER JOIN  geo.pietro  ON (mod(milion.liczba,68)=geo.pietro.id_pietra) NATURAL JOIN geo.epoka NATURAL JOIN geo.okres NATURAL JOIN geo.era NATURAL JOIN geo.eon;

--TEST 3
SELECT COUNT(*) FROM liczby.milion WHERE mod(milion.liczba,68)= (SELECT id_pietra FROM geo.tabela   WHERE mod(milion.liczba,68)=(id_pietra));

--TEST 4
SELECT COUNT(*) FROM liczby.milion WHERE mod(milion.liczba,68) IN (SELECT geo.pietro.id_pietra FROM geo.pietro NATURAL JOIN geo.epoka NATURAL JOIN geo.okres NATURAL JOIN geo.era NATURAL JOIN geo.eon);

--INDEKSY
CREATE INDEX id_eonu ON geo.eon(id_eonu);
CREATE INDEX id_ery ON geo.era(id_ery);
CREATE INDEX id_epoki ON geo.epoka(id_epoki);
CREATE INDEX id_okresu ON geo.okres(id_okresu);
CREATE INDEX id_pietra ON geo.pietro(id_pietra);
CREATE INDEX liczba ON liczby.milion(liczba);
CREATE INDEX wartosc ON liczby.dziesiec(wartosc);
CREATE INDEX id_pietra ON geo.tabela(id_pietra);

