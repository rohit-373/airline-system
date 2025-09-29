
-- Populating Airplane Table with flights from Sep 22, 2025 onwards
INSERT INTO Airplane (Airplane_ID, Status, Departure_Time, Arrival_Time, Airline_Name) VALUES
(1, 'On Time', '2025-09-22 14:00:00', '2025-09-22 16:00:00', 'Air India'),
(2, 'On Time', '2025-09-22 18:00:00', '2025-09-22 20:00:00', 'IndiGo'),
(3, 'On Time', '2025-09-23 06:00:00', '2025-09-23 07:00:00', 'SpiceJet'),
(4, 'On Time', '2025-09-23 08:00:00', '2025-09-23 10:00:00', 'Vistara'),
(5, 'On Time', '2025-09-24 12:00:00', '2025-09-24 14:00:00', 'Air India'),
(6, 'On Time', '2025-09-25 08:00:00', '2025-09-25 11:30:00', 'Emirates'),
(7, 'On Time', '2025-09-26 22:00:00', '2025-09-27 07:00:00', 'Etihad Airways'),
(8, 'On Time', '2025-09-27 10:00:00', '2025-09-27 15:30:00', 'British Airways'),
(9, 'On Time', '2025-09-28 21:00:00', '2025-09-29 05:00:00', 'Singapore Airlines'),
(10, 'On Time', '2025-10-01 08:00:00', '2025-10-01 10:00:00', 'IndiGo'),
(11, 'On Time', '2025-10-01 12:00:00', '2025-10-01 14:00:00', 'Vistara'),
(12, 'On Time', '2025-10-02 16:00:00', '2025-10-02 18:00:00', 'SpiceJet'),
(13, 'On Time', '2025-10-10 09:00:00', '2025-10-10 11:00:00', 'Air India'),
(14, 'On Time', '2025-10-15 13:00:00', '2025-10-15 15:00:00', 'IndiGo'),
(15, 'On Time', '2025-11-05 17:00:00', '2025-11-05 19:00:00', 'Vistara'),
(16, 'On Time', '2025-11-20 10:00:00', '2025-11-20 11:30:00', 'SpiceJet'),
(17, 'On Time', '2025-12-01 14:00:00', '2025-12-01 15:30:00', 'Air India'),
(18, 'On Time', '2025-12-25 18:00:00', '2025-12-25 19:30:00', 'IndiGo');

INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (1, 'Anika', 'Pilot', 'anika@example.com', 14, 42);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (2, 'Riya', 'Flight Attendant', 'riya@example.com', 7, 55);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (3, 'Reyansh', 'Flight Attendant', 'reyansh@example.com', 18, 43);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (4, 'Pari', 'Co-Pilot', 'pari@example.com', 16, 48);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (5, 'Aadhya', 'Co-Pilot', 'aadhya@example.com', 13, 37);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (6, 'Ishaan', 'Co-Pilot', 'ishaan@example.com', 12, 59);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (7, 'Ananya', 'Co-Pilot', 'ananya@example.com', 1, 41);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (8, 'Vihaan', 'Mechanic', 'vihaan@example.com', 13, 26);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (9, 'Aditya', 'Pilot', 'aditya@example.com', 10, 55);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (10, 'Krishna', 'Pilot', 'krishna@example.com', 12, 56);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (11, 'Ayaan', 'Pilot', 'ayaan@example.com', 12, 43);
INSERT INTO Staff(Staff_ID, Name, Role, Email, Airplane_ID, Hours) VALUES (12, 'Arjun', 'Mechanic', 'arjun@example.com', 2, 26);

-- Populating Journey Table with new flights
INSERT INTO Journey (Flight_ID, Flight_Number, Start_Location, Destination_Location, Airplane_ID) VALUES
(1, 'AI-202', 'Delhi', 'Mumbai', 1),
(2, '6E-536', 'Mumbai', 'Bengaluru', 2),
(3, 'SG-817', 'Bengaluru', 'Chennai', 3),
(4, 'UK-822', 'Chennai', 'Kolkata', 4),
(5, 'AI-401', 'Kolkata', 'Delhi', 5),
(6, 'EK-511', 'Delhi', 'Dubai', 6),
(7, 'EY-101', 'Mumbai', 'New York', 7),
(8, 'BA-118', 'Bengaluru', 'London', 8),
(9, 'SQ-529', 'Chennai', 'Singapore', 9),
(10, '6E-205', 'Delhi', 'Mumbai', 10),
(11, 'UK-997', 'Delhi', 'Mumbai', 11),
(12, 'SG-872', 'Delhi', 'Mumbai', 12),
(13, 'AI-507', 'Mumbai', 'Bengaluru', 13),
(14, '6E-538', 'Mumbai', 'Bengaluru', 14),
(15, 'UK-820', 'Mumbai', 'Bengaluru', 15),
(16, 'SG-102', 'Bengaluru', 'Chennai', 16),
(17, 'AI-566', 'Bengaluru', 'Chennai', 17),
(18, '6E-679', 'Bengaluru', 'Chennai', 18);

