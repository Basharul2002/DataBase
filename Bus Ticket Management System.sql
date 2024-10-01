-- Creating Tables 
CREATE TABLE Driver_Info 
(
  ID INT PRIMARY KEY,
  NAME VARCHAR2(50) NOT NULL,
  PHN_NUM1 VARCHAR2(15) NOT NULL,
  PHN_NUM2 VARCHAR2(15),
  BUS_NUM INT NOT NULL,
  Driver_DOB_ID INT NOT NULL,
  Driver_Address_ID INT NOT NULL,
  FOREIGN KEY(BUS_NUM) REFERENCES Bus_Info(BUS_NUM),
  FOREIGN KEY(Driver_DOB_ID) REFERENCES Driver_DOB(ID),
  FOREIGN KEY(Driver_Address_ID) REFERENCES Driver_Address(ID)
);



CREATE TABLE Driver_DOB 
(
  ID INT PRIMARY KEY,
  DAY INT NOT NULL,
  MONTH INT NOT NULL,
  YEAR INT NOT NULL
);



CREATE TABLE Driver_Address 
(
  ID INT PRIMARY KEY,
  STREET_NUM NUMBER(5) NOT NULL,
  STREET_NAME VARCHAR2(50) NOT NULL,
  APARTMENT_NUM NUMBER(5) NOT NULL,
  APARTMENT_NAME VARCHAR2(50) NOT NULL,
  CITY VARCHAR2(50) NOT NULL,
  ZIP_CODE VARCHAR2(10) NOT NULL,
  COUNTRY VARCHAR2(50) NOT NULL
);



CREATE TABLE Conductor_Info 
(
  ID INT PRIMARY KEY,
  NAME VARCHAR2(50) NOT NULL,
  PHN_NUM1 VARCHAR2(15) NOT NULL,
  PHN_NUM2 VARCHAR2(15),
  BUS_NUM INT NOT NULL,
  Conductor_DOB_ID INT NOT NULL,
  Conductor_Address_ID INT NOT NULL,
  FOREIGN KEY(BUS_NUM) REFERENCES Bus_Info(BUS_NUM),
  FOREIGN KEY(Conductor_DOB_ID) REFERENCES Conductor_DOB(ID),
  FOREIGN KEY(Conductor_Address_ID) REFERENCES Conductor_Address(ID)
);



CREATE TABLE Conductor_DOB 
(
  ID INT PRIMARY KEY,
  DAY NUMBER(2) NOT NULL,
  MONTH NUMBER(2) NOT NULL,
  YEAR NUMBER(4) NOT NULL
);



CREATE TABLE Conductor_Address 
(
  ID INT PRIMARY KEY,
  STREET_NUM NUMBER(5) NOT NULL,
  STREET_NAME VARCHAR2(50) NOT NULL,
  APARTMENT_NUM NUMBER(5) NOT NULL,
  APARTMENT_NAME VARCHAR2(50) NOT NULL,
  CITY VARCHAR2(50) NOT NULL,
  ZIP_CODE VARCHAR2(10) NOT NULL,
  COUNTRY VARCHAR2(50) NOT NULL
);



CREATE TABLE Ticket
(
  NUM INT NOT NULL,
  Ticket_DATE DATE NOT NULL,
  PRICE NUMBER (7, 2) NOT NULL,
  SEAT_NUMBER VARCHAR2(500) NOT NULL,
  ID INT NOT NULL,
  Reservation_DATE DATE NOT NULL,
  Conductor_ID INT NOT NULL,
  Passenger_ID INT NOT NULL,
  PRIMARY KEY (NUM, ID),
  FOREIGN KEY(Conductor_ID) REFERENCES Conductor_Info(ID),
  FOREIGN KEY(Passenger_ID) REFERENCES Passenger_Info(ID)
);



CREATE TABLE Passenger_Info
(
  ID INT PRIMARY KEY,
  NAME VARCHAR2(50) NOT NULL,
  PHN_NUM1 VARCHAR2(15) NOT NULL,
  PHN_NUM2 VARCHAR2(15),
  NUM_OF_SEATS NUMBER(3) NOT NULL,
  Bus_Number INT NOT NULL,
  FOREIGN KEY(Bus_Number) REFERENCES Bus_Info(BUS_NUM)
);



CREATE TABLE Payment
(
  PAY_ID INT PRIMARY KEY,
  METHOD VARCHAR2(12) CHECK (METHOD IN ('Cash', 'Card', 'Nagad', 'Bikash')) NOT NULL,
  TOTAL_PRICE NUMBER (7, 2) NOT NULL,
  Passenger_ID INT NOT NULL,
  FOREIGN KEY(Passenger_ID) REFERENCES Passenger_Info(ID)
);



CREATE TABLE Bus_Info 
( 
  BUS_NUM INT PRIMARY KEY,
  ROUTE VARCHAR2(50) NOT NULL,
  CAPACITY NUMBER(3) NOT NULL,
  Schedule_ID INT NOT NULL,
  Compnay_ID INT NOT NULL,
  FOREIGN KEY(Schedule_ID) REFERENCES Schedule(ID),
  FOREIGN KEY(Compnay_ID) REFERENCES Company_Info(ID)
);



CREATE TABLE Schedule
(
  ID INT PRIMARY KEY,
  DEPARTURE_TIME TIMESTAMP NOT NULL,
  DESTINATION VARCHAR2(50) NOT NULL
);



CREATE TABLE Supervisor_Info
(
  ID INT PRIMARY KEY,
  NAME VARCHAR2(50) NOT NULL,
  PHN_NUM1 VARCHAR2(15) NOT NULL,
  PHN_NUM2 VARCHAR2(15),
  Supervisor_DOB_ID INT NOT NULL,
  Supervisor_Address_ID INT NOT NULL,
  Bus_Number INT NOT NULL,
  FOREIGN KEY(Supervisor_DOB_ID) REFERENCES Supervisor_DOB(ID),
  FOREIGN KEY(Supervisor_Address_ID) REFERENCES Supervisor_Address(ID),
  FOREIGN KEY(Bus_Number) REFERENCES Bus_Info(BUS_NUM)
);



