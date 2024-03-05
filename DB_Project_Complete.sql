CREATE DATABASE MUSIC_EVENT;
USE MUSIC_EVENT;

-- CREATING THE TABLES

CREATE TABLE ORGANIZER(
	Organizer_ID VARCHAR(20) NOT NULL,
    Organizer_FirstName VARCHAR(25) NOT NULL, 
    Organizer_LastName VARCHAR(20) NOT NULL,
    Organizer_ContactNo VARCHAR(10) NOT NULL,
    Organizer_Email VARCHAR(20),
	PRIMARY KEY(Organizer_ID)
);

CREATE TABLE BAND(
	Band_ID VARCHAR(10) NOT NULL,
    Band_Type VARCHAR(50), 
    Band_Leader VARCHAR(20) NOT NULL,
    Band_Name VARCHAR(10) NOT NULL,
    Organizer_ID VARCHAR(20) NOT NULL,
	PRIMARY KEY(Band_ID),
    CONSTRAINT FK_OGN foreign key(Organizer_ID) REFERENCES ORGANIZER(Organizer_ID)
);

CREATE TABLE MUSIC_EVENT(
	Event_Name VARCHAR(50) NOT NULL,
	Event_ID VARCHAR(10) NOT NULL,
    Event_Date DATE NOT NULL,
    Event_Venue VARCHAR(25) NOT NULL,
    Event_Time TIME,
    Event_Capacity INT NOT NULL,
    Event_Status VARCHAR(40),
    Band_ID VARCHAR(10) NOT NULL,
    PRIMARY KEY(Event_ID),
    CONSTRAINT FK_BND foreign key(Band_ID) REFERENCES BAND(Band_ID)
);

CREATE TABLE VENUE(
	Venue_Owner VARCHAR(20) NOT NULL,
    Venue_Name VARCHAR(25) NOT NULL,
    Venue_Capacity INT NOT NULL,
    Venue_Street VARCHAR(20) NOT NULL,
    Venue_City VARCHAR(20) NOT NULL,
    Venue_State VARCHAR(20) NOT NULL,
    Event_ID VARCHAR(10),
    PRIMARY KEY(Venue_Owner, Venue_Name),
    CONSTRAINT FK_VEVT foreign key(Event_ID) REFERENCES MUSIC_EVENT(Event_ID)
);

CREATE TABLE VENUE_CONTACT(
	Venue_Owner VARCHAR(20) NOT NULL,
    Venue_Name VARCHAR(25) NOT NULL, 
    Venue_ContactNo VARCHAR(10) NOT NULL,
    PRIMARY KEY(Venue_Owner, Venue_Name),
    CONSTRAINT FK_VEN foreign key(Venue_Owner,Venue_Name) REFERENCES VENUE(Venue_Owner,Venue_Name)
);

CREATE TABLE BAND_MEMBER(
    BMember_FirstName VARCHAR(25) NOT NULL, 
    BMember_LastName VARCHAR(20) NOT NULL,
    BMember_ContactNo VARCHAR(10) NOT NULL,
    BMember_Role VARCHAR(20) NOT NULL,
    BMember_Email VARCHAR(20),
    BMember_BirthDay Date,
    Band_ID VARCHAR(10) NOT NULL,
	PRIMARY KEY(BMember_FirstName, BMember_LastName, BMember_Role),
    CONSTRAINT FK_BAND foreign key(Band_ID) REFERENCES BAND(Band_ID)
);

CREATE TABLE Band_Contact(
	Band_ID VARCHAR(10) NOT NULL,
    Band_Contact_No VARCHAR(11),
    CONSTRAINT FK_BD foreign key(Band_ID) REFERENCES BAND(Band_ID)
);

CREATE TABLE ARTIST(
	Artist_ID VARCHAR(10) NOT NULL,
	Artist_FirstName VARCHAR(25) NOT NULL, 
    Artist_LastName VARCHAR(20) NOT NULL,
    Artist_Email VARCHAR(20),
    Artist_Band_ID VARCHAR(10),
    Artist_Contact_No VARCHAR(11) NOT NULL,
    Organizer_ID VARCHAR(20) NOT NULL,
	PRIMARY KEY(Artist_FirstName, Artist_LastName),
    CONSTRAINT FK_ORG foreign key(Organizer_ID) REFERENCES ORGANIZER(Organizer_ID)
);

CREATE TABLE PARTICIPANT(
	Participant_ID VARCHAR(20) NOT NULL,	
    Participant_FirstName VARCHAR(25) NOT NULL, 
    Participant_LastName VARCHAR(20) NOT NULL,
    Participant_Contact_No VARCHAR(11) NOT NULL,
    Participant_Email VARCHAR(20),
    Event_ID VARCHAR(10) NOT NULL,
	PRIMARY KEY(Participant_ID),
    CONSTRAINT FK_EVT foreign key(Event_ID) REFERENCES MUSIC_EVENT(Event_ID)
);

CREATE TABLE TICKET(
	Ticket_Type VARCHAR(25) NOT NULL, 
    Ticket_Price INT NOT NULL,
    Ticket_Purchase_Date DATE NOT NULL,
    Sold_Ticket INT NOT NULL,
    Days_Until_Event INT,
    Participant_ID VARCHAR(20) NOT NULL,
	PRIMARY KEY(Ticket_Type, Participant_ID),
    CONSTRAINT FK_PRT foreign key(Participant_ID) REFERENCES PARTICIPANT(Participant_ID)
);

