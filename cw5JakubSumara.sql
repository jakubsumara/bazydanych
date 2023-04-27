-- Ćw 5
-- Jakub Sumara
-- 410536

DROP DATABASE firma;
DROP SCHEMA ksiegowosc;

-- 1. Utwórz nową bazę danych nazywając ją firma.

CREATE DATABASE firma;

-- 2. Dodaj schemat o nazwie ksiegowosc.

CREATE SCHEMA ksiegowosc;

/* 3. Dodaj cztery tabele: 
pracownicy (id_pracownika, imie, nazwisko, adres, telefon) 
godziny (id_godziny, data, liczba_godzin , id_pracownika) 
pensja (id_pensji, stanowisko, kwota) 
premia (id_premii, rodzaj, kwota) 
wynagrodzenie( id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
przyjmując następujące założenia:
- typy atrybutów mają zostać dobrane tak, aby składowanie danych było optymalne,
- klucz główny dla każdej tabeli oraz klucze obce tam, gdzie występują powiązania pomiędzy 
tabelami,
- opisy/komentarze dla każdej tabeli – użyj polecenia COMMENT */

-- Tabela pracownicy
CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika char(6) primary key, 
	imie nvarchar(30) NOT NULL, 
	nazwisko nvarchar(70) NOT NULL, 
	adres nvarchar(110) NOT NULL, 
	telefon varchar(15) NOT NULL);

-- Komentarz dla tabeli pracownicy
EXEC sp_addextendedproperty 
@name = N'Opis tabeli "pracownicy"', 
@value = N'Tabela zawierająca wszystkich pracowników', 
@level0type = N'Schema', 
@level0name = 'ksiegowosc', 
@level1type = N'Table', 
@level1name = 'pracownicy';

-- Tabela godziny
CREATE TABLE ksiegowosc.godziny(
	id_godziny char(6) primary key, 
	data date NOT NULL, 
	liczba_godzin smallint NOT NULL, 
	id_pracownika char(6) NOT NULL);

-- klucz obcy dla godzin
ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);

-- Komentarz dla tabeli godziny
EXEC sp_addextendedproperty 
@name = N'Opis tabeli "godziny"', 
@value = N'Tabela zawierająca godziny wszystkich pracowników', 
@level0type = N'Schema', 
@level0name = 'ksiegowosc', 
@level1type = N'Table', 
@level1name = 'godziny';

-- Tabela pensja
CREATE TABLE ksiegowosc.pensja(
	id_pensji char(6) primary key, 
	stanowisko nvarchar(50), 
	kwota smallmoney NOT NULL);

-- Komentarz dla tabeli pensja
EXEC sp_addextendedproperty 
@name = N'Opis tabeli "pensja"', 
@value = N'Tabela zawierająca pensje wszystkich pracowników', 
@level0type = N'Schema', 
@level0name = 'ksiegowosc', 
@level1type = N'Table', 
@level1name = 'pensja';

-- Tabela premia
CREATE TABLE ksiegowosc.premia(
	id_premii char(6) primary key, 
	rodzaj nvarchar(50), 
	kwota smallmoney);

-- Komentarz dla tabeli premia
EXEC sp_addextendedproperty 
@name = N'Opis tabeli "premia"', 
@value = N'Tabela zawierająca premie wszystkich pracowników', 
@level0type = N'Schema', 
@level0name = 'ksiegowosc', 
@level1type = N'Table', 
@level1name = 'premia';

-- Tabela wynagrodzenie
CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia char(6) primary key,
	data date NOT NULL,
	id_pracownika char(6),
	id_godziny char(6),
	id_pensji char(6),
	id_premii char(6));

-- klucze obce dla wynagrodzenia
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii);

-- Komentarz dla tabeli wynagrodzenie
EXEC sp_addextendedproperty 
@name = N'Opis tabeli "wynagrodzenie"', 
@value = N'Tabela zawierająca pensje wszystkie wynagrodzenia', 
@level0type = N'Schema', 
@level0name = 'ksiegowosc', 
@level1type = N'Table', 
@level1name = 'wynagrodzenie';

-- 4. Wypełnij każdą tabelę 10. rekordami.