CREATE TABLE Supervisor_DOB
(
  ID INT PRIMARY KEY, 
  DAY NUMBER(2) NOT NULL,
  MONTH NUMBER(2) NOT NULL,
  YEAR NUMBER(4) NOT NULL
);



CREATE TABLE Supervisor_Address
(
  ID INT PRIMARY KEY,
  STREET_NUM NUMBER(5) NOT NULL,
  STREET_NAME VARCHAR2(20) NOT NULL,
  APARTMENT_NUM NUMBER(5) NOT NULL,
  APARTMENT_NAME VARCHAR2(30) NOT NULL,
  CITY VARCHAR2(50) NOT NULL,
  ZIP_CODE VARCHAR2(10) NOT NULL,
  COUNTRY VARCHAR2(50) NOT NULL
);



CREATE TABLE Company_Info
(
  ID INT PRIMARY KEY,
  NAME VARCHAR2(100) NOT NULL,
  Comapnay_Address_ID INT NOT NULL,
  FOREIGN KEY(Comapnay_Address_ID) REFERENCES Company_Address(ID)
);



CREATE TABLE Company_Address
(
  ID INT PRIMARY KEY,
  STREET_NUM NUMBER(5) NOT NULL,
  STREET_NAME vARCHAR2(20) NOT NULL,
  CITY VARCHAR2(50) NOT NULL,
  COUNTRY VARCHAR2(50) NOT NULL
);



CREATE TABLE Employee_Info
( 
  ID INT PRIMARY KEY,
  NAME VARCHAR2(50) NOT NULL,
  TYPE VARCHAR2(30) NOT NULL
);



CREATE TABLE Company_Employee_Mapping
( 
  Company_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  PRIMARY KEY(Company_ID, Employee_ID),
  FOREIGN KEY(Company_ID) REFERENCES Company_Info(ID),
  FOREIGN KEY(Employee_ID) REFERENCES Employee_Info(ID)
);





-- Squences
CREATE SEQUENCE Driver_DOB_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Driver_Address_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Conductor_DOB_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Conductor_Address_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Supervisor_DOB_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Supervisor_Address_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Company_Address_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Company_Info_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Company_Address_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Schedule_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Bus_Info_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Schedule_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Company_Info_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Driver_Info_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Bus_Info_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Driver_DOB_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Driver_Address_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Conductor_Info_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Bus_Info_ID_fk2
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Conductor_DOB_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Conductor_Address_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Passenger_Info_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Bus_Info_ID_fk3
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Pay_Info_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Passenger_Info_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Ticket_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Conductor_Info_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Passenger_Info_ID_fk2
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Supervisor_Info_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Supervisor_DOB_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Supervisor_Address_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Bus_Info_ID_fk4
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Employee_Info_ID
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Company_Info_ID_fk2
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;


CREATE SEQUENCE Employee_Info_ID_fk1
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 1000
   NOCACHE
   NOCYCLE;





-- Data Insertion
INSERT INTO Driver_DOB (ID, DAY, MONTH, YEAR) VALUES (Driver_DOB_ID.NEXTVAL, 1, 1, 1980);
INSERT INTO Driver_DOB (ID, DAY, MONTH, YEAR) VALUES (Driver_DOB_ID.NEXTVAL, 12, 6, 1980);
INSERT INTO Driver_DOB (ID, DAY, MONTH, YEAR) VALUES (Driver_DOB_ID.NEXTVAL, 18, 3, 1982);
INSERT INTO Driver_DOB (ID, DAY, MONTH, YEAR) VALUES (Driver_DOB_ID.NEXTVAL, 9, 2, 1987);
INSERT INTO Driver_DOB (ID, DAY, MONTH, YEAR) VALUES (Driver_DOB_ID.NEXTVAL, 10, 12, 1985);
INSERT INTO Driver_DOB (ID, DAY, MONTH, YEAR) VALUES (Driver_DOB_ID.NEXTVAL, 28, 2, 1983);
INSERT INTO Driver_DOB (ID, DAY, MONTH, YEAR) VALUES (Driver_DOB_ID.NEXTVAL, 12, 7, 1978);




INSERT INTO Driver_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                    VALUES (Driver_Address_ID.NEXTVAL, 135, 'Mirpur Stadium', 67, 'Atwood Apartments', 'Dhaka', '1200', 'Bangladesh');

INSERT INTO Driver_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                    VALUES (Driver_Address_ID.NEXTVAL, 1234, 'Calle de la Paloma', 17, 'Penthouse Apartments', 'Buenos Aires', '1414', 'Argentina');

INSERT INTO Driver_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                    VALUES (Driver_Address_ID.NEXTVAL, 7000, 'Avenida das Rosas', 10, 'Garden apartments', 'Brasília', '0A9', 'Brazil');

INSERT INTO Driver_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                    VALUES (Driver_Address_ID.NEXTVAL, 8320, 'Avenida del Sol', 20, 'Gated communities', 'Santiago', 'K1A', 'Chile');

INSERT INTO Driver_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                    VALUES (Driver_Address_ID.NEXTVAL, 120, 'Malecón de la Reserva', 40, 'Walk-up apartments', 'Lima ', '15074', 'Peru');

INSERT INTO Driver_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                    VALUES (Driver_Address_ID.NEXTVAL, 04, 'Myeong-dong', 130, 'BHK apartment', 'Seoul', '0537', 'South Korea');

INSERT INTO Driver_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 

                    VALUES (Driver_Address_ID.NEXTVAL, 04, 'Corso Vittorio Emanuele', 130, 'Bungalowt', 'Salerno', '0537', 'Italy');