-- ADDING THE DATA TO TABLES

-- Adding data to ORGANIZER Table

INSERT INTO `music_event`.`ORGANIZER` (`Organizer_ID`, `Organizer_FirstName`, `Organizer_LastName`, `Organizer_ContactNo`, `Organizer_Email`) VALUES ('O1001', 'Akila', 'Weeraman', '0713213213', 'akila@gmail.com');
INSERT INTO `music_event`.`ORGANIZER` (`Organizer_ID`, `Organizer_FirstName`, `Organizer_LastName`, `Organizer_ContactNo`, `Organizer_Email`) VALUES ('O1002', 'Shakila', 'Tishan', '0714324324', 'shakila@gmail.com');
INSERT INTO `music_event`.`ORGANIZER` (`Organizer_ID`, `Organizer_FirstName`, `Organizer_LastName`, `Organizer_ContactNo`, `Organizer_Email`) VALUES ('O1003', 'Ishan', 'Silva', '0715435435', 'ishan@gmail.com');
INSERT INTO `music_event`.`ORGANIZER` (`Organizer_ID`, `Organizer_FirstName`, `Organizer_LastName`, `Organizer_ContactNo`, `Organizer_Email`) VALUES ('O1004', 'Prasad', 'Wickramasinghe', '0716546546', 'prasad@gmail.com');
INSERT INTO `music_event`.`ORGANIZER` (`Organizer_ID`, `Organizer_FirstName`, `Organizer_LastName`, `Organizer_ContactNo`, `Organizer_Email`) VALUES ('O1005', 'Ashan', 'Gamage', '0717657657', 'ashan@gmail.com');
INSERT INTO `music_event`.`ORGANIZER` (`Organizer_ID`, `Organizer_FirstName`, `Organizer_LastName`, `Organizer_ContactNo`, `Organizer_Email`) VALUES ('O1006', 'Dasun', 'Herath', '0718768768', 'dasun@gmail.com');

-- Adding data to BAND Table

INSERT INTO `music_event`.`BAND` (`Band_ID`, `Band_Type`, `Band_Leader`, `Band_Name`, `Organizer_ID`) VALUES ('B0001', 'Acoustic', 'Surith', 'News', 'O1003');
INSERT INTO `music_event`.`BAND` (`Band_ID`, `Band_Type`, `Band_Leader`, `Band_Name`, `Organizer_ID`) VALUES ('B0002', 'Electric', 'Hashen', 'Flashback', 'O1001');
INSERT INTO `music_event`.`BAND` (`Band_ID`, `Band_Type`, `Band_Leader`, `Band_Name`, `Organizer_ID`) VALUES ('B0003', 'Acoustic', 'Pubudu', 'Infinity', 'O1003');
INSERT INTO `music_event`.`BAND` (`Band_ID`, `Band_Type`, `Band_Leader`, `Band_Name`, `Organizer_ID`) VALUES ('B0004', 'Jazz', 'Rohan', 'Midlane', 'O1004');
INSERT INTO `music_event`.`BAND` (`Band_ID`, `Band_Type`, `Band_Leader`, `Band_Name`, `Organizer_ID`) VALUES ('B0005', 'Electric', 'Virash', 'Daddy', 'O1006');
INSERT INTO `music_event`.`BAND` (`Band_ID`, `Band_Type`, `Band_Leader`, `Band_Name`, `Organizer_ID`) VALUES ('B0006', 'Acoustic', 'Nadeemal', 'Dignity', 'O1002');

-- Adding data to MUSIC_EVENT Table

INSERT INTO `music_event`.`MUSIC_EVENT` (`Event_Name`, `Event_ID`, `Event_Date`, `Event_Venue`, `Event_Time`, `Event_Capacity`, `Event_Status`, `Band_ID`) VALUES ('Galle Night', 'E0001', '2022-01-10', 'Samanala Ground', '06:00:00', '1000', 'Held', 'B0001');
INSERT INTO `music_event`.`MUSIC_EVENT` (`Event_Name`, `Event_ID`, `Event_Date`, `Event_Venue`, `Event_Time`, `Event_Capacity`, `Event_Status`, `Band_ID`) VALUES ('Boom Town', 'E0002', '2022-08-30', 'Viharamahadevi Ground', '07:00:00', '800', 'Held', 'B0003');
INSERT INTO `music_event`.`MUSIC_EVENT` (`Event_Name`, `Event_ID`, `Event_Date`, `Event_Venue`, `Event_Time`, `Event_Capacity`, `Event_Status`, `Band_ID`) VALUES ('Sindu Handewa', 'E0003', '2023-02-07', 'Rabindranath Auditorium', '08:30:00', '1200', 'Will be held', 'B0004');
INSERT INTO `music_event`.`MUSIC_EVENT` (`Event_Name`, `Event_ID`, `Event_Date`, `Event_Venue`, `Event_Time`, `Event_Capacity`, `Event_Status`, `Band_ID`) VALUES ('SunDown', 'E0004', '2023-04-22', 'Sivali college auditorium', '06:30:00', '900', 'Cancelled', 'B0001');
INSERT INTO `music_event`.`MUSIC_EVENT` (`Event_Name`, `Event_ID`, `Event_Date`, `Event_Venue`, `Event_Time`, `Event_Capacity`, `Event_Status`, `Band_ID`) VALUES ('Supreme Festia', 'E0005', '2023-10-15', 'Horana Ground', '05:00:00', '1100', 'Held', 'B0005');
INSERT INTO `music_event`.`MUSIC_EVENT` (`Event_Name`, `Event_ID`, `Event_Date`, `Event_Venue`, `Event_Time`, `Event_Capacity`, `Event_Status`, `Band_ID`) VALUES ('Meduza', 'E0006', '2022-05-11', 'Bogambara Ground', '07:30:00', '1500', 'Held', 'B0002');