-- pracownicy
INSERT INTO ksiegowosc.pracownicy VALUES('PRA001', 'Katarzyna', 'Nowak', 'ul. Wadowicka 10, 30-001 Kraków', '+48 505 123 456');
INSERT INTO ksiegowosc.pracownicy VALUES('PRA002', 'Jan', 'Kowalski', 'ul. Łobzowska 5, 30-005 Kraków', '+48 501 987 654');
INSERT INTO ksiegowosc.pracownicy VALUES('PRA003', 'Joanna', 'Wojciechowska', 'ul. Karmelicka 20, 30-001 Kraków', '+48 509 111 222');
INSERT INTO ksiegowosc.pracownicy VALUES('PRA004', 'Michał', 'Zieliński', 'ul. Szlak 77, 31-153 Kraków', '+48 503 444 555');
INSERT INTO ksiegowosc.pracownicy VALUES('PRA005', 'Marta', 'Piotrowska', 'ul. Piłsudskiego 12, 31-109 Kraków', '+48 502 222 333');
INSERT INTO ksiegowosc.pracownicy VALUES('PRA006', 'Adam', 'Mazur', 'ul. św. Gertrudy 8, 31-049 Kraków', '+48 506 999 888');
INSERT INTO ksiegowosc.pracownicy VALUES('PRA007', 'Anna', 'Górka', 'ul. Sarego 7, 31-047 Kraków', '+48 508 555 777');
INSERT INTO ksiegowosc.pracownicy VALUES('PRA008', 'Kamil', 'Wójcik', 'ul. Piękna 22, 31-001 Kraków', '+48 509 333 222');
INSERT INTO ksiegowosc.pracownicy VALUES('PRA009', 'Ewa', 'Lewandowska', 'ul. św. Tomasza 30, 31-014 Kraków', '+48 501 444 555');
INSERT INTO ksiegowosc.pracownicy VALUES('PRA010', 'Paweł', 'Sobczak', 'ul. Wielicka 72, 30-552 Kraków', '+48 502 777 444');

SELECT * FROM ksiegowosc.pracownicy;

-- godziny
INSERT INTO ksiegowosc.godziny VALUES('GOD001', '2023-04-15', 100, 'PRA001');
INSERT INTO ksiegowosc.godziny VALUES('GOD002', '2023-04-15', 180, 'PRA002');
INSERT INTO ksiegowosc.godziny VALUES('GOD003', '2023-04-15', 190, 'PRA003');
INSERT INTO ksiegowosc.godziny VALUES('GOD004', '2023-04-15', 170, 'PRA004');
INSERT INTO ksiegowosc.godziny VALUES('GOD005', '2023-04-15', 160, 'PRA005');
INSERT INTO ksiegowosc.godziny VALUES('GOD006', '2023-04-15', 180, 'PRA006');
INSERT INTO ksiegowosc.godziny VALUES('GOD007', '2023-04-15', 170, 'PRA007');
INSERT INTO ksiegowosc.godziny VALUES('GOD008', '2023-04-15', 190, 'PRA008');
INSERT INTO ksiegowosc.godziny VALUES('GOD009', '2023-04-15', 100, 'PRA009');
INSERT INTO ksiegowosc.godziny VALUES('GOD010', '2023-04-15', 160, 'PRA010');

SELECT * FROM ksiegowosc.godziny;

-- pensja
INSERT INTO ksiegowosc.pensja VALUES('PEN001', 'prezes', 8000);
INSERT INTO ksiegowosc.pensja VALUES('PEN002', 'dyrektor', 6000);
INSERT INTO ksiegowosc.pensja VALUES('PEN003', 'kierownik', 5000);
INSERT INTO ksiegowosc.pensja VALUES('PEN004', 'kierownik', 4000);
INSERT INTO ksiegowosc.pensja VALUES('PEN005', 'asystent', 1100);
INSERT INTO ksiegowosc.pensja VALUES('PEN006', 'księgowy', 3500);
INSERT INTO ksiegowosc.pensja VALUES('PEN007', 'pracownik fizyczny', 2500);
INSERT INTO ksiegowosc.pensja VALUES('PEN008', 'sekretarka', 2800);
INSERT INTO ksiegowosc.pensja VALUES('PEN009', 'specjalista ds. marketingu', 4500);
INSERT INTO ksiegowosc.pensja VALUES('PEN010', 'kierownik', 1000);

SELECT * FROM ksiegowosc.pensja;

-- premia
INSERT INTO ksiegowosc.premia VALUES('PRE001', NULL, NULL);
INSERT INTO ksiegowosc.premia VALUES('PRE002', 'świąteczna', 500);
INSERT INTO ksiegowosc.premia VALUES('PRE003', 'wakacyjna', 300);
INSERT INTO ksiegowosc.premia VALUES('PRE004', NULL, NULL);
INSERT INTO ksiegowosc.premia VALUES('PRE005', 'nagroda za wyniki', 800);
INSERT INTO ksiegowosc.premia VALUES('PRE006', NULL, NULL);
INSERT INTO ksiegowosc.premia VALUES('PRE007', 'premia za nadgodziny', 100);
INSERT INTO ksiegowosc.premia VALUES('PRE008', NULL, NULL);
INSERT INTO ksiegowosc.premia VALUES('PRE009', NULL, NULL);
INSERT INTO ksiegowosc.premia VALUES('PRE010', 'premia za roczny staż pracy', 500);

