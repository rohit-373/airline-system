-- Deleting existing flight data
DELETE FROM Operates;
DELETE FROM Journey;
DELETE FROM Airplane;
DELETE FROM Staff;


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


INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Anika', 'Pilot', 'anika@example.com', 14, 42);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Riya', 'Flight Attendant', 'riya@example.com', 7, 55);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Reyansh', 'Flight Attendant', 'reyansh@example.com', 18, 43);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Pari', 'Co-Pilot', 'pari@example.com', 16, 48);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Aadhya', 'Co-Pilot', 'aadhya@example.com', 13, 37);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Ishaan', 'Co-Pilot', 'ishaan@example.com', 12, 59);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Ananya', 'Co-Pilot', 'ananya@example.com', 1, 41);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Vihaan', 'Mechanic', 'vihaan@example.com', 13, 26);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Aditya', 'Pilot', 'aditya@example.com', 10, 55);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Krishna', 'Pilot', 'krishna@example.com', 12, 56);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Ayaan', 'Pilot', 'ayaan@example.com', 12, 43);
INSERT INTO Staff(Name, Role, Email, Airplane_ID, Hours) VALUES ('Arjun', 'Mechanic', 'arjun@example.com', 2, 26);

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