-- Adding data to VENUE Table

INSERT INTO `music_event`.`VENUE` (`Venue_Owner`, `Venue_Name`, `Venue_Capacity`, `Venue_Street`, `Venue_City`, `Venue_State`, `Event_ID`) VALUES ('Nimal', 'Samanala Ground', '1200', 'Main Street', 'Galle', 'Sri Lanka', 'E0001');
INSERT INTO `music_event`.`VENUE` (`Venue_Owner`, `Venue_Name`, `Venue_Capacity`, `Venue_Street`, `Venue_City`, `Venue_State`, `Event_ID`) VALUES ('Kamal', 'Viharamahadevi Park', '1000', 'B22 Street', 'Negombo', 'Sri Lanka', 'E0002');
INSERT INTO `music_event`.`VENUE` (`Venue_Owner`, `Venue_Name`, `Venue_Capacity`, `Venue_Street`, `Venue_City`, `Venue_State`, `Event_ID`) VALUES ('Sunil', 'Rabindranath Auditorium', '1500', 'University Street', 'Matara', 'Sri Lanka', 'E0003');
INSERT INTO `music_event`.`VENUE` (`Venue_Owner`, `Venue_Name`, `Venue_Capacity`, `Venue_Street`, `Venue_City`, `Venue_State`, `Event_ID`) VALUES ('Amal', 'Sivali College Auditorium', '1000', 'Main Street', 'Rathnapura', 'Sri Lanka', 'E0004');
INSERT INTO `music_event`.`VENUE` (`Venue_Owner`, `Venue_Name`, `Venue_Capacity`, `Venue_Street`, `Venue_City`, `Venue_State`, `Event_ID`) VALUES ('Nihal', 'Horana Ground', '1300', 'Ground Street', 'Kaluthara', 'Sri Lanka', 'E0005');
INSERT INTO `music_event`.`VENUE` (`Venue_Owner`, `Venue_Name`, `Venue_Capacity`, `Venue_Street`, `Venue_City`, `Venue_State`, `Event_ID`) VALUES ('Anil', 'Bogambara Ground', '2000', 'Peradeniya Street', 'Kandy', 'Sri Lanka', 'E0006');

-- Adding data to VENUE_CONTACT Table

INSERT INTO `music_event`.`VENUE_CONTACT` (`Venue_Owner`, `Venue_Name`, `Venue_ContactNo`) VALUES ('Amal', 'Sivali College Auditorium', '0771231231');
INSERT INTO `music_event`.`VENUE_CONTACT` (`Venue_Owner`, `Venue_Name`, `Venue_ContactNo`) VALUES ('Anil', 'Bogambara Ground', '0772342342');
INSERT INTO `music_event`.`VENUE_CONTACT` (`Venue_Owner`, `Venue_Name`, `Venue_ContactNo`) VALUES ('Kamal', 'Viharamahadevi Park', '0773453453');
INSERT INTO `music_event`.`VENUE_CONTACT` (`Venue_Owner`, `Venue_Name`, `Venue_ContactNo`) VALUES ('Nihal', 'Horana Ground', '0774564564');
INSERT INTO `music_event`.`VENUE_CONTACT` (`Venue_Owner`, `Venue_Name`, `Venue_ContactNo`) VALUES ('Nimal', 'Samanala Ground', '0775675675');
INSERT INTO `music_event`.`VENUE_CONTACT` (`Venue_Owner`, `Venue_Name`, `Venue_ContactNo`) VALUES ('Sunil', 'Rabindranath Auditorium', '0776786786');

-- Adding data to BAND_MEMBER Table