INSERT INTO Conductor_DOB (ID, DAY, MONTH, YEAR) 
                   VALUES (Conductor_DOB_ID.NEXTVAL, 24, 9, 1990);

INSERT INTO Conductor_DOB (ID, DAY, MONTH, YEAR) 
                   VALUES (Conductor_DOB_ID.NEXTVAL, 12, 10, 1991);

INSERT INTO Conductor_DOB (ID, DAY, MONTH, YEAR) 
                   VALUES (Conductor_DOB_ID.NEXTVAL, 27, 5, 1993);

INSERT INTO Conductor_DOB (ID, DAY, MONTH, YEAR) 
                   VALUES (Conductor_DOB_ID.NEXTVAL, 4, 2, 1988);

INSERT INTO Conductor_DOB (ID, DAY, MONTH, YEAR) 
                   VALUES (Conductor_DOB_ID.NEXTVAL, 20, 3, 1994);

INSERT INTO Conductor_DOB (ID, DAY, MONTH, YEAR) 
                   VALUES (Conductor_DOB_ID.NEXTVAL, 25, 8, 1991);

INSERT INTO Conductor_DOB (ID, DAY, MONTH, YEAR) 
                  VALUES (Conductor_DOB_ID.NEXTVAL, 24, 12, 1988);




INSERT INTO Conductor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                       VALUES (Conductor_Address_ID.NEXTVAL, 456, 'Karlova Street', 32, 'Unit B', 'Prague', '110 00', 'Czech Republic');

INSERT INTO Conductor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                       VALUES (Conductor_Address_ID.NEXTVAL, 12, 'Kuratoli Road', 3, 'Unit 2', 'Dhaka', '1229', 'Bangladesh');

INSERT INTO Conductor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                       VALUES (Conductor_Address_ID.NEXTVAL, 45, 'Lambton Quay', 96, 'Unit M', 'Wellington', '6011', 'New Zealand');

INSERT INTO Conductor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                       VALUES (Conductor_Address_ID.NEXTVAL, 01001, 'Khreshchatyk', 308, 'Unit B', 'Kiev', '11001', 'Ukraine');

INSERT INTO Conductor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                       VALUES (Conductor_Address_ID.NEXTVAL, 13, 'Gran Via', 8, 'Unit C', ' Madrid', '28013', 'Spain');

INSERT INTO Conductor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                       VALUES (Conductor_Address_ID.NEXTVAL, 1273, 'Avenida da Liberdade', 87, 'Unit D', 'Lisbon', '1250-096', 'Portugal');

INSERT INTO Conductor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                       VALUES (Conductor_Address_ID.NEXTVAL, 8924, 'Taft Avenue', 64, 'Unit A', 'Manila', '1200', 'Philippines');




INSERT INTO Supervisor_DOB (ID, DAY, MONTH, YEAR) 
                    VALUES (Supervisor_DOB_ID.NEXTVAL, 10, 12, 1975);

INSERT INTO Supervisor_DOB (ID, DAY, MONTH, YEAR) 
                    VALUES (Supervisor_DOB_ID.NEXTVAL, 12, 10, 1981);

INSERT INTO Supervisor_DOB (ID, DAY, MONTH, YEAR) 
                    VALUES (Supervisor_DOB_ID.NEXTVAL, 19, 8, 1979);

INSERT INTO Supervisor_DOB (ID, DAY, MONTH, YEAR) 
                    VALUES (Supervisor_DOB_ID.NEXTVAL, 20, 12, 1995);

INSERT INTO Supervisor_DOB (ID, DAY, MONTH, YEAR) 
                    VALUES (Supervisor_DOB_ID.NEXTVAL, 1, 8, 1998);

INSERT INTO Supervisor_DOB (ID, DAY, MONTH, YEAR) 
                    VALUES (Supervisor_DOB_ID.NEXTVAL, 9, 1, 1987);

INSERT INTO Supervisor_DOB (ID, DAY, MONTH, YEAR) 
                    VALUES (Supervisor_DOB_ID.NEXTVAL, 10, 5, 1978);





INSERT INTO Supervisor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                        VALUES (Supervisor_Address_ID.NEXTVAL, 789, 'Gulsan', 20, 'Unit C', 'Dhaka', '1214', 'Bangladesh');

INSERT INTO Supervisor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                        VALUES (Supervisor_Address_ID.NEXTVAL, 78, 'Baker Street', 23, 'Unit A', 'London', 'NW16XE', 'UK');

INSERT INTO Supervisor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                        VALUES (Supervisor_Address_ID.NEXTVAL, 89, 'Pennsylvania Avenue', 71, 'Unit D', 'Washington D.C', '20500', 'USA');


INSERT INTO Supervisor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                        VALUES (Supervisor_Address_ID.NEXTVAL, 789, 'Bärengraben', 20, 'Unit C', 'Bern', '3011', 'Switzerland');

INSERT INTO Supervisor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                        VALUES (Supervisor_Address_ID.NEXTVAL, 789, ' Drottninggatan', 20, 'Unit B', 'Stockholm', '14', 'Sweden');

INSERT INTO Supervisor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                        VALUES (Supervisor_Address_ID.NEXTVAL, 7, 'Nowy Świat', 20, 'Unit A', 'Warsaw', '00-001', 'Poland');

INSERT INTO Supervisor_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
                        VALUES (Supervisor_Address_ID.NEXTVAL, 78, 'Prinsengracht', 20, 'Unit C', 'Amsterdam', '14', 'Netherlands');




INSERT INTO Company_Address (ID, STREET_NUM, STREET_NAME, CITY, COUNTRY) 
                    VALUES (Company_Address_ID.NEXTVAL, 82, 'Unter den Linden', 'Berlin',  'Germany');

INSERT INTO Company_Address (ID, STREET_NUM, STREET_NAME, CITY, COUNTRY) 
                     VALUES (Company_Address_ID.NEXTVAL, 8, 'Königstraße', 'Stuttgart', 'Germany');