SELECT * FROM ksiegowosc.premia;

-- wynagrodzenie
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN001', '2023-04-15', 'PRA001', 'GOD001', 'PEN001', 'PRE001');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN002', '2023-04-15', 'PRA002', 'GOD002', 'PEN002', 'PRE002');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN003', '2023-04-15', 'PRA003', 'GOD003', 'PEN003', 'PRE003');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN004', '2023-04-15', 'PRA004', 'GOD004', 'PEN004', 'PRE004');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN005', '2023-04-15', 'PRA005', 'GOD005', 'PEN005', 'PRE005');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN006', '2023-04-15', 'PRA006', 'GOD006', 'PEN006', 'PRE006');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN007', '2023-04-15', 'PRA007', 'GOD007', 'PEN007', 'PRE007');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN008', '2023-04-15', 'PRA008', 'GOD008', 'PEN008', 'PRE008');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN009', '2023-04-15', 'PRA009', 'GOD009', 'PEN009', 'PRE009');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('WYN010', '2023-04-15', 'PRA010', 'GOD010', 'PEN010', 'PRE010');

SELECT * FROM ksiegowosc.wynagrodzenie;

--6. Wykonaj następujące zapytania: 
--a) Wyświetl tylko id pracownika oraz jego nazwisko.
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--b) Wyświetl id pracowników, których płaca jest większa niż 1000.
SELECT pracownicy.id_pracownika
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji
WHERE kwota > 1000;

--c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000. 
SELECT prac.id_pracownika
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.premia pre
ON wyn.id_premii = pre.id_premii
JOIN ksiegowosc.pensja pen
ON wyn.id_pensji = pen.id_pensji
WHERE pre.kwota is NULL AND pen.kwota > 2000;

--d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’. 
SELECT * FROM ksiegowosc.pracownicy 
WHERE imie LIKE 'J%';

--e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
SELECT * FROM ksiegowosc.pracownicy 
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

--f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie. 
SELECT prac.imie, prac.nazwisko,
nadgodziny = godz.liczba_godzin - 160
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.godziny godz
ON wyn.id_godziny = godz.id_godziny;

--g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 PLN.
SELECT imie, nazwisko FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji
WHERE pensja.kwota >= 1500 AND pensja.kwota <= 3000;

--h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT imie, nazwisko FROM ksiegowosc.pracownicy
JOIN ksiegowosc.godziny
ON pracownicy.id_pracownika = godziny.id_pracownika
JOIN ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc.premia
ON wynagrodzenie.id_premii = premia.id_premii
WHERE (godziny.liczba_godzin > 160) AND premia.kwota is NULL;


--i) Uszereguj pracowników według pensji.
SELECT imie, nazwisko, kwota FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie
ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji
ORDER BY pensja.kwota;

--j) Uszereguj pracowników według pensji i premii malejąco.
SELECT prac.imie, prac.nazwisko, pen.kwota,
pensja_i_premia = pen.kwota + pre.kwota
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON prac.id_pracownika = wyn.id_pracownika
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii
ORDER BY pen.kwota+pre.kwota DESC;

--k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.
SELECT p.stanowisko, COUNT(*) as liczba_pracownikow
FROM ksiegowosc.pensja p
GROUP BY p.stanowisko;

--l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).
SELECT
stanowisko = 'kierownik',
AVG(kwota) AS średnia_pensji, 
MIN(kwota) AS minimalna_pensja, 
MAX(kwota) AS maksymalna_pensja
FROM ksiegowosc.pensja
WHERE pensja.stanowisko = 'kierownik';

--m) Policz sumę wszystkich wynagrodzeń.
SELECT SUM(pen.kwota + pre.kwota)
FROM ksiegowosc.wynagrodzenie wyn
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii;

--n) Policz sumę wynagrodzeń w ramach danego stanowiska.
SELECT pen.stanowisko, 
SUM(pen.kwota + pre.kwota) AS Suma_wynagrodzeń
FROM ksiegowosc.pensja pen
JOIN ksiegowosc.wynagrodzenie wyn
ON wyn.id_pensji = pen.id_pensji
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii
GROUP BY pen.stanowisko;

--o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
SELECT pen.stanowisko, 
COUNT(pre.kwota) AS ilość_premii
FROM ksiegowosc.pensja pen
JOIN ksiegowosc.wynagrodzenie wyn
ON pen.id_pensji = wyn.id_pensji
JOIN ksiegowosc.premia pre
ON pre.id_premii = wyn.id_premii
GROUP BY pen.stanowisko;

--p) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł
DELETE prac 
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wyn
ON wyn.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.pensja pen
ON pen.id_pensji = wyn.id_pensji
WHERE pen.kwota < 1200;

