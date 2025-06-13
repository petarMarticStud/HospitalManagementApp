--Personen
INSERT INTO Person (SVNR, Geburtsdatum, Vorname, Nachname, Postleitzahl, Ort, Straße, Hausnummer) VALUES
 ('1001', '1980-05-15', 'Max', 'Mustermann', '1010', 'Wien', 'Hauptstraße', '1'),
 ('1002', '1975-11-22', 'Anna', 'Musterfrau', '4020', 'Linz', 'Bahngasse', '5'),
 ('1003', '1990-03-08', 'Thomas', 'Bauer', '8010', 'Graz', 'Parkweg', '12'),
 ('1004', '1988-07-30', 'Sarah', 'Schmidt', '5020', 'Salzburg', 'Mozartplatz', '3'),
 ('1005', '1972-09-14', 'Michael', 'Wagner', '6020', 'Innsbruck', 'Maria-Theresien-Straße', '8'),
 ('1006', '1995-12-05', 'Laura', 'Huber', '1010', 'Wien', 'Kärntner Straße', '15'),
 ('1007', '1983-04-18', 'David', 'Pichler', '8010', 'Graz', 'Sporgasse', '7');



--Telefonnummern
INSERT INTO Telefonnummer (SVNR, Geburtsdatum, Telefonnummer) VALUES
('1001', '1980-05-15', '+436641234567'),
('1002', '1975-11-22', '+436648765432'),
('1003', '1990-03-08', '+436641112233'),
('1004', '1988-07-30', '+436643334455'),
('1005', '1972-09-14', '+436647778899'),
('1006', '1995-12-05', '+436646665544'),
('1007', '1983-04-18', '+436649998877');


--Patienten
INSERT INTO Patient (Patientennummer, SVNR, Geburtsdatum) VALUES
('P10001', '1001', '1980-05-15'),
('P10002', '1002', '1975-11-22'),
('P10003', '1004', '1988-07-30'),
('P10004', '1005', '1972-09-14'),
('P10005', '1006', '1995-12-05');


--Angestellten
INSERT INTO Angestellter (Angestelltennummer, SVNR, Geburtsdatum, Kontonummer, Bankleitzahl) VALUES
('A1001', '1003', '1990-03-08', 'AT123456789', '12000'),
('A1002', '1007', '1983-04-18', 'AT987654321', '20111');


--Ärzte
INSERT INTO Arzt (Ärztenummer, Angestelltennummer, Facharztrichtung) VALUES
('D2001', 'A1001', 'Kardiologie'),
('D2002', 'A1002', 'Neurologie');


--Behandlungstypen
INSERT INTO Behandlungstyp (ID, Dauer, AnzahlPflegepersonen, Kosten) VALUES
('BLT-100', 30, 1, 150.00),   -- Bluttest
('RTG-200', 45, 2, 250.00),   -- Röntgen
('US-300', 20, 1, 180.00),    -- Ultraschall
('MRT-400', 60, 2, 450.00),   -- MRT
('EKG-500', 25, 1, 120.00),   -- EKG
('OPH-600', 40, 1, 200.00);   -- Ophthalmologie


--Behandlungen
INSERT INTO Behandlung (BehandlungstypID, Uhrzeit, Raumcodierung) VALUES
('BLT-100', '08:00-08:30', 'R003'),
('RTG-200', '09:00-09:45', 'R002'),
('US-300', '10:00-10:20', 'R001'),
('MRT-400', '11:00-12:00', 'R004'),
('EKG-500', '13:00-13:25', 'R001'),
('OPH-600', '14:00-14:40', 'R005'),
('BLT-100', '15:00-15:30', 'R003'),
('RTG-200', '16:00-16:45', 'R002');


--Orte
INSERT INTO Ort (Raumcodierung, Raumbeschreibung) VALUES
('R001', 'Behandlungsraum 1'),
('R002', 'Röntgenraum'),
('R003', 'Labor'),
('R004', 'MRT Raum'),
('R005', 'Augenklinik'),
('R006', 'Notaufnahme'),
('R007', 'Physiotherapie');




--Vorgemerkt-Bzh
INSERT INTO Vorgemerkt (Patientennummer, BehandlungstypID, Uhrzeit, Ärztenummer, Datum) VALUES
('P10001', 'BLT-100', '08:00-08:30', 'D2001', '2023-11-15'),
('P10002', 'RTG-200', '09:00-09:45', 'D2001', '2023-11-16'),
('P10003', 'MRT-400', '11:00-12:00', 'D2002', '2023-11-17'),
('P10004', 'EKG-500', '13:00-13:25', 'D2001', '2023-11-18'),
('P10005', 'OPH-600', '14:00-14:40', 'D2002', '2023-11-19'),
('P10001', 'US-300', '10:00-10:20', 'D2001', '2023-11-20'),
('P10002', 'BLT-100', '15:00-15:30', 'D2002', '2023-11-21');


--Buchtypen
INSERT INTO Buchtyp (ISBN, Titel, Auflagenjahr) VALUES
 ('978-3-86680-192-9', 'Medizinische Grundlagen', 2020),
 ('978-3-89864-728-1', 'Kardiologie Praxis', 2022),
 ('978-3-437-42591-7', 'Neurologie für Einsteiger', 2021),
 ('978-3-456-85234-1', 'Anatomie Atlas', 2019),
 ('978-3-789-45612-3', 'Pharmakologie Handbuch', 2023);


--Bücher
INSERT INTO Buch (Inventarnummer, ISBN) VALUES
 ('B001', '978-3-86680-192-9'),
 ('B002', '978-3-89864-728-1'),
 ('B003', '978-3-437-42591-7'),
 ('B004', '978-3-456-85234-1'),
 ('B005', '978-3-789-45612-3'),
 ('B006', '978-3-86680-192-9'), -- Zweites Exemplar
 ('B007', '978-3-437-42591-7'); -- Zweites Exemplar

 --Entlehnt-Bzh
INSERT INTO Entlehnt (EntlehnerAngestelltennummer, Inventarnummer, Ausleihdatum, Rückgabedatum) VALUES
('A1001', 'B001', '2023-10-01', '2023-10-15'),
('A1002', 'B003', '2023-10-05', NULL), -- Noch nicht zurückgegeben
('A1001', 'B005', '2023-11-01', NULL), -- Noch nicht zurückgegeben
('A1002', 'B002', '2023-09-15', '2023-09-30');