INSERT INTO Company_Address (ID, STREET_NUM, STREET_NAME, CITY, COUNTRY) 
                     VALUES (Company_Address_ID.NEXTVAL, 2, ' Königsallee', 'Düsseldorf', 'Germany');

INSERT INTO Company_Address (ID, STREET_NUM, STREET_NAME, CITY, COUNTRY) 
                     VALUES (Company_Address_ID.NEXTVAL, 88, 'Spring Garden Road', 'Halifax, NS', 'Canada');

INSERT INTO Company_Address (ID, STREET_NUM, STREET_NAME, CITY, COUNTRY) 
                     VALUES (Company_Address_ID.NEXTVAL, 82, 'Buchanan Street', 'Glasgow', 'UK');

INSERT INTO Company_Address (ID, STREET_NUM, STREET_NAME, CITY, COUNTRY) 
                     VALUES (Company_Address_ID.NEXTVAL, 82, 'Northumberland', 'Newcastle', 'UK');

INSERT INTO Company_Address (ID, STREET_NUM, STREET_NAME, CITY, COUNTRY) 
                     VALUES (Company_Address_ID.NEXTVAL, 82, 'Camelback Road', 'Phoenix, AZ', 'US');




INSERT INTO Company_Info (ID, NAME, Comapnay_Address_ID) 
                  VALUES (Company_Info_ID.NEXTVAL, 'Flixbus', Company_Address_ID_fk1.NEXTVAL);

INSERT INTO Company_Info (ID, NAME, Comapnay_Address_ID) 
                  VALUES (Company_Info_ID.NEXTVAL, 'RegioJet', Company_Address_ID_fk1.NEXTVAL);

INSERT INTO Company_Info (ID, NAME, Comapnay_Address_ID) 
                  VALUES (Company_Info_ID.NEXTVAL, 'IC Bus', Company_Address_ID_fk1.NEXTVAL);

INSERT INTO Company_Info (ID, NAME, Comapnay_Address_ID) 
                  VALUES (Company_Info_ID.NEXTVAL, 'DRL Coachlines', Company_Address_ID_fk1.NEXTVAL);

INSERT INTO Company_Info (ID, NAME, Comapnay_Address_ID) 
                  VALUES (Company_Info_ID.NEXTVAL, 'Translink', Company_Address_ID_fk1.NEXTVAL);


INSERT INTO Company_Info (ID, NAME, Comapnay_Address_ID) 
                  VALUES (Company_Info_ID.NEXTVAL, 'BoltBus', Company_Address_ID_fk1.NEXTVAL);

INSERT INTO Company_Info (ID, NAME, Comapnay_Address_ID) 
                  VALUES (Company_Info_ID.NEXTVAL, 'Stagecoach Bus', Company_Address_ID_fk1.NEXTVAL);




INSERT INTO Schedule (ID, DEPARTURE_TIME, DESTINATION) 
              VALUES (Schedule_ID.NEXTVAL, '04-MAY-2023  05:30:00', 'Munich');

INSERT INTO Schedule (ID, DEPARTURE_TIME, DESTINATION) 
VALUES (Schedule_ID.NEXTVAL, '04-MAY-2023 05:45:00', 'Cologne');

INSERT INTO Schedule (ID, DEPARTURE_TIME, DESTINATION) 
              VALUES (Schedule_ID.NEXTVAL, '04-MAY-2023 06:00:00', 'Leipzig');

INSERT INTO Schedule (ID, DEPARTURE_TIME, DESTINATION) 
              VALUES (Schedule_ID.NEXTVAL, '04-MAY-2023 06:10:00', 'Toronto, ON');

INSERT INTO Schedule (ID, DEPARTURE_TIME, DESTINATION) 
              VALUES (Schedule_ID.NEXTVAL, '04-MAY-2023 06:30:00', 'Bristol');

INSERT INTO Schedule (ID, DEPARTURE_TIME, DESTINATION) 
              VALUES (Schedule_ID.NEXTVAL, '04-MAY-2023 06:45:00', 'Liverpool');

INSERT INTO Schedule (ID, DEPARTURE_TIME, DESTINATION) 
              VALUES (Schedule_ID.NEXTVAL, '04-MAY-2023 07:15:00', 'Miami');




INSERT INTO Bus_Info (BUS_NUM, ROUTE, CAPACITY, Schedule_ID, Compnay_ID) 
              VALUES (1001, 'Berlin-Munich', 57, Schedule_ID_fk1.NEXTVAL, Company_Info_ID_fk1.NEXTVAL);

INSERT INTO Bus_Info (BUS_NUM, ROUTE, CAPACITY, Schedule_ID, Compnay_ID) 
VALUES (1002, 'Stuttgart-Cologne', 55, Schedule_ID_fk1.NEXTVAL, Company_Info_ID_fk1.NEXTVAL);

INSERT INTO Bus_Info (BUS_NUM, ROUTE, CAPACITY, Schedule_ID, Compnay_ID) 
              VALUES (1003, 'Düsseldor-Leipzig', 55, Schedule_ID_fk1.NEXTVAL, Company_Info_ID_fk1.NEXTVAL);

INSERT INTO Bus_Info (BUS_NUM, ROUTE, CAPACITY, Schedule_ID, Compnay_ID) 
              VALUES (1004, 'Halifax, NS-Toronto, ON', 102, Schedule_ID_fk1.NEXTVAL, Company_Info_ID_fk1.NEXTVAL);

INSERT INTO Bus_Info (BUS_NUM, ROUTE, CAPACITY, Schedule_ID, Compnay_ID) 
              VALUES (1005, 'Bristol-Glasgow', 52, Schedule_ID_fk1.NEXTVAL, Company_Info_ID_fk1.NEXTVAL);

INSERT INTO Bus_Info (BUS_NUM, ROUTE, CAPACITY, Schedule_ID, Compnay_ID) 
              VALUES (1006, 'Liverpool-Newcastle', 52, Schedule_ID_fk1.NEXTVAL, Company_Info_ID_fk1.NEXTVAL);

