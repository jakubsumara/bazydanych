-- Ćw 4
-- Jakub Sumara
-- 410536

-- DROP DATABASE firma;
-- DROP SCHEMA rozliczenia;

-- 1. Utwórz nową bazę danych nazywając ją firma 


CREATE DATABASE firma;

-- 2. Dodaj nowy schemat o nazwie rozliczenia

CREATE SCHEMA rozliczenia;

-- 3. Do schematu rozliczenia dodaj cztery tabele:

-- pracownicy(id_pracownika, imie, nazwisko, adres, telefon)

CREATE TABLE rozliczenia.pracownicy(
	id_pracownika char(6) primary key, 
	imie nvarchar(30) NOT NULL, 
	nazwisko nvarchar(70) NOT NULL, 
	adres nvarchar(110) NOT NULL, 
	telefon varchar(15) NOT NULL);

-- godziny(id_godziny, data, liczba_godzin, id_pracownika)

CREATE TABLE rozliczenia.godziny(
	id_godziny char(6) primary key, 
	data date NOT NULL, 
	liczba_godzin smallint NOT NULL, 
	id_pracownika char(6) NOT NULL);

-- premie(id_premii, rodzaj, kwota)

CREATE TABLE rozliczenia.premie(
	id_premii char(6) primary key, 
	rodzaj nvarchar(50), 
	kwota smallmoney NOT NULL);

-- pensje(id_pensji, stanowisko, kwota, id_premii)

CREATE TABLE rozliczenia.pensje(
	id_pensji char(6) primary key, 
	stanowisko nvarchar(50), 
	kwota smallmoney NOT NULL, 
	id_premii char(6) NOT NULL);


/* wykonując następujące działania:
a) Ustal typy danych tak, aby przetwarzanie i składowanie danych było optymalne.
b) Zastanów się, które pola muszą przyjmować wartość NOT NULL.
c) Ustaw klucz główny dla każdej tabeli (jako część polecenia CREATE TABLE).
d) Zastanów się jakie związki zachodzą pomiędzy tabelami, a następnie dodaj klucze obce
   tam, gdzie występują (wykorzystaj polecenie ALTER TABLE - po uprzednim stworzeniu 
   tabeli). */

-- klucz obcy dla godzin

ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

-- klucz obcy dla pensji

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

-- 4. Wypełnij każdą tabelę 10. rekordami.

-- pracownicy

INSERT INTO rozliczenia.pracownicy VALUES('PRA001', 'Katarzyna', 'Nowak', 'ul. Wadowicka 10, 30-001 Kraków', '+48 505 123 456');
INSERT INTO rozliczenia.pracownicy VALUES('PRA002', 'Jan', 'Kowalski', 'ul. Łobzowska 5, 30-005 Kraków', '+48 501 987 654');
INSERT INTO rozliczenia.pracownicy VALUES('PRA003', 'Joanna', 'Wojciechowska', 'ul. Karmelicka 20, 30-001 Kraków', '+48 509 111 222');
INSERT INTO rozliczenia.pracownicy VALUES('PRA004', 'Michał', 'Zieliński', 'ul. Szlak 77, 31-153 Kraków', '+48 503 444 555');
INSERT INTO rozliczenia.pracownicy VALUES('PRA005', 'Marta', 'Piotrowska', 'ul. Piłsudskiego 12, 31-109 Kraków', '+48 502 222 333');
INSERT INTO rozliczenia.pracownicy VALUES('PRA006', 'Adam', 'Mazur', 'ul. św. Gertrudy 8, 31-049 Kraków', '+48 506 999 888');
INSERT INTO rozliczenia.pracownicy VALUES('PRA007', 'Anna', 'Górka', 'ul. Sarego 7, 31-047 Kraków', '+48 508 555 777');
INSERT INTO rozliczenia.pracownicy VALUES('PRA008', 'Kamil', 'Wójcik', 'ul. Piękna 22, 31-001 Kraków', '+48 509 333 222');
INSERT INTO rozliczenia.pracownicy VALUES('PRA009', 'Ewa', 'Lewandowska', 'ul. św. Tomasza 30, 31-014 Kraków', '+48 501 444 555');
INSERT INTO rozliczenia.pracownicy VALUES('PRA010', 'Paweł', 'Sobczak', 'ul. Wielicka 72, 30-552 Kraków', '+48 502 777 444');

SELECT * FROM rozliczenia.pracownicy;

-- godziny

