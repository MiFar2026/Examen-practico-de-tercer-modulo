DROP DATABASE IF EXISTS HamedanBookEventsDB;
CREATE DATABASE HamedanBookEventsDB;
USE HamedanBookEventsDB;

CREATE TABLE Bookstores (
    BookstoreID INT AUTO_INCREMENT PRIMARY KEY,
    BookstoreName VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    Phone VARCHAR(20),
    OpenHours VARCHAR(50)
);

CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100),
    Nationality VARCHAR(50)
);

CREATE TABLE Events (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    EventTitle VARCHAR(100),
    EventDate DATE,
    EventTime TIME,
    Capacity INT,
    BookstoreID INT,
    AuthorID INT,
    FOREIGN KEY (BookstoreID)
    REFERENCES Bookstores(BookstoreID),
    FOREIGN KEY (AuthorID)
    REFERENCES Authors(AuthorID)
);

CREATE TABLE Participants (
    ParticipantID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Registrations (
    RegistrationID INT AUTO_INCREMENT PRIMARY KEY,
    ParticipantID INT,
    EventID INT,
    RegistrationDate DATE,
    FOREIGN KEY (ParticipantID)
    REFERENCES Participants(ParticipantID),
    FOREIGN KEY (EventID)
    REFERENCES Events(EventID)
);

INSERT INTO Bookstores
(BookstoreName, Address, Phone, OpenHours)
VALUES
('Hamedan BookCity',
'Main Street 15',
'08132511111',
'9Am - 10PM'),

('Farhang Bookstore',
'Shah Avenue',
'08138350911',
'8Am - 9PM'),

('IranZamin Book Store',
'pastor street',
'+98 81 3825 1391',
'9Am - 9PM');

INSERT INTO Authors
(FullName, Nationality)
VALUES
('Marío Pérez','Spanish'),

('Mehri Farhani','Iranian'),

('Ann Mc','American');

INSERT INTO Events
(EventTitle, EventDate, EventTime, Capacity, BookstoreID, AuthorID)
VALUES
('Novel Presentation',
'2026-07-20',
'18:00:00',
60,
1,
1),

('Poetry Reading',
'2026-07-21',
'17:30:00',
40,
2,
2),

('Book Club',
'2026-09-22',
'19:00:00',
30,
3,
3);

INSERT INTO Participants
(FullName, Email, Phone)

VALUES

('Arezoo Sassani',
'arezoo@email.com',
'80506070'),

('Mahdis Khaleghi',
'mahdis@email.com',
'50607080'),

('Arash Azizi',
'arash@email.com',
'90102030'),

('Morid bozorgi',
'morid@email.com',
'40506070'),

('Mina Farhani',
'mina@email.com',
'77777777');

INSERT INTO Registrations
(ParticipantID, EventID, RegistrationDate)

VALUES

(1,1,'2026-07-01'),
(2,1,'2026-07-02'),
(3,2,'2026-07-03'),
(4,3,'2026-07-04'),
(5,2,'2026-07-05');

SELECT * FROM Events;
SELECT * FROM Bookstores;
SELECT * FROM Authors;
SELECT * FROM Participants;

SELECT
Bookstores.BookstoreName,
Events.EventTitle,
Events.EventDate
FROM Bookstores
JOIN Events
ON Bookstores.BookstoreID = Events.BookstoreID;

SELECT
Events.EventTitle,
Authors.FullName
FROM Events
JOIN Authors
ON Events.AuthorID = Authors.AuthorID;

SELECT
Participants.FullName,
Events.EventTitle
FROM Participants
JOIN Registrations
ON Participants.ParticipantID = Registrations.ParticipantID
JOIN Events
ON Registrations.EventID = Events.EventID;
UPDATE Events

SET Capacity = 80
WHERE EventID = 1;