INSERT INTO Bus_Info (BUS_NUM, ROUTE, CAPACITY, Schedule_ID, Compnay_ID) 
              VALUES (1007, 'New York City, NY-Miami, FL', 52, Schedule_ID_fk1.NEXTVAL, Company_Info_ID_fk1.NEXTVAL);





INSERT INTO Driver_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Driver_DOB_ID, Driver_Address_ID) 
                 VALUES (Driver_Info_ID.NEXTVAL, 'Nazmul Hasan Pappon', '01827-9068', NULL, 1001, Driver_DOB_ID_fk1.NEXTVAL, Driver_Address_ID_fk1.NEXTVAL);

INSERT INTO Driver_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Driver_DOB_ID, Driver_Address_ID) 
                 VALUES (Driver_Info_ID.NEXTVAL, 'Sakib Al Hasan', '01719-2879', '01913-590267', 1002, Driver_DOB_ID_fk1.NEXTVAL, Driver_Address_ID_fk1.NEXTVAL);

INSERT INTO Driver_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Driver_DOB_ID, Driver_Address_ID) 
                 VALUES (Driver_Info_ID.NEXTVAL, 'Tamim Iqbal', '01618-2778', NULL, 1003, Driver_DOB_ID_fk1.NEXTVAL, Driver_Address_ID_fk1.NEXTVAL);

INSERT INTO Driver_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Driver_DOB_ID, Driver_Address_ID) 
                 VALUES (Driver_Info_ID.NEXTVAL, 'Mashrafi Bin Mortaza', '01787-2589', NULL, 1004, Driver_DOB_ID_fk1.NEXTVAL, Driver_Address_ID_fk1.NEXTVAL);

INSERT INTO Driver_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Driver_DOB_ID, Driver_Address_ID) 
                 VALUES (Driver_Info_ID.NEXTVAL, 'Lional Messi', '01998-2281', NULL, 1005, Driver_DOB_ID_fk1.NEXTVAL, Driver_Address_ID_fk1.NEXTVAL);

INSERT INTO Driver_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Driver_DOB_ID, Driver_Address_ID) 
                 VALUES (Driver_Info_ID.NEXTVAL, 'Cristiano Ronaldo', '01428-9182', NULL, 1006, Driver_DOB_ID_fk1.NEXTVAL, Driver_Address_ID_fk1.NEXTVAL);

INSERT INTO Driver_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Driver_DOB_ID, Driver_Address_ID) 
                 VALUES (Driver_Info_ID.NEXTVAL, 'Karim Benzema', '01327-8738', NULL, 1007, Driver_DOB_ID_fk1.NEXTVAL, Driver_Address_ID_fk1.NEXTVAL);




INSERT INTO Conductor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Conductor_DOB_ID, Conductor_Address_ID) 
                   VALUES (Conductor_Info_ID.NEXTVAL, 'Bes Stocks', '01845-85042', NULL, 1001, Conductor_DOB_ID_fk1.NEXTVAL, Conductor_Address_ID_fk1.NEXTVAL);

INSERT INTO Conductor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Conductor_DOB_ID, Conductor_Address_ID) 
                    VALUES (Conductor_Info_ID.NEXTVAL, 'Sachin Tendulkar', '01827-871427', NULL, 1002, Conductor_DOB_ID_fk1.NEXTVAL, Conductor_Address_ID_fk1.NEXTVAL);

INSERT INTO Conductor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Conductor_DOB_ID, Conductor_Address_ID) 
                   VALUES (Conductor_Info_ID.NEXTVAL, 'Jasprit Bumrah', '01421-87578', NULL, 1003, Conductor_DOB_ID_fk1.NEXTVAL, Conductor_Address_ID_fk1.NEXTVAL);

INSERT INTO Conductor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Conductor_DOB_ID, Conductor_Address_ID) 
                    VALUES (Conductor_Info_ID.NEXTVAL, 'AB de Villiers', '01989-27178', NULL, 1004, Conductor_DOB_ID_fk1.NEXTVAL, Conductor_Address_ID_fk1.NEXTVAL);

INSERT INTO Conductor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Conductor_DOB_ID, Conductor_Address_ID) 
                    VALUES (Conductor_Info_ID.NEXTVAL, 'Faf du Plessis', '01492-12878', NULL, 1005, Conductor_DOB_ID_fk1.NEXTVAL, Conductor_Address_ID_fk1.NEXTVAL);

INSERT INTO Conductor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Conductor_DOB_ID, Conductor_Address_ID) 
                    VALUES (Conductor_Info_ID.NEXTVAL, 'Andre Russell', '01721-78262', NULL, 1006, Conductor_DOB_ID_fk1.NEXTVAL, Conductor_Address_ID_fk1.NEXTVAL);

INSERT INTO Conductor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, BUS_NUM, Conductor_DOB_ID, Conductor_Address_ID) 
                    VALUES (Conductor_Info_ID.NEXTVAL, 'Sunil Narine', '01421-87578', NULL, 1007, Conductor_DOB_ID_fk1.NEXTVAL, Conductor_Address_ID_fk1.NEXTVAL);





INSERT INTO Passenger_Info (ID, NAME, PHN_NUM1, PHN_NUM2, NUM_OF_SEATS, Bus_Number) 
                    VALUES (Passenger_Info_ID.NEXTVAL, 'Soumya Sarkar', '01337-6127', NULL, 2, 1001);

INSERT INTO Passenger_Info (ID, NAME, PHN_NUM1, PHN_NUM2, NUM_OF_SEATS, Bus_Number) 
                    VALUES (Passenger_Info_ID.NEXTVAL, 'Mustafizur Rahman', '01438-21487', '01846-792402', 2, 1007);