INSERT INTO `music_event`.`BAND_MEMBER` (`BMember_FirstName`, `BMember_LastName`, `BMember_ContactNo`, `BMember_Role`, `BMember_Email`, `BMember_BirthDay`, `Band_ID`) VALUES ('Sarith', 'Jayawardena', '0709879879', 'Lead Guitarist', 'sarith@gmail.com', '1999-10-12', 'B0001');
INSERT INTO `music_event`.`BAND_MEMBER` (`BMember_FirstName`, `BMember_LastName`, `BMember_ContactNo`, `BMember_Role`, `BMember_Email`, `BMember_BirthDay`, `Band_ID`) VALUES ('Anushka', 'Udana', '0708768768', 'Keyboardist', 'anushka@gmail.com', '1997-08-15', 'B0002');
INSERT INTO `music_event`.`BAND_MEMBER` (`BMember_FirstName`, `BMember_LastName`, `BMember_ContactNo`, `BMember_Role`, `BMember_Email`, `BMember_BirthDay`, `Band_ID`) VALUES ('Roshan', 'Fernando', '0707657657', 'Vocalist', 'roshan@gmail.com', '1995-03-11', 'B0004');
INSERT INTO `music_event`.`BAND_MEMBER` (`BMember_FirstName`, `BMember_LastName`, `BMember_ContactNo`, `BMember_Role`, `BMember_Email`, `BMember_BirthDay`, `Band_ID`) VALUES ('Nifal', 'Ibrahim', '0706546546', 'Rythem Guitarist', 'nifal@gmail.com', '1993-04-22', 'B0006');
INSERT INTO `music_event`.`BAND_MEMBER` (`BMember_FirstName`, `BMember_LastName`, `BMember_ContactNo`, `BMember_Role`, `BMember_Email`, `BMember_BirthDay`, `Band_ID`) VALUES ('Dilon', 'Jayalath', '0705435435', 'Bass Guitarist', 'dilon@gmail.com', '1991-06-16', 'B0002');
INSERT INTO `music_event`.`BAND_MEMBER` (`BMember_FirstName`, `BMember_LastName`, `BMember_ContactNo`, `BMember_Role`, `BMember_Email`, `BMember_BirthDay`, `Band_ID`) VALUES ('Buddhika', 'Perera', '0704324324', 'Drummer', 'budhdhika@gmail.com', '1992-11-18', 'B0005');

-- Adding data to Band_Contact Table

INSERT INTO `music_event`.`Band_Contact` (`Band_ID`, `Band_Contact_No`) VALUES ('B0001', '0751112223');
INSERT INTO `music_event`.`Band_Contact` (`Band_ID`, `Band_Contact_No`) VALUES ('B0002', '0762223334');
INSERT INTO `music_event`.`Band_Contact` (`Band_ID`, `Band_Contact_No`) VALUES ('B0003', '0753334445');
INSERT INTO `music_event`.`Band_Contact` (`Band_ID`, `Band_Contact_No`) VALUES ('B0004', '0754445556');
INSERT INTO `music_event`.`Band_Contact` (`Band_ID`, `Band_Contact_No`) VALUES ('B0005', '0755556667');
INSERT INTO `music_event`.`Band_Contact` (`Band_ID`, `Band_Contact_No`) VALUES ('B0006', '0756667778');

-- Adding data to ARTIST Table

INSERT INTO `music_event`.`ARTIST` (`Artist_ID`, `Artist_FirstName`, `Artist_LastName`, `Artist_Email`, `Artist_Band_ID`, `Artist_Contact_No`, `Organizer_ID`) VALUES ('A0001', 'Sanuka', 'Wickramasinghe', 'sanuka@gmail.com', 'B0006', '0721122334', 'O1001');
INSERT INTO `music_event`.`ARTIST` (`Artist_ID`, `Artist_FirstName`, `Artist_LastName`, `Artist_Email`, `Artist_Band_ID`, `Artist_Contact_No`, `Organizer_ID`) VALUES ('A0002', 'Hana', 'Shafa', 'hana@gmail.com', 'B0004', '0722233445', 'O1004');
INSERT INTO `music_event`.`ARTIST` (`Artist_ID`, `Artist_FirstName`, `Artist_LastName`, `Artist_Email`, `Artist_Band_ID`, `Artist_Contact_No`, `Organizer_ID`) VALUES ('A0003', 'Dinesh', 'Gamage', 'dinesh@gmail.com', 'B0003', '0723344556', 'O1006');
INSERT INTO `music_event`.`ARTIST` (`Artist_ID`, `Artist_FirstName`, `Artist_LastName`, `Artist_Email`, `Artist_Band_ID`, `Artist_Contact_No`, `Organizer_ID`) VALUES ('A0004', 'Kanchana', 'Anuradhi', 'kanchana@gmail.com', 'B0001', '0724455667', 'O1002');
INSERT INTO `music_event`.`ARTIST` (`Artist_ID`, `Artist_FirstName`, `Artist_LastName`, `Artist_Email`, `Artist_Band_ID`, `Artist_Contact_No`, `Organizer_ID`) VALUES ('A0005', 'Lahiru', 'Perera', 'lahiru@gmail.com', 'B0002', '0725566778', 'O1005');
INSERT INTO `music_event`.`ARTIST` (`Artist_ID`, `Artist_FirstName`, `Artist_LastName`, `Artist_Email`, `Artist_Band_ID`, `Artist_Contact_No`, `Organizer_ID`) VALUES ('A0006', 'Anushka', 'Udana', 'anushka@gmail.com', 'B0005', '0726677889', 'O1002');

-- Adding data to PARTICIPANT Table