INSERT INTO rozliczenia.godziny VALUES('GOD001', '2023-04-15', 10, 'PRA001');
INSERT INTO rozliczenia.godziny VALUES('GOD002', '2023-04-15', 8, 'PRA002');
INSERT INTO rozliczenia.godziny VALUES('GOD003', '2023-04-15', 9, 'PRA003');
INSERT INTO rozliczenia.godziny VALUES('GOD004', '2023-04-15', 7, 'PRA004');
INSERT INTO rozliczenia.godziny VALUES('GOD005', '2023-04-15', 6, 'PRA005');
INSERT INTO rozliczenia.godziny VALUES('GOD006', '2023-04-15', 8, 'PRA006');
INSERT INTO rozliczenia.godziny VALUES('GOD007', '2023-04-15', 7, 'PRA007');
INSERT INTO rozliczenia.godziny VALUES('GOD008', '2023-04-15', 9, 'PRA008');
INSERT INTO rozliczenia.godziny VALUES('GOD009', '2023-04-15', 10, 'PRA009');
INSERT INTO rozliczenia.godziny VALUES('GOD010', '2023-04-15', 6, 'PRA010');

SELECT * FROM rozliczenia.godziny;

-- premie

INSERT INTO rozliczenia.premie VALUES('PRE001', 'motywacyjna', 200);
INSERT INTO rozliczenia.premie VALUES('PRE002', 'świąteczna', 500);
INSERT INTO rozliczenia.premie VALUES('PRE003', 'wakacyjna', 300);
INSERT INTO rozliczenia.premie VALUES('PRE004', 'roczna', 1000);
INSERT INTO rozliczenia.premie VALUES('PRE005', 'nagroda za wyniki', 800);
INSERT INTO rozliczenia.premie VALUES('PRE006', 'premia urlopowa', 400);
INSERT INTO rozliczenia.premie VALUES('PRE007', 'premia za godziny nadliczbowe', 100);
INSERT INTO rozliczenia.premie VALUES('PRE008', 'premia za wyjątkowe osiągnięcia', 1200);
INSERT INTO rozliczenia.premie VALUES('PRE009', 'premia za zrealizowanie projektu', 700);
INSERT INTO rozliczenia.premie VALUES('PRE010', 'premia za roczny staż pracy', 500);

SELECT * FROM rozliczenia.premie;

-- pensje

INSERT INTO rozliczenia.pensje VALUES('PEN001', 'prezes', 8000, 'PRE001');
INSERT INTO rozliczenia.pensje VALUES('PEN002', 'dyrektor', 6000, 'PRE002');
INSERT INTO rozliczenia.pensje VALUES('PEN003', 'kierownik', 5000, 'PRE003');
INSERT INTO rozliczenia.pensje VALUES('PEN004', 'specjalista', 4000, 'PRE004');
INSERT INTO rozliczenia.pensje VALUES('PEN005', 'asystent', 3000, 'PRE005');
INSERT INTO rozliczenia.pensje VALUES('PEN006', 'księgowy', 3500, 'PRE006');
INSERT INTO rozliczenia.pensje VALUES('PEN007', 'pracownik fizyczny', 2500, 'PRE007');
INSERT INTO rozliczenia.pensje VALUES('PEN008', 'sekretarka', 2800, 'PRE008');
INSERT INTO rozliczenia.pensje VALUES('PEN009', 'specjalista ds. marketingu', 4500, 'PRE009');
INSERT INTO rozliczenia.pensje VALUES('PEN010', 'pracownik biurowy', 2800, 'PRE010');

SELECT * FROM rozliczenia.pensje;

-- 5. Za pomocą zapytania SQL wyświetl nazwiska pracowników i ich adresy.

SELECT nazwisko, adres FROM rozliczenia.pracownicy;

/* 6. Napisz zapytanie, które przekonwertuje datę w tabeli godziny tak, aby wyświetlana była
      informacja jaki to dzień tygodnia i jaki miesiąc (funkcja DATEPART x2). */

SET LANGUAGE 'Polish';
SELECT DATEPART ( WEEKDAY , data ) as 'dzień ', DATEPART ( MONTH , data ) as 'miesiąc' FROM rozliczenia.godziny;


/* 7. W tabeli pensje zmień nazwę atrybutu kwota na kwota brutto oraz dodaj nowy o nazwie
      kwota_netto. Oblicz kwotę netto i zaktualizuj wartości w tabeli. */

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje ADD kwota_netto AS (pensje.kwota_brutto * 0.81);

SELECT * FROM rozliczenia.pensje;

-- usuwanie kolumny kwota_netto
-- ALTER TABLE rozliczenia.pensje DROP COLUMN kwota_netto;