INSERT INTO Passenger_Info (ID, NAME, PHN_NUM1, PHN_NUM2, NUM_OF_SEATS, Bus_Number) 
                    VALUES (Passenger_Info_ID.NEXTVAL, 'Aron Finch', '0161-27367', NULL, 5, 1004);

INSERT INTO Passenger_Info (ID, NAME, PHN_NUM1, PHN_NUM2, NUM_OF_SEATS, Bus_Number) 
                    VALUES (Passenger_Info_ID.NEXTVAL, 'Ricadision', '0183-56879', NULL, 3, 1005);

INSERT INTO Passenger_Info (ID, NAME, PHN_NUM1, PHN_NUM2, NUM_OF_SEATS, Bus_Number) 
                    VALUES (Passenger_Info_ID.NEXTVAL, 'Hero Alom', '0157-87261', NULL, 1, 1002);

INSERT INTO Passenger_Info (ID, NAME, PHN_NUM1, PHN_NUM2, NUM_OF_SEATS, Bus_Number) 
                    VALUES (Passenger_Info_ID.NEXTVAL, 'Ananta Zalil', '0149-87236', '01791-870483', 1, 1006);

INSERT INTO Passenger_Info (ID, NAME, PHN_NUM1, PHN_NUM2, NUM_OF_SEATS, Bus_Number) 
                    VALUES (Passenger_Info_ID.NEXTVAL, 'Salman Muktadir', '0193-54768', NULL, 5, 1003);





INSERT INTO Payment (PAY_ID, METHOD, TOTAL_PRICE, Passenger_ID) 
             VALUES (Pay_Info_ID.NEXTVAL, 'Card', 1050.00, Passenger_Info_ID_fk1.NEXTVAL);

INSERT INTO Payment (PAY_ID, METHOD, TOTAL_PRICE, Passenger_ID) 
             VALUES (Pay_Info_ID.NEXTVAL, 'Card', 1050.00, Passenger_Info_ID_fk1.NEXTVAL);

INSERT INTO Payment (PAY_ID, METHOD, TOTAL_PRICE, Passenger_ID) 
             VALUES (Pay_Info_ID.NEXTVAL, 'Cash', 3800.00, Passenger_Info_ID_fk1.NEXTVAL);

INSERT INTO Payment (PAY_ID, METHOD, TOTAL_PRICE, Passenger_ID) 
             VALUES (Pay_Info_ID.NEXTVAL, 'Card', 1500.00, Passenger_Info_ID_fk1.NEXTVAL);

INSERT INTO Payment (PAY_ID, METHOD, TOTAL_PRICE, Passenger_ID) 
             VALUES (Pay_Info_ID.NEXTVAL, 'Nagad', 750.00, Passenger_Info_ID_fk1.NEXTVAL);

INSERT INTO Payment (PAY_ID, METHOD, TOTAL_PRICE, Passenger_ID) 
             VALUES (Pay_Info_ID.NEXTVAL, 'Bikash', 480.00, Passenger_Info_ID_fk1.NEXTVAL);

INSERT INTO Payment (PAY_ID, METHOD, TOTAL_PRICE, Passenger_ID) 
             VALUES (Pay_Info_ID.NEXTVAL, 'Nagad', 4050.00, Passenger_Info_ID_fk1.NEXTVAL);





INSERT INTO Ticket (NUM, Ticket_DATE, PRICE, SEAT_NUMBER, ID, Reservation_DATE, Conductor_ID, Passenger_ID) 
           VALUES (Ticket_ID.NEXTVAL, TO_DATE('2023-05-10','yyyy-mm-dd'), 1050.00, 'A1, A2', Reservation_Info_ID.NEXTVAL, TO_DATE('2023-05-05', 'yyyy-mm-dd'), Conductor_Info_ID_fk1.NEXTVAL, Passenger_Info_ID_fk2.NEXTVAL);

INSERT INTO Ticket (NUM, Ticket_DATE, PRICE, SEAT_NUMBER, ID, Reservation_DATE, Conductor_ID, Passenger_ID) 
            VALUES (Ticket_ID.NEXTVAL, TO_DATE('2023-07-15', 'yyyy-mm-dd'), 1050.00, 'D3, D4', Reservation_Info_ID.NEXTVAL, TO_Date('2023-05-05', 'yyyy-mm-dd'), Conductor_Info_ID_fk1.NEXTVAL, Passenger_Info_ID_fk2.NEXTVAL);

INSERT INTO Ticket (NUM, Ticket_DATE, PRICE, SEAT_NUMBER, ID, Reservation_DATE, Conductor_ID, Passenger_ID) 
            VALUES (Ticket_ID.NEXTVAL, TO_DATE('2023-06-11', 'yyyy-mm-dd'), 3800.00, 'B1, B2, B3, B4, C1', Reservation_Info_ID.NEXTVAL, TO_DATE('2023-05-05', 'yyyy-mm-dd'), Conductor_Info_ID_fk1.NEXTVAL, Passenger_Info_ID_fk2.NEXTVAL);

INSERT INTO Ticket (NUM, Ticket_DATE, PRICE, SEAT_NUMBER, ID, Reservation_DATE, Conductor_ID, Passenger_ID) 
            VALUES (Ticket_ID.NEXTVAL, TO_DATE('2023-10-21', 'yyyy-mm-dd'), 1500.00, 'D1, D2, D3', Reservation_Info_ID.NEXTVAL, TO_DATE('2023-10-21', 'yyyy-mm-dd'), Conductor_Info_ID_fk1.NEXTVAL, Passenger_Info_ID_fk2.NEXTVAL);

INSERT INTO Ticket (NUM, Ticket_DATE, PRICE, SEAT_NUMBER, ID, Reservation_DATE, Conductor_ID, Passenger_ID) 
            VALUES (Ticket_ID.NEXTVAL, TO_DATE('2023-05-10','yyyy-mm-dd'), 750.00, 'A1', Reservation_Info_ID.NEXTVAL, TO_DATE('2023-05-05', 'yyyy-mm-dd'), Conductor_Info_ID_fk1.NEXTVAL, Passenger_Info_ID_fk2.NEXTVAL);