INSERT INTO `music_event`.`PARTICIPANT` (`Participant_ID`, `Participant_FirstName`, `Participant_LastName`, `Participant_Contact_No`, `Participant_Email`, `Event_ID`) VALUES ('P0001', 'Nimal', 'Silva', '0111231234', 'nimal@gmail.com', 'E0001');
INSERT INTO `music_event`.`PARTICIPANT` (`Participant_ID`, `Participant_FirstName`, `Participant_LastName`, `Participant_Contact_No`, `Participant_Email`, `Event_ID`) VALUES ('P0002', 'Sunil', 'Perera', '0112342345', 'sunil@gmail.com', 'E0004');
INSERT INTO `music_event`.`PARTICIPANT` (`Participant_ID`, `Participant_FirstName`, `Participant_LastName`, `Participant_Contact_No`, `Participant_Email`, `Event_ID`) VALUES ('P0003', 'Piyal', 'Fernando', '0113453456', 'piyal@gmail.com', 'E0003');
INSERT INTO `music_event`.`PARTICIPANT` (`Participant_ID`, `Participant_FirstName`, `Participant_LastName`, `Participant_Contact_No`, `Participant_Email`, `Event_ID`) VALUES ('P0004', 'Anton', 'Jude', '0114564567', 'anton@gmail.com', 'E0002');
INSERT INTO `music_event`.`PARTICIPANT` (`Participant_ID`, `Participant_FirstName`, `Participant_LastName`, `Participant_Contact_No`, `Participant_Email`, `Event_ID`) VALUES ('P0005', 'Amal', 'Perera', '0115675678', 'amal@gmail.com', 'E0001');
INSERT INTO `music_event`.`PARTICIPANT` (`Participant_ID`, `Participant_FirstName`, `Participant_LastName`, `Participant_Contact_No`, `Participant_Email`, `Event_ID`) VALUES ('P0006', 'Prabhath', 'Chanuka', '0116786789', 'praba@gmail.com', 'E0006');

-- Adding data to TICKET Table

INSERT INTO `music_event`.`TICKET` (`Ticket_Type`, `Ticket_Price`, `Ticket_Purchase_Date`, `Sold_Ticket`, `Days_Until_Event`, `Participant_ID`) VALUES ('Seating', '2500', '2022-01-01', '100', '09', 'P0001');
INSERT INTO `music_event`.`TICKET` (`Ticket_Type`, `Ticket_Price`, `Ticket_Purchase_Date`, `Sold_Ticket`, `Days_Until_Event`, `Participant_ID`) VALUES ('VIP', '4000', '2023-04-01', '200', '21', 'P0002');
INSERT INTO `music_event`.`TICKET` (`Ticket_Type`, `Ticket_Price`, `Ticket_Purchase_Date`, `Sold_Ticket`, `Days_Until_Event`, `Participant_ID`) VALUES ('VIP', '4000', '2022-08-01', '150', '29', 'P0003');
INSERT INTO `music_event`.`TICKET` (`Ticket_Type`, `Ticket_Price`, `Ticket_Purchase_Date`, `Sold_Ticket`, `Days_Until_Event`, `Participant_ID`) VALUES ('Standing', '1000', '2023-09-15', '220', '30', 'P0004');
INSERT INTO `music_event`.`TICKET` (`Ticket_Type`, `Ticket_Price`, `Ticket_Purchase_Date`, `Sold_Ticket`, `Days_Until_Event`, `Participant_ID`) VALUES ('VIP', '4000', '2022-04-11', '300', '30', 'P0005');
INSERT INTO `music_event`.`TICKET` (`Ticket_Type`, `Ticket_Price`, `Ticket_Purchase_Date`, `Sold_Ticket`, `Days_Until_Event`, `Participant_ID`) VALUES ('Seating', '2500', '2023-01-07', '110', '30', 'P0006');

-- Update 2 Rows in Every Table

-- Update 2 rows in the ORGANIZER table
UPDATE ORGANIZER
SET Organizer_ContactNo = '0711100000', Organizer_Email = 'updated@gmail.com'
WHERE Organizer_ID = 'O1001';

-- Update 2 rows in the BAND table
UPDATE BAND
SET Band_Type = 'Updated Type'
WHERE Band_ID = 'B0001';

-- Update 2 rows in the MUSIC_EVENT table
UPDATE MUSIC_EVENT
SET Event_Status = 'Updated Status'
WHERE Event_ID = 'E0001' OR Event_ID = 'E0002';

-- Update 2 rows in the VENUE table
UPDATE VENUE
SET Venue_City = 'Updated City'
WHERE Venue_Owner = 'Nimal' OR Venue_Owner = 'Kamal';

-- Update 2 rows in the VENUE_CONTACT table
UPDATE VENUE_CONTACT
SET Venue_ContactNo = '0772200000'
WHERE Venue_Owner = 'Nimal' OR Venue_Owner = 'Kamal';

-- Update 2 rows in the BAND_MEMBER table
UPDATE BAND_MEMBER
SET BMember_ContactNo = '0713300000'
WHERE BMember_FirstName = 'Sarith' OR BMember_FirstName = 'Krishan';

-- Update 2 rows in the Band_Contact table
UPDATE Band_Contact
SET Band_Contact_No = '0754400000'
WHERE Band_ID = 'B0001' OR Band_ID = 'B0002';

-- Update 2 rows in the ARTIST table
UPDATE ARTIST
SET Artist_Email = 'artist@gmail.com'
WHERE Artist_ID = 'A0001' OR Artist_ID = 'A0002';

