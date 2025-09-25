
CREATE TABLE Passenger(
    Passenger_ID INTEGER PRIMARY KEY,
    First_Name VARCHAR(255),
    Middle_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Gender VARCHAR(10),
    Date_of_Birth DATE,
    Email VARCHAR(255)
);

CREATE TABLE Journey(
    Flight_ID INT PRIMARY KEY,
    Flight_Number VARCHAR(20),
    Start_Location VARCHAR(255),
    Destination_Location VARCHAR(255),
    Airplane_ID INT,
    FOREIGN KEY (Airplane_ID) REFERENCES Airplane(Airplane_ID)
);

CREATE TABLE Ticket(
    Ticket_ID INT PRIMARY KEY,
    Booking_Date DATE,
    Seat_Number VARCHAR(10),
    Class VARCHAR(20),
    Price DECIMAL(10, 2),
    Payment_Status VARCHAR(20),
    Passenger_ID INT,
    Flight_ID INT,
    Status VARCHAR(20),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (Flight_ID) REFERENCES Journey(Flight_ID)
);

CREATE TABLE Airport(
    Airport_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Code VARCHAR(10),
    City VARCHAR(255),
    State VARCHAR(255),
    Country VARCHAR(255),
    Runways_Count INT,
    Type VARCHAR(50)
);

CREATE TABLE Airplane(
    Airplane_ID INT PRIMARY KEY,
    Status VARCHAR(20),
    Departure_Time DATETIME,
    Arrival_Time DATETIME,
    Airline_Name VARCHAR(255)
);

CREATE TABLE Staff(
    Staff_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(255),
    Role VARCHAR(50),
    Email VARCHAR(255),
    Airplane_ID INT,
    Hours INT,
    FOREIGN KEY (Airplane_ID) REFERENCES Airplane(Airplane_ID)
);

CREATE TABLE Operates(
    Airplane_ID INT,
    Airport_ID INT,
    PRIMARY KEY (Airplane_ID, Airport_ID),
    FOREIGN KEY (Airplane_ID) REFERENCES Airplane(Airplane_ID),
    FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID)
);

CREATE TABLE Passenger_Phone_Numbers (
    Passenger_ID INT,
    Phone_Numbers VARCHAR(20),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID)
);

CREATE TABLE Airport_Contact_Numbers (
    Airport_ID INT,
    Contact_Numbers VARCHAR(20),
    FOREIGN KEY (Airport_ID) REFERENCES Airport(Airport_ID)
);

CREATE TABLE Staff_Phone_Numbers(
    Staff_ID INT,
    Phone_Numbers VARCHAR(20),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE Languages_Spoken(
    Staff_ID INT,
    Languages_Spoken VARCHAR(255),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);