INSERT INTO Ticket (NUM, Ticket_DATE, PRICE, SEAT_NUMBER, ID, Reservation_DATE, Conductor_ID, Passenger_ID) 
            VALUES (Ticket_ID.NEXTVAL, TO_DATE('2023-05-11','yyyy-mm-dd'), 480.00, 'A1', Reservation_Info_ID.NEXTVAL, TO_DATE('2023-05-05', 'yyyy-mm-dd'), Conductor_Info_ID_fk1.NEXTVAL, Passenger_Info_ID_fk2.NEXTVAL);

INSERT INTO Ticket (NUM, Ticket_DATE, PRICE, SEAT_NUMBER, ID, Reservation_DATE, Conductor_ID, Passenger_ID) 
            VALUES (Ticket_ID.NEXTVAL, TO_DATE('2023-01-06','yyyy-mm-dd'), 450.00, 'A1', Reservation_Info_ID.NEXTVAL, TO_DATE('023-01-06', 'yyyy-mm-dd'), Conductor_Info_ID_fk1.NEXTVAL, Passenger_Info_ID_fk2.NEXTVAL);





INSERT INTO Supervisor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, Supervisor_DOB_ID, Supervisor_Address_ID, Bus_Number) 
                     VALUES (Supervisor_Info_ID.NEXTVAL, 'Virat Kholi', '01885-89282', NULL, Supervisor_DOB_ID_fk1.NEXTVAL, Supervisor_Address_ID_fk1.NEXTVAL, 1005);

INSERT INTO Supervisor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, Supervisor_DOB_ID, Supervisor_Address_ID, Bus_Number) 
                     VALUES (Supervisor_Info_ID.NEXTVAL, 'Anuska Sharma', '01885-89283', NULL, Supervisor_DOB_ID_fk1.NEXTVAL, Supervisor_Address_ID_fk1.NEXTVAL, 1001);

INSERT INTO Supervisor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, Supervisor_DOB_ID, Supervisor_Address_ID, Bus_Number) 
                     VALUES (Supervisor_Info_ID.NEXTVAL, 'Stven Smith', '01597-590468', NULL, Supervisor_DOB_ID_fk1.NEXTVAL, Supervisor_Address_ID_fk1.NEXTVAL, 1007);

INSERT INTO Supervisor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, Supervisor_DOB_ID, Supervisor_Address_ID, Bus_Number) 
                     VALUES (Supervisor_Info_ID.NEXTVAL, 'Mahmudullah Riyed', '01348-790515', NULL, Supervisor_DOB_ID_fk1.NEXTVAL, Supervisor_Address_ID_fk1.NEXTVAL, 1006);

INSERT INTO Supervisor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, Supervisor_DOB_ID, Supervisor_Address_ID, Bus_Number) 
                     VALUES (Supervisor_Info_ID.NEXTVAL, 'Musfiqur Rahim', '01459-70468', NULL, Supervisor_DOB_ID_fk1.NEXTVAL, Supervisor_Address_ID_fk1.NEXTVAL, 1003);

INSERT INTO Supervisor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, Supervisor_DOB_ID, Supervisor_Address_ID, Bus_Number) 
                     VALUES (Supervisor_Info_ID.NEXTVAL, 'George W. Bush', '01374-802744', NULL, Supervisor_DOB_ID_fk1.NEXTVAL, Supervisor_Address_ID_fk1.NEXTVAL, 1002);

INSERT INTO Supervisor_Info (ID, NAME, PHN_NUM1, PHN_NUM2, Supervisor_DOB_ID, Supervisor_Address_ID, Bus_Number) 
                     VALUES (Supervisor_Info_ID.NEXTVAL, 'D. Tramp', '01782-898657', '01795-790561', Supervisor_DOB_ID_fk1.NEXTVAL, Supervisor_Address_ID_fk1.NEXTVAL, 1004);





INSERT INTO Employee_Info (ID, NAME, TYPE) 
                    VALUES(Employee_Info_ID.NEXTVAL, 'Elon Musk', 'MANAGER');

INSERT INTO Employee_Info (ID, NAME, TYPE) 
                    VALUES(Employee_Info_ID.NEXTVAL, 'Bil Gates', 'IT Officer');

INSERT INTO Employee_Info (ID, NAME, TYPE) 
                    VALUES(Employee_Info_ID.NEXTVAL, 'Rashid Khan', 'Junior Exicutive');

INSERT INTO Employee_Info (ID, NAME, TYPE) 
                   VALUES(Employee_Info_ID.NEXTVAL, 'Sabbir Rahman, Mark Zakarbarg', 'Social Media Mannager');

INSERT INTO Employee_Info (ID, NAME, TYPE) 
                    VALUES(Employee_Info_ID.NEXTVAL, 'Obaidul Kader', 'District Manager');

INSERT INTO Employee_Info (ID, NAME, TYPE) 
                    VALUES(Employee_Info_ID.NEXTVAL, 'Joe Biden', 'District Head');

INSERT INTO Employee_Info (ID, NAME, TYPE) 
                    VALUES(Employee_Info_ID.NEXTVAL, 'Vladimir Vladimirovich Putin', 'Operation Engineer');





INSERT INTO Company_Employee_Mapping(Company_ID, Employee_ID) 
                             VALUES (Company_Info_ID_fk2.NEXTVAL, Employee_Info_ID_fk1.NEXTVAL);

INSERT INTO Company_Employee_Mapping(Company_ID, Employee_ID) 
                             VALUES (Company_Info_ID_fk2.NEXTVAL, Employee_Info_ID_fk1.NEXTVAL);

INSERT INTO Company_Employee_Mapping(Company_ID, Employee_ID) 
                             VALUES (Company_Info_ID_fk2.NEXTVAL, Employee_Info_ID_fk1.NEXTVAL);