-- Update 2 rows in the PARTICIPANT table
UPDATE PARTICIPANT
SET Participant_Email = 'partcipt@email.com'
WHERE Participant_ID = 'P0001' OR Participant_ID = 'P0002';

-- Update 2 rows in the TICKET table
UPDATE TICKET
SET Ticket_Price = '3000'
WHERE Ticket_Type = 'Seating' OR Ticket_Type = 'VIP';


-- Deleting 1 row

-- Delete 1 row from TICKET table first
DELETE FROM TICKET WHERE Participant_ID = 'P0001';

-- Delete 1 row from PARTICIPANT table
DELETE FROM PARTICIPANT WHERE Participant_ID = 'P0001';

-- Delete 1 row from ARTIST table
DELETE FROM ARTIST WHERE Artist_ID = 'A0001';

-- Delete 1 row from BAND_MEMBER table
DELETE FROM BAND_MEMBER WHERE BMember_FirstName = 'Sarith';

-- Delete 1 row from Band_Contact table
DELETE FROM Band_Contact WHERE Band_ID = 'B0001';

-- Delete 1 row from VENUE_CONTACT table
DELETE FROM VENUE_CONTACT WHERE Venue_Owner = 'Nimal' AND Venue_Name = 'Samanala Ground';

-- Delete 1 row from VENUE table
DELETE FROM VENUE WHERE Venue_Owner = 'Nimal' AND Venue_Name = 'Samanala Ground';

-- Delete 1 row from ORGANIZER table
DELETE FROM ORGANIZER WHERE Organizer_Email = 'akila@gmail.com';

-- Delete 1 row from MUSIC_EVENT table
DELETE FROM MUSIC_EVENT WHERE Event_ID = NULL;

-- Delete 1 row from BAND table
DELETE FROM BAND WHERE Band_ID = NULL;

-- Transactions

-- Simple queries
-- 1. Select Operation: Retrieve the details of all the organizers in the database.

SELECT * FROM ORGANIZER;

-- 2. Project Operation: Retrieve the first names of all band members.

SELECT BMember_FirstName FROM BAND_MEMBER;

-- 3.Cartesian Product Operation: Retrieve all possible combinations of artists and events.

SELECT A.Artist_FirstName, A.Artist_LastName, M.Event_Name
FROM ARTIST A, MUSIC_EVENT M;

-- 4. Creating a User View: Create a view that shows the details of all participants.

CREATE VIEW ParticipantDetails AS
SELECT * FROM PARTICIPANT;

-- 5. Renaming Operation: Retrieve the event names and event venues and rename the columns as "Event" and "Location."

RENAME TABLE MUSIC_Event TO FESTIVAL_Event;
SHOW TABLES;

-- 6. Aggregation Function (Average): Calculate the average ticket price for all ticket types.

SELECT AVG(Ticket_Price) AS AverageTicketPrice
FROM TICKET;

-- 7. Using LIKE Keyword: Find all events with names containing the word "Night."

SELECT Event_Name FROM FESTIVAL_EVENT WHERE Event_Name LIKE '%Night%';

-- Complex queries

-- 1.  Basic Set Operation (Union): Retrieve a list of participants from events 'E0001' and 'E0002' (Union).

SELECT Participant_ID FROM PARTICIPANT WHERE Event_ID = 'E0001'
UNION
SELECT Participant_ID FROM PARTICIPANT WHERE Event_ID = 'E0002';

-- 2.  Basic Set Operation (Intersection): Retrieve a list of artists who are also band members.
-- Here, It can't be used the "INTERSECT" Command directly in In some database systems.

-- SELECT A.Artist_FirstName, A.Artist_LastName
-- FROM ARTIST A
-- INTERSECT
-- SELECT BM.BMember_FirstName, BM.BMember_LastName
-- FROM BAND_MEMBER BM; 

-- Here's an alternative query

SELECT A.Artist_FirstName, A.Artist_LastName
FROM ARTIST A
WHERE EXISTS (
    SELECT 1
    FROM BAND_MEMBER BM
    WHERE A.Artist_FirstName = BM.BMember_FirstName
    AND A.Artist_LastName = BM.BMember_LastName
);

-- 3.  Basic Set Operation (Set Difference): Retrieve a list of participants who attended event 'E0001' but not event 'E0002' (Set Difference).
-- Here, It can't be used the "EXCEPT" Command directly in In some database systems.

-- SELECT Participant_ID FROM PARTICIPANT WHERE Event_ID = 'E0001'
-- EXCEPT
-- SELECT Participant_ID FROM PARTICIPANT WHERE Participant_LastName = 'Perera';

-- Here's an alternative query

SELECT P1.Participant_ID
FROM PARTICIPANT P1
LEFT JOIN PARTICIPANT P2 ON P1.Participant_ID = P2.Participant_ID AND P2.Event_ID = 'E0002'
WHERE P1.Event_ID = 'E0001' AND P2.Participant_ID IS NULL;

-- 4. Basic Set Operation (Division): Find bands that have performed at all events.

SELECT B.Band_Name
FROM BAND B
WHERE NOT EXISTS (
  SELECT M.Event_ID
  FROM festival_event M
  WHERE NOT EXISTS (
    SELECT E.Event_ID
    FROM festival_event E
    WHERE E.Event_ID = M.Event_ID AND E.Band_ID = B.Band_ID
  )
);

