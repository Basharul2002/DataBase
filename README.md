# 🌟 Database Project Queries

## 📖 Introduction

Welcome to the **Database Project Queries** repository! This collection features SQL queries used for developing and managing a relational database designed for **[Bus Ticket Management System]**. The project aims to streamline operations related to transportation services, focusing on managing drivers, conductors, supervisors, and passengers.

## 📝 Scenario Description

The database is structured to efficiently handle various aspects of a transportation service, including:

- **Driver Management**: Information storage regarding drivers, including personal details.
- **Conductor Management**: Oversight of conductors and their essential data.
- **Supervisor Management**: Management of supervisor information.
- **Company Information**: Details related to the transportation company.
- **Bus and Schedule Management**: Bus details and scheduling information.
- **Passenger Management**: Data on passengers and their ticketing.
- **Payment Processing**: Handling payments for tickets purchased.

## 🗺️ ER Diagram

![ER Diagram](path/to/your/er_diagram.png)

## 📊 Schema Design

### Tables Overview

| Table Name                | Description                                                  |
|---------------------------|--------------------------------------------------------------|
| **Driver_Info**           | Stores driver details.                                      |
| **Conductor_Info**        | Contains conductor information.                             |
| **Supervisor_Info**       | Manages supervisor data.                                   |
| **Company_Info**          | Holds transportation company information.                  |
| **Bus_Info**              | Information about buses.                                   |
| **Schedule**              | Manages bus schedules.                                     |
| **Passenger_Info**        | Details about passengers.                                  |
| **Payment**               | Payment transaction records.                               |
| **Ticket**                | Ticketing information.                                     |
| **Employee_Info**         | Data on company employees.                                 |
| **Company_Employee_Mapping** | Links employees to companies.                          |

## 💻 Queries

### Data Insertion Queries

```sql
-- Insert Driver DOB
INSERT INTO Driver_DOB (ID, DAY, MONTH, YEAR) VALUES (Driver_DOB_ID.NEXTVAL, 1, 1, 1980);

-- Insert Driver Address
INSERT INTO Driver_Address (ID, STREET_NUM, STREET_NAME, APARTMENT_NUM, APARTMENT_NAME, CITY, ZIP_CODE, COUNTRY) 
VALUES (Driver_Address_ID.NEXTVAL, 135, 'Mirpur Stadium', 67, 'Atwood Apartments', 'Dhaka', '1200', 'Bangladesh');

-- Insert Company Address
INSERT INTO Company_Address (ID, STREET_NUM, STREET_NAME, CITY, COUNTRY) 
VALUES (Company_Address_ID.NEXTVAL, 82, 'Unter den Linden', 'Berlin',  'Germany');

-- Insert into Company Info
INSERT INTO Company_Info (ID, NAME, Company_Address_ID) 
VALUES (Company_Info_ID.NEXTVAL, 'Flixbus', Company_Address_ID_fk1.NEXTVAL);
```

### Group Function Queries

```sql
-- Count Conductors by Bus
SELECT BUS_NUM, COUNT(*) AS Conductor_Count
FROM Conductor_Info
GROUP BY BUS_NUM;

-- Total Tickets and Payments by Passenger
SELECT Passenger_ID, COUNT(*) AS Total_Tickets, SUM(TOTAL_PRICE) AS Total_Payments
FROM Payment
GROUP BY Passenger_ID
HAVING SUM(TOTAL_PRICE) > 100;
```

### Subquery Queries

```sql
-- Select Conductor Information with Address
SELECT ID, NAME, PHN_NUM1 AS "PHONE NUMBER", 
       (SELECT TO_CHAR(TO_DATE(MONTH||'/'||DAY||'/'||YEAR,'MM/DD/YYYY'),'Month DD, YYYY')
        FROM Conductor_DOB
        WHERE Conductor_DOB.ID = Conductor_Info.Conductor_DOB_ID) AS DOB,
       (SELECT STREET_NUM||' '||STREET_NAME||', '||CITY||', '||COUNTRY
        FROM Conductor_Address
        WHERE Conductor_Address.ID = Conductor_Info.Conductor_Address_ID) AS ADDRESS
FROM Conductor_Info;
```

### Joining Queries

```sql
-- Joining Driver and Address Information
SELECT D1.NAME, D1.PHN_NUM1, D2.CITY, D2.COUNTRY
FROM Driver_Info D1
JOIN Driver_Address D2 ON D1.Driver_Address_ID = D2.ID;

-- Joining Conductor and Address Information
SELECT C1.NAME, C1.PHN_NUM1, C2.CITY, C2.COUNTRY
FROM Conductor_Info C1
JOIN Conductor_Address C2 ON C1.Conductor_Address_ID = C2.ID;
```

### View Creation Queries

```sql
-- Create Driver Information View
CREATE VIEW Driver_Information AS 
SELECT Driver_Info.NAME, Driver_Info.PHN_NUM1, Driver_Info.PHN_NUM2, Driver_DOB.DAY, Driver_DOB.MONTH, 
Driver_DOB.YEAR, Driver_Address.STREET_NUM, Driver_Address.STREET_NAME, Driver_Address.APARTMENT_NUM, 
Driver_Address.APARTMENT_NAME, Driver_Address.CITY, Driver_Address.COUNTRY, Driver_Address.ZIP_CODE
FROM Driver_Info
JOIN Driver_DOB ON Driver_Info.Driver_DOB_ID = Driver_DOB.ID
JOIN Driver_Address ON Driver_Info.Driver_Address_ID = Driver_Address.ID;

-- Query the Driver Information View
SELECT * FROM Driver_Information;
```

## 🎉 Conclusion

This repository serves as a comprehensive resource for SQL queries used in managing and manipulating our transportation service database. Each query is meticulously crafted to enhance data handling across various tables.

For questions, contributions, or collaborations, feel free to reach out! 😊

---

### Enhancements Made:
1. **Emojis**: Added relevant emojis to headers for visual appeal.
2. **Tables**: Used tables to organize schema design information.
3. **Code Blocks**: Enhanced the code blocks for clarity and easy reading.
4. **Headers and Sections**: Used clear headers and sections for better navigation.
5. **Styling**: Applied consistent markdown styling for a clean look.

Feel free to modify any section to better fit your project's specifics!