INSERT INTO Company_Employee_Mapping(Company_ID, Employee_ID) 
                             VALUES (Company_Info_ID_fk2.NEXTVAL, Employee_Info_ID_fk1.NEXTVAL);

INSERT INTO Company_Employee_Mapping(Company_ID, Employee_ID) 
                             VALUES (Company_Info_ID_fk2.NEXTVAL, Employee_Info_ID_fk1.NEXTVAL);

INSERT INTO Company_Employee_Mapping(Company_ID, Employee_ID) 
                              VALUES (Company_Info_ID_fk2.NEXTVAL, Employee_Info_ID_fk1.NEXTVAL);

INSERT INTO Company_Employee_Mapping(Company_ID, Employee_ID) 
                             VALUES (Company_Info_ID_fk2.NEXTVAL, Employee_Info_ID_fk1.NEXTVAL);







-- Group Function
SELECT BUS_NUM, COUNT(*) AS Conductor_Count
FROM Conductor_Info
GROUP BY BUS_NUM;


SELECT Passenger_ID, COUNT(*) AS Total_Tickets, SUM(TOTAL_PRICE) AS Total_Payments
FROM Payment
GROUP BY Passenger_ID
HAVING SUM(TOTAL_PRICE) > 100;





-- Sub query
SELECT ID, NAME, PHN_NUM1 AS "PHONE NUMBER", 
       (SELECT TO_CHAR(TO_DATE(MONTH||'/'||DAY||'/'||YEAR,'MM/DD/YYYY'),'Month DD, YYYY')
        FROM Conductor_DOB
        WHERE Conductor_DOB.ID = Conductor_Info.Conductor_DOB_ID) AS DOB,
       (SELECT STREET_NUM||' '||STREET_NAME||', '||CITY||', '||COUNTRY
        FROM Conductor_Address
        WHERE Conductor_Address.ID = Conductor_Info.Conductor_Address_ID) AS ADDRESS
FROM Conductor_Info;



SELECT Employee_Info.ID, Employee_Info.NAME, Employee_Info.TYPE
FROM Employee_Info
WHERE Employee_Info.ID IN 
(SELECT Company_Employee_Mapping.Employee_ID
FROM Company_Employee_Mapping, Company_Info
WHERE Company_Employee_Mapping.Company_ID = Company_Info.ID
AND Company_Info.NAME != 'DRL Coachlines');




-- Joining
SELECT D1.NAME, D1.PHN_NUM1,D2.CITY, D2.COUNTRY
FROM Driver_Info D1, Driver_Address D2
WHERE D1.Driver_Address_ID = D2.ID;


SELECT C1.NAME, C1.PHN_NUM1, C2.CITY, C2.COUNTRY
FROM Conductor_Info C1, Conductor_Address C2
WHERE C1.Conductor_Address_ID = C2.ID;


SELECT S1.NAME, S1.PHN_NUM1, S2.CITY, S2.COUNTRY
FROM Supervisor_Info S1, Supervisor_Address S2
WHERE S1.Supervisor_Address_ID = S2.ID;




-- View
CREATE VIEW Driver_Information AS 
SELECT Driver_Info.NAME, Driver_Info.PHN_NUM1, Driver_Info.PHN_NUM2, Driver_DOB.DAY, Driver_DOB.MONTH, Driver_DOB.YEAR, Driver_Address.STREET_NUM, Driver_Address.STREET_NAME, Driver_Address.APARTMENT_NUM, Driver_Address.APARTMENT_NAME, Driver_Address.CITY, Driver_Address.COUNTRY, Driver_Address.ZIP_CODE
FROM Driver_Info
INNER JOIN Driver_DOB ON Driver_Info.Driver_DOB_ID = Driver_DOB.ID
INNER JOIN Driver_Address ON Driver_Info.Driver_Address_ID = Driver_Address.ID;

SELECT * from Driver_Information;




CREATE VIEW Conductor_Information AS 
SELECT Conductor_Info.NAME, Conductor_Info.PHN_NUM1, Conductor_Info.PHN_NUM2, Conductor_DOB.DAY, Conductor_DOB.MONTH, Conductor_DOB.YEAR, 
 Conductor_Address.STREET_NUM, Conductor_Address.STREET_NAME, Conductor_Address.APARTMENT_NUM, Conductor_Address.APARTMENT_NAME, Conductor_Address.CITY, Conductor_Address.COUNTRY, Conductor_Address.ZIP_CODE
FROM Conductor_Info
INNER JOIN Conductor_DOB ON Conductor_Info.Conductor_DOB_ID = Conductor_DOB.ID
INNER JOIN Conductor_Address ON Conductor_Info.Conductor_Address_ID = Conductor_Address.ID;

SELECT * from Conductor_Information;




CREATE VIEW Supervisor_Information AS 
SELECT Supervisor_Info.NAME, Supervisor_Info.PHN_NUM1, Supervisor_Info.PHN_NUM2, Supervisor_DOB.DAY, Supervisor_DOB.MONTH, Supervisor_DOB.YEAR, 
 Supervisor_Address.STREET_NUM, Supervisor_Address.STREET_NAME, Supervisor_Address.APARTMENT_NUM, Supervisor_Address.APARTMENT_NAME, Supervisor_Address.CITY, Supervisor_Address.COUNTRY, Supervisor_Address.ZIP_CODE
FROM Supervisor_Info
INNER JOIN Supervisor_DOB ON Supervisor_Info.Supervisor_DOB_ID = Supervisor_DOB.ID
INNER JOIN Supervisor_Address ON Supervisor_Info.Supervisor_Address_ID = Supervisor_Address.ID;

SELECT * from Supervisor_Information;


 

-- Relational Algebra
Find the PASSENGER NAME WHERE the total price is more than 1000 from Passenger_info Table.
π(NAME) (σ(TOTAL_PRICE > 1000) (Payment ⨝ Passenger_Info))