-- Populating Operates Table for new airplanes
INSERT INTO Operates (Airplane_ID, Airport_ID) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 3), (3, 4),
(4, 4), (4, 5),
(5, 5), (5, 1),
(6, 1), (6, 6),
(7, 2), (7, 7),
(8, 3), (8, 8),
(9, 4), (9, 9),
(10, 1), (10, 2),
(11, 1), (11, 2),
(12, 1), (12, 2),
(13, 2), (13, 3),
(14, 2), (14, 3),
(15, 2), (15, 3),
(16, 3), (16, 4),
(17, 3), (17, 4),
(18, 3), (18, 4);

--Populating Airport Table
INSERT INTO Airport (Airport_ID, Name, Code, City, Country, Runways_Count, Type) VALUES
(1, 'Indira Gandhi International Airport', 'DEL', 'Delhi', 'India', 3, 'International'),
(2, 'Chhatrapati Shivaji Maharaj International Airport', 'BOM', 'Mumbai', 'India', 2, 'International'),
(3, 'Kempegowda International Airport', 'BLR', 'Bengaluru', 'India', 2, 'International'),
(4, 'Chennai International Airport', 'MAA', 'Chennai', 'India', 2, 'International'),
(5, 'Netaji Subhas Chandra Bose International Airport', 'CCU', 'Kolkata', 'India', 2, 'International'),
(6, 'Dubai International Airport', 'DXB', 'Dubai', 'United Arab Emirates', 2, 'International'),
(7, 'John F. Kennedy International Airport', 'JFK', 'New York', 'USA', 4, 'International'),
(8, 'Heathrow Airport', 'LHR', 'London', 'United Kingdom', 2, 'International'),
(9, 'Singapore Changi Airport', 'SIN', 'Singapore', 'Singapore', 3, 'International');

--Populating Airport_Contact_Numbers Table
INSERT INTO Airport_Contact_Numbers (Airport_ID, Contact_Numbers) VALUES
(1, '+91 11 1234 5678'),
(2, '+91 22 2345 6789'),
(3, '+91 80 3456 7890'),
(4, '+91 44 4567 8901'),
(5, '+91 33 5678 9012'),
(6, '+971 4 6789 0123'),
(7, '+1 718 789 0123'),
(8, '+44 20 8901 2345'),
(9, '+65 6543 2109');

-- Populating Staff_Phone_Numbers Table
INSERT INTO Staff_Phone_Numbers (Staff_ID, Phone_Numbers) VALUES
(1, '+91 9876543210'), (1, '+91 9876543211'),
(2, '+91 8765432109'),
(3, '+91 7654321098'), (3, '+91 7654321099'),
(4, '+91 6543210987'),
(5, '+91 5432109876'), (5, '+91 5432109877'),
(6, '+91 4321098765'),
(7, '+91 3210987654'),
(8, '+91 2109876543'),
(9, '+91 1098765432'),
(10, '+91 1234509876'),
(11, '+91 2345610987'),
(12, '+91 3456721098'),
(2, '+91 8765432108'),
(4, '+91 6543210986'),
(8, '+91 2109876542');

-- Populating Languages_Spoken Table
INSERT INTO Languages_Spoken (Staff_ID, Languages_Spoken) VALUES
(1, 'English'), (1, 'Hindi'),
(2, 'English'), (2, 'Tamil'),
(3, 'English'), (3, 'Bengali'),
(4, 'English'),
(5, 'English'), (5, 'Kannada'),
(6, 'English'), (6, 'Arabic'),
(7, 'English'),
(8, 'English'),
(9, 'English'), (9, 'Mandarin'),
(10, 'English'), (10, 'Hindi'),
(11, 'English'), (11, 'Hindi'),
(12, 'English'), (12, 'Hindi'),
(2, 'French'),
(4, 'Spanish'),
(8, 'German');
