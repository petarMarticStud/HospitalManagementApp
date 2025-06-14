


-- 1. Person
CREATE TABLE Person (
    SVNR VARCHAR(4) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    Vorname VARCHAR(50) NOT NULL,
    Nachname VARCHAR(50) NOT NULL,
    Postleitzahl VARCHAR(10) NOT NULL,
    Ort VARCHAR(50) NOT NULL,
    Straße VARCHAR(50) NOT NULL,
    Hausnummer VARCHAR(10) NOT NULL,
    PRIMARY KEY (SVNR)
);

-- 2. Telefonnummer
CREATE TABLE Telefonnummer (
    SVNR VARCHAR(4) NOT NULL,
    Telefonnummer VARCHAR(20) NOT NULL,
    PRIMARY KEY (SVNR, Telefonnummer),
    FOREIGN KEY (SVNR) REFERENCES Person(SVNR)
);

-- 3. Patient
CREATE TABLE Patient (
    Patientennummer VARCHAR(10) NOT NULL,
    SVNR VARCHAR(4) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    PRIMARY KEY (Patientennummer),
    FOREIGN KEY (SVNR) REFERENCES Person(SVNR)
);

-- 4. Bank
CREATE TABLE Bank (
    Bankleitzahl VARCHAR(10) NOT NULL,
    Bankname VARCHAR(50) NOT NULL,
    PRIMARY KEY (Bankleitzahl)
);

-- 5. Angestellter
CREATE TABLE Angestellter (
    Angestelltennummer VARCHAR(10) NOT NULL,
    SVNR VARCHAR(4) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    Kontonummer VARCHAR(20) NOT NULL,
    Bankleitzahl VARCHAR(10) NOT NULL,
    PRIMARY KEY (Angestelltennummer),
    FOREIGN KEY (SVNR) REFERENCES Person(SVNR),
    FOREIGN KEY (Bankleitzahl) REFERENCES Bank(Bankleitzahl)
);

-- 6. Arzt
CREATE TABLE Arzt (
    Arztnummer VARCHAR(10) NOT NULL,
    Angestelltennummer VARCHAR(10) NOT NULL,
    Facharztrichtung VARCHAR(50) NOT NULL,
    PRIMARY KEY (Arztnummer),
    FOREIGN KEY (Angestelltennummer) REFERENCES Angestellter(Angestelltennummer)
);

-- 7. Sachbearbeiter
CREATE TABLE Sachbearbeiter (
    Angestelltennummer VARCHAR(4) NOT NULL,
    Einstellungsdatum DATE NOT NULL,
    PRIMARY KEY (Angestelltennummer),
    FOREIGN KEY (Angestelltennummer) REFERENCES Angestellter(Angestelltennummer)
);

-- 8. Behandlungstyp
CREATE TABLE Behandlungstyp (
    ID VARCHAR(8) NOT NULL,
    Dauer INT NOT NULL, -- in Minuten
    AnzahlPflegePersonen INT NOT NULL,
    Kosten DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (ID)
);

-- 9. Ort
CREATE TABLE Ort (
    Raumcodierung VARCHAR(7) NOT NULL,
    Raumbeschreibung VARCHAR(100) NOT NULL,
    PRIMARY KEY (Raumcodierung)
);

-- 10. Behandlung
CREATE TABLE Behandlung (
    BehandlungstypID VARCHAR(8) NOT NULL,
    Uhrzeit VARCHAR(11) NOT NULL, -- Format: "HH:MM-HH:MM"
    Raumcodierung VARCHAR(7) NOT NULL,
    PRIMARY KEY (BehandlungstypID, Uhrzeit),
    FOREIGN KEY (BehandlungstypID) REFERENCES Behandlungstyp(ID),
    FOREIGN KEY (Raumcodierung) REFERENCES Ort(Raumcodierung)
);

-- 11. Vorgemerkt
CREATE TABLE Vorgemerkt (
    Patientennummer VARCHAR(10) NOT NULL,
    BehandlungID VARCHAR(8) NOT NULL,
    Uhrzeit VARCHAR(11) NOT NULL,
    Arztnummer VARCHAR(10) NOT NULL,
    Datum DATE NOT NULL,
    PRIMARY KEY (Patientennummer, BehandlungID, Uhrzeit, Arztnummer),
    FOREIGN KEY (Patientennummer) REFERENCES Patient(Patientennummer),
    FOREIGN KEY (BehandlungID, Uhrzeit) REFERENCES Behandlung(BehandlungstypID, Uhrzeit),
    FOREIGN KEY (Arztnummer) REFERENCES Arzt(Arztnummer)
);

-- 12. Koordiniert
CREATE TABLE Koordiniert (
BehandlungID VARCHAR(8) NOT NULL,
Angestelltennummer VARCHAR(4) NOT NULL,
Uhrzeit VARCHAR(11) NOT NULL,
PRIMARY KEY (Angestelltennummer, BehandlungID, Uhrzeit),
FOREIGN KEY (Angestelltennummer) REFERENCES Sachbearbeiter(Angestelltennummer),
FOREIGN KEY (BehandlungID, Uhrzeit) REFERENCES Behandlung(BehandlungstypID,Uhrzeit)
);

-- 13. Buchtyp
CREATE TABLE Buchtyp (
    ISBN VARCHAR(13) NOT NULL,
    Titel VARCHAR(100) NOT NULL,
    Auflagenjahr INT NOT NULL,
    PRIMARY KEY (ISBN)
);

-- 14. Voraussetzung
CREATE TABLE Voraussetzung (
    ISBN_vorausgesetzt VARCHAR(13) NOT NULL,
    ISBN_benötigt VARCHAR(13) NOT NULL,
    PRIMARY KEY (ISBN_vorausgesetzt, ISBN_benötigt),
    FOREIGN KEY (ISBN_vorausgesetzt) REFERENCES Buchtyp(ISBN),
    FOREIGN KEY (ISBN_benötigt) REFERENCES Buchtyp(ISBN),
    CHECK (ISBN_vorausgesetzt <> ISBN_benötigt) -- Vermeidung zyklischer Abhängigkeiten
);

-- 15. Buch
CREATE TABLE Buch (
    Inventarnummer VARCHAR(20) NOT NULL,
    ISBN VARCHAR(13) NOT NULL,
    PRIMARY KEY (Inventarnummer),
    FOREIGN KEY (ISBN) REFERENCES Buchtyp(ISBN)
);

-- 16. Entlehnt
CREATE TABLE Entlehnt (
    Angestelltennummer VARCHAR(10) NOT NULL,
    Inventarnummer VARCHAR(20) NOT NULL,
    Ausleihdatum DATE NOT NULL,
    Rückgabedatum DATE,
    PRIMARY KEY (Angestelltennummer, Inventarnummer, Ausleihdatum),
    FOREIGN KEY (Angestelltennummer) REFERENCES Angestellter(Angestelltennummer),
    FOREIGN KEY (Inventarnummer) REFERENCES Buch(Inventarnummer),
    CHECK (Rückgabedatum IS NULL OR Rückgabedatum >= Ausleihdatum)
);