-- 5.  Inner Join with Aliasing: Retrieve the event names and the corresponding band names for each event.

-- Create a user view for the festival_event table
CREATE VIEW EventView AS
SELECT Event_ID, Event_Name, Band_ID
FROM festival_event;

-- Create a user view for the BAND table
CREATE VIEW BandView AS
SELECT Band_ID, Band_Name
FROM BAND;

-- Perform an inner join between EventView and BandView to retrieve event names and band names
explain SELECT EV.Event_Name, BV.Band_Name
FROM EventView EV
INNER JOIN BandView BV ON EV.Band_ID = BV.Band_ID;

-- 6. Natural Join with Aliasing: Retrieve the event names and the corresponding band names for each event.

-- Create a user view for the festival_event table
CREATE VIEW EventView1 AS
SELECT Event_ID, Event_Name, Band_ID
FROM festival_event;

-- Create a user view for the BAND table
CREATE VIEW BandView1 AS
SELECT Band_ID, Band_Name
FROM BAND;

-- Perform an natural join between EventView and BandView to retrieve event names and band names
SELECT EV.Event_Name, BV.Band_Name
FROM EventView1 EV
NATURAL JOIN BandView1 BV ;

-- 7. Left Outer Join with Aliasing: Retrieve all bands and their events, including those without events.

CREATE VIEW BandEventView AS
SELECT Band_ID, Band_Name
FROM BAND;

CREATE VIEW EventBandView AS
SELECT Event_ID, Event_Name, Band_ID
FROM festival_event;

EXPLAIN SELECT BV.Band_Name, EV.Event_Name
FROM BandEventView BV
LEFT OUTER JOIN EventBandView EV ON BV.Band_ID = EV.Band_ID;

-- 8. Right Outer Join with Aliasing: Retrieve all events and their associated bands, including those without bands.

CREATE VIEW EventView2 AS
SELECT Event_ID, Event_Name, Band_ID
FROM festival_event;

CREATE VIEW BandView2 AS
SELECT Band_ID, Band_Name
FROM BAND;

EXPLAIN SELECT EV.Event_Name, BV.Band_Name
FROM EventView2 EV
RIGHT OUTER JOIN BandView2 BV ON EV.Band_ID = BV.Band_ID;

-- 9.  Full Outer Join with Aliasing: Retrieve all events and their associated bands, including those without events and bands.
-- Here, It can't be used the "FULL OUTER JOIN" Command directly in In some database systems.

-- SELECT ME.Event_Name, B.Band_Name
-- FROM festival_event ME
-- FULL OUTER JOIN BAND B ON ME.Band_ID = B.Band_ID;

-- Here's an alternative query

CREATE VIEW EventView3 AS
SELECT Event_ID, Event_Name, Band_ID
FROM festival_event;

CREATE VIEW BandView3 AS
SELECT Band_ID, Band_Name
FROM BAND;

EXPLAIN SELECT EV.Event_Name, BV.Band_Name
FROM EventView3 EV
LEFT JOIN BandView3 BV ON EV.Band_ID = BV.Band_ID
UNION ALL
SELECT EV.Event_Name, NULL AS Band_Name
FROM EventView3 EV
WHERE EV.Band_ID IS NULL
UNION ALL
SELECT NULL AS Event_Name, BV.Band_Name
FROM BandView3 BV
WHERE BV.Band_ID NOT IN (SELECT DISTINCT Band_ID FROM EventView3);

-- 10. Outer Union: Get a list of all organizers and all artists who have contacts.

CREATE VIEW OrganizerView3 AS
SELECT Organizer_ID, Organizer_FirstName AS Name, Organizer_ContactNo AS Contact
FROM ORGANIZER;

CREATE VIEW ArtistView3 AS
SELECT Artist_ID, CONCAT(Artist_FirstName, ' ', Artist_LastName) AS Name, Artist_Contact_No AS Contact
FROM ARTIST
WHERE Artist_Contact_No IS NOT NULL;

SELECT Name, Contact
FROM OrganizerView3
UNION
SELECT Name, Contact
FROM ArtistView3;

-- 11. Nested Subquery with Union: Retrieve a list of participants who purchased tickets for either "Galle Night" or "Boom Town" events.

SELECT DISTINCT P.Participant_FirstName, P.Participant_LastName
FROM PARTICIPANT AS P
WHERE P.Event_ID IN (
    SELECT E.Event_ID
    FROM festival_event AS E
    WHERE E.Event_Name = 'Galle Night'
    UNION
    SELECT E.Event_ID
    FROM festival_event AS E
    WHERE E.Event_Name = 'Boom Town'
);

-- 12.Nested Query with LEFT OUTER JOIN: Get a list of all organizers and their events (if any) along with the total number of participants in each event.

EXPLAIN select O.Organizer_FirstName, M.Event_Name, COUNT(P.Participant_ID) AS Total_Participants
FROM ORGANIZER AS O
LEFT JOIN (
    SELECT ME.Event_Name, ME.Event_ID
    FROM festival_event AS ME
    LEFT JOIN PARTICIPANT AS P ON ME.Event_ID = P.Event_ID
) AS M ON O.Organizer_ID = M.Event_ID
LEFT JOIN PARTICIPANT AS P ON M.Event_ID = P.Event_ID
GROUP BY O.Organizer_FirstName, M.Event_Name;

