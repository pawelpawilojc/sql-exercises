-- -- 1. Utwórz nową bazę danych i odwzoruj poniższy schemat. Klucze główne oznaczone są symbolem klucza, klucze obce symbolem różowego rombu. Jeżeli romb jest zamalowany oznacza to, że dana kolumna nie może być nullem. Klucze główne powinny być autoinkrementowane.


-- 2. Dodaj poniższe ograniczenia:

-- a) tabela Pociąg: wartość domyślna kolumny numer: 123

-- b) tabela Relacja: NumerTrasy musi być dodatni (zmodyfikuj odpowiednio typ danych)

-- c) tabela Zaloga: wartość domyślna kolumny stanowisko: konduktor

CREATE DATABASE IF NOT EXISTS DragonSector;
USE DragonSector;

CREATE TABLE Pociag (
    idPociag INT PRIMARY KEY AUTO_INCREMENT,
    Numer VARCHAR(10) NOT NULL,
    Nazwa VARCHAR(45),
    idRelacja INT
);

CREATE TABLE Relacja (
    idRelacja INT PRIMARY KEY AUTO_INCREMENT,
    Z VARCHAR(45) NOT NULL,
    Do VARCHAR(45) NOT NULL,
    NumerTrasy INT
);

CREATE TABLE Zaloga (
    idZaloga INT PRIMARY KEY AUTO_INCREMENT,
    Imie VARCHAR(45),
    Nazwisko VARCHAR(45),
    Stanowisko VARCHAR(45)
);

CREATE TABLE PociagZaloga (
    idPociagZaloga INT PRIMARY KEY AUTO_INCREMENT,
    idPociag INT NOT NULL,
    idZaloga INT NOT NULL,
    idRelacja INT NOT NULL,
    FOREIGN KEY (idPociag) REFERENCES Pociag(idPociag),
    FOREIGN KEY (idZaloga) REFERENCES Zaloga(idZaloga),
    FOREIGN KEY (idRelacja) REFERENCES Relacja(idRelacja)
);

ALTER TABLE Pociag
MODIFY Numer VARCHAR(10) DEFAULT '123' NOT NULL;

ALTER TABLE Pociag
ADD CONSTRAINT FOREIGN KEY (idRelacja) REFERENCES Relacja(idRelacja);

ALTER TABLE Relacja
MODIFY NumerTrasy INT UNSIGNED;

ALTER TABLE Relacja
ADD CONSTRAINT CHK_Positive CHECK (NumerTrasy>0);

ALTER TABLE Zaloga
MODIFY Stanowisko VARCHAR(45) DEFAULT 'konduktor';