-- 13. Nested Query with INNER OUTER JOIN: Retrieve the event names and band names for events with bands that have more than three band members.

SELECT M.Event_Name, B.Band_Name
FROM festival_event AS M
INNER JOIN BAND AS B ON M.Band_ID = B.Band_ID
WHERE B.Band_ID IN (
    SELECT BM.Band_ID
    FROM BAND_MEMBER AS BM
    GROUP BY BM.Band_ID
    HAVING COUNT(*) >= 1
);

-- QUERY TUNING

-- Query 1: Using LIKE Keyword: Find all events with names containing the word "Night."
-- Tuned Query 01

CREATE INDEX EvtNameIndex ON FESTIVAL_EVENT (Event_Name);
-- drop index EvtNameIndex on FESTIVAL_EVENT;
explain SELECT Event_Name FROM FESTIVAL_EVENT WHERE Event_Name LIKE '%Night%';

-- Query 2: Basic Set Operation (Union): Retrieve a list of participants from events 'E0001' and 'E0002' (Union).
-- Tuned Query 02

SELECT Participant_ID FROM PARTICIPANT WHERE Event_ID IN ('E0001', 'E0002');

-- Query 3: Inner Join with Aliasing: Retrieve the event names and the corresponding band names for each event.
-- Tuned Query 03

CREATE INDEX EventBandIndex ON festival_event (Band_ID);
CREATE INDEX BandBandIndex ON BAND (Band_ID);

EXPLAIN SELECT ME.Event_Name, B.Band_Name
FROM festival_event ME
INNER JOIN BAND B ON ME.Band_ID = B.Band_ID;

-- Query 4: Outer Union: Get a list of all organizers and all artists who have contacts.
-- Tuned Query 04

EXPLAIN SELECT Organizer_FirstName AS Name, Organizer_ContactNo AS Contact
FROM ORGANIZER
UNION
SELECT CONCAT(Artist_FirstName, ' ', Artist_LastName) AS Name, Artist_Contact_No AS Contact
FROM ARTIST
WHERE Artist_Contact_No IS NOT NULL;


-- Query 5:Basic Set Operation (Set Difference): Retrieve a list of participants who attended event 'E0001' but not event 'E0002' (Set Difference).
-- Tuned Query 05

EXPLAIN SELECT P1.Participant_ID
FROM PARTICIPANT P1
LEFT JOIN PARTICIPANT P2 ON P1.Participant_ID = P2.Participant_ID AND P2.Event_ID = 'E0002'
WHERE P1.Event_ID = 'E0001'
      AND P2.Event_ID IS NULL; -- Simplified the condition here
      
-- Query 6: Nested Query with LEFT OUTER JOIN: Get a list of all organizers and their events (if any) along with the total number of participants in each event.
-- Tuned Query 06

EXPLAIN SELECT O.Organizer_FirstName, ME.Event_Name, COUNT(P.Participant_ID) AS Total_Participants
FROM ORGANIZER AS O
LEFT JOIN festival_event AS ME ON O.Organizer_ID = ME.Event_ID
LEFT JOIN PARTICIPANT AS P ON ME.Event_ID = P.Event_ID
GROUP BY O.Organizer_FirstName, ME.Event_Name;

-- Query 7: Full Outer Join with Aliasing: Retrieve all events and their associated bands, including those without events and bands.
-- Tuned Query 07

EXPLAIN SELECT EV.Event_Name, BV.Band_Name
FROM EventView3 EV
LEFT JOIN BandView3 BV ON EV.Band_ID = BV.Band_ID
UNION ALL
SELECT NULL AS Event_Name, BV.Band_Name
FROM BandView3 BV
WHERE BV.Band_ID NOT IN (SELECT DISTINCT Band_ID FROM EventView3);

 
-- Query 8: Basic Set Operation (Division) - Tuned
-- Tuned Query 08

EXPLAIN SELECT B.Band_Name
FROM BAND B
LEFT JOIN festival_event M ON B.Band_ID = M.Band_ID
GROUP BY B.Band_Name
HAVING COUNT(DISTINCT M.Event_ID) = (SELECT COUNT(*) FROM festival_event);

-- Query 9: Right Outer Join with Aliasing: Retrieve all events and their associated bands, including those without bands.
-- Tuned Query 09

CREATE VIEW EventBandView2 AS
SELECT EV.Event_ID, EV.Event_Name, BV.Band_ID, BV.Band_Name
FROM festival_event EV
RIGHT OUTER JOIN BAND BV ON EV.Band_ID = BV.Band_ID;

EXPLAIN SELECT EB.Event_Name, EB.Band_Name
FROM EventBandView2 EB;

-- Query 10: Basic Set Operation (Intersection): Retrieve a list of artists who are also band members.
-- Tuned Query 10

EXPLAIN SELECT DISTINCT A.Artist_FirstName, A.Artist_LastName
FROM ARTIST A
INNER JOIN BAND_MEMBER BM ON A.Artist_FirstName = BM.BMember_FirstName
                        AND A.Artist_LastName = BM.BMember_LastName;
