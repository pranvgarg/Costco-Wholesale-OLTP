-- Set the dataset
CREATE SCHEMA IF NOT EXISTS `famous-smithy-443003-b3.customer_management_system`;

-- Membership Table
CREATE TABLE IF NOT EXISTS `famous-smithy-443003-b3.customer_management_system.Membership` (
  `Membership_ID` STRING NOT NULL, -- Primary key
  `Type` STRING NOT NULL, -- Membership type (e.g., Gold, Silver)
  `Price` FLOAT64 NOT NULL, -- Membership price
  `Annual_Reward` INT64 NOT NULL, -- Reward points
  `Discount` FLOAT64, -- Discount percentage
  PRIMARY KEY (`Membership_ID`) NOT ENFORCED -- Logical primary key
);

-- Customers Table
CREATE TABLE IF NOT EXISTS `famous-smithy-443003-b3.customer_management_system.Customers` (
  `Customer_ID` STRING NOT NULL, -- Primary key
  `Membership_ID` STRING, -- Foreign key to Membership
  `FirstName` STRING NOT NULL, -- Customer first name
  `MiddleName` STRING, -- Customer middle name
  `LastName` STRING NOT NULL, -- Customer last name
  `Sex` STRING NOT NULL, -- Gender
  `Date_of_Birth` DATE NOT NULL, -- Date of birth
  `Date_Joined` DATE NOT NULL, -- Joining date
  `Membership_Renewal_Date` DATE, -- Membership renewal date
  PRIMARY KEY (`Customer_ID`) NOT ENFORCED, -- Logical primary key
  FOREIGN KEY (`Membership_ID`) REFERENCES `famous-smithy-443003-b3.customer_management_system.Membership` (`Membership_ID`) NOT ENFORCED -- Logical foreign key
);

-- Costco Card Table
CREATE TABLE IF NOT EXISTS `famous-smithy-443003-b3.customer_management_system.Costco_Card` (
  `Card_ID` INT64 NOT NULL, -- Primary key
  `Customer_ID` STRING NOT NULL, -- Foreign key to Customers
  `Active` BOOLEAN NOT NULL, -- Card status
  `Date_Opened` DATE NOT NULL, -- Issuance date
  `Expiration_Date` DATE NOT NULL, -- Expiration date
  `Profile_Picture` STRING, -- Profile picture URL
  PRIMARY KEY (`Card_ID`) NOT ENFORCED, -- Logical primary key
  FOREIGN KEY (`Customer_ID`) REFERENCES `famous-smithy-443003-b3.customer_management_system.Customers` (`Customer_ID`) NOT ENFORCED -- Logical foreign key
);

-- Customer Membership Card Bridge Table
CREATE TABLE IF NOT EXISTS `famous-smithy-443003-b3.customer_management_system.Customer_Membership_Card_Bridge` (
  `Customer_ID` STRING NOT NULL, -- Foreign key to Customers
  `Membership_ID` STRING NOT NULL, -- Foreign key to Membership
  `Card_ID` INT64 NOT NULL, -- Foreign key to Costco_Card
  PRIMARY KEY (`Customer_ID`, `Membership_ID`, `Card_ID`) NOT ENFORCED, -- Composite primary key
  FOREIGN KEY (`Membership_ID`) REFERENCES `famous-smithy-443003-b3.customer_management_system.Membership` (`Membership_ID`) NOT ENFORCED, -- Logical foreign key
  FOREIGN KEY (`Card_ID`) REFERENCES `famous-smithy-443003-b3.customer_management_system.Costco_Card` (`Card_ID`) NOT ENFORCED, -- Logical foreign key
  FOREIGN KEY (`Customer_ID`) REFERENCES `famous-smithy-443003-b3.customer_management_system.Customers` (`Customer_ID`) NOT ENFORCED -- Logical foreign key
);

INSERT INTO `famous-smithy-443003-b3.customer_management_system.Membership`
(Membership_ID, Type, Price, Annual_Reward, Discount)
VALUES
("M001", "Gold", 150.00, 500, 10),
("M002", "Silver", 100.00, 300, 5),
("M003", "Platinum", 200.00, 1000, 15),
("M004", "Bronze", 80.00, 200, 3),
("M005", "Gold", 150.00, 500, 10),
("M006", "Silver", 100.00, 300, 5),
("M007", "Platinum", 200.00, 1000, 15),
("M008", "Bronze", 80.00, 200, 3),
("M009", "Gold", 150.00, 500, 10),
("M010", "Silver", 100.00, 300, 5),
("M011", "Platinum", 200.00, 1000, 15),
("M012", "Bronze", 80.00, 200, 3),
("M013", "Gold", 150.00, 500, 10),
("M014", "Silver", 100.00, 300, 5),
("M015", "Platinum", 200.00, 1000, 15),
("M016", "Bronze", 80.00, 200, 3),
("M017", "Gold", 150.00, 500, 10),
("M018", "Silver", 100.00, 300, 5),
("M019", "Platinum", 200.00, 1000, 15),
("M020", "Bronze", 80.00, 200, 3),
("M021", "Gold", 150.00, 500, 10),
("M022", "Silver", 100.00, 300, 5),
("M023", "Platinum", 200.00, 1000, 15),
("M024", "Bronze", 80.00, 200, 3),
("M025", "Gold", 150.00, 500, 10),
("M026", "Silver", 100.00, 300, 5),
("M027", "Platinum", 200.00, 1000, 15),
("M028", "Bronze", 80.00, 200, 3),
("M029", "Gold", 150.00, 500, 10),
("M030", "Silver", 100.00, 300, 5);


INSERT INTO `famous-smithy-443003-b3.customer_management_system.Customers`
(Customer_ID, Membership_ID, FirstName, MiddleName, LastName, Sex, Date_of_Birth, Date_Joined, Membership_Renewal_Date)
VALUES
("C001", "M001", "John", NULL, "Doe", "Male", "1985-06-15", "2020-01-01", "2024-01-01"),
("C002", "M002", "Jane", NULL, "Smith", "Female", "1990-07-20", "2021-05-10", "2025-05-10"),
("C003", "M003", "Alice", NULL, "Johnson", "Female", "1992-11-25", "2022-03-15", "2026-03-15"),
("C004", "M004", "Bob", NULL, "Brown", "Male", "1987-02-10", "2019-06-01", "2023-06-01"),
("C005", "M005", "Charlie", NULL, "Davis", "Non-binary", "1995-09-18", "2020-08-10", "2024-08-10"),
("C006", "M006", "David", NULL, "Garcia", "Male", "1989-03-05", "2021-04-22", "2025-04-22"),
("C007", "M007", "Emily", NULL, "Martinez", "Female", "1994-01-15", "2022-07-30", "2026-07-30"),
("C008", "M008", "Frank", NULL, "Lopez", "Male", "1988-10-10", "2020-11-11", "2024-11-11"),
("C009", "M009", "Grace", NULL, "Gonzalez", "Female", "1993-05-22", "2021-03-09", "2025-03-09"),
("C010", "M010", "Hannah", NULL, "Wilson", "Female", "1996-08-14", "2022-12-01", "2026-12-01"),
("C011", "M011", "Ian", NULL, "Anderson", "Male", "1980-04-25", "2019-09-01", "2023-09-01"),
("C012", "M012", "Jack", NULL, "Thomas", "Male", "1984-12-12", "2020-02-05", "2024-02-05"),
("C013", "M013", "Karen", NULL, "Taylor", "Female", "1986-03-16", "2021-06-20", "2025-06-20"),
("C014", "M014", "Larry", NULL, "Moore", "Male", "1983-07-08", "2022-09-30", "2026-09-30"),
("C015", "M015", "Megan", NULL, "Jackson", "Female", "1981-01-19", "2018-05-15", "2022-05-15"),
("C016", "M016", "Nathan", NULL, "White", "Male", "1982-06-28", "2019-07-07", "2023-07-07"),
("C017", "M017", "Olivia", NULL, "Harris", "Female", "1988-12-21", "2020-10-25", "2024-10-25"),
("C018", "M018", "Paul", NULL, "Martin", "Male", "1985-09-30", "2021-01-13", "2025-01-13"),
("C019", "M019", "Quincy", NULL, "Clark", "Male", "1991-03-22", "2022-02-16", "2026-02-16"),
("C020", "M020", "Rachel", NULL, "Rodriguez", "Female", "1997-11-10", "2020-03-29", "2024-03-29"),
("C021", "M021", "Sam", NULL, "Lewis", "Male", "1990-01-01", "2019-04-05", "2023-04-05"),
("C022", "M022", "Tina", NULL, "Walker", "Female", "1994-12-20", "2020-09-10", "2024-09-10"),
("C023", "M023", "Uma", NULL, "Hall", "Female", "1993-10-15", "2021-11-01", "2025-11-01"),
("C024", "M024", "Victor", NULL, "Allen", "Male", "1987-08-08", "2022-06-12", "2026-06-12"),
("C025", "M025", "Wendy", NULL, "Young", "Female", "1989-04-04", "2019-01-15", "2023-01-15"),
("C026", "M026", "Xander", NULL, "King", "Male", "1995-05-05", "2020-12-03", "2024-12-03"),
("C027", "M027", "Yara", NULL, "Scott", "Female", "1998-02-02", "2021-05-23", "2025-05-23"),
("C028", "M028", "Zoe", NULL, "Adams", "Female", "1992-07-07", "2022-03-01", "2026-03-01"),
("C029", "M029", "Andrew", NULL, "Baker", "Male", "1999-06-06", "2020-06-06", "2024-06-06"),
("C030", "M030", "Beth", NULL, "Miller", "Female", "1991-01-01", "2019-02-15", "2023-02-15");


INSERT INTO `famous-smithy-443003-b3.customer_management_system.Costco_Card`
(Card_ID, Customer_ID, Active, Date_Opened, Expiration_Date, Profile_Picture)
VALUES
(1001, "C001", TRUE, "2020-01-01", "2024-01-01", "https://example.com/profile1.jpg"),
(1002, "C002", TRUE, "2021-05-10", "2025-05-10", "https://example.com/profile2.jpg"),
(1003, "C003", TRUE, "2022-03-15", "2026-03-15", "https://example.com/profile3.jpg"),
(1004, "C004", TRUE, "2019-06-01", "2023-06-01", "https://example.com/profile4.jpg"),
(1005, "C005", FALSE, "2020-08-10", "2024-08-10", "https://example.com/profile5.jpg"),
(1006, "C006", TRUE, "2021-04-22", "2025-04-22", "https://example.com/profile6.jpg"),
(1007, "C007", TRUE, "2022-07-30", "2026-07-30", "https://example.com/profile7.jpg"),
(1008, "C008", TRUE, "2020-11-11", "2024-11-11", "https://example.com/profile8.jpg"),
(1009, "C009", FALSE, "2021-03-09", "2025-03-09", "https://example.com/profile9.jpg"),
(1010, "C010", TRUE, "2022-12-01", "2026-12-01", "https://example.com/profile10.jpg"),
(1011, "C011", TRUE, "2019-09-01", "2023-09-01", "https://example.com/profile11.jpg"),
(1012, "C012", TRUE, "2020-02-05", "2024-02-05", "https://example.com/profile12.jpg"),
(1013, "C013", TRUE, "2021-06-20", "2025-06-20", "https://example.com/profile13.jpg"),
(1014, "C014", TRUE, "2022-09-30", "2026-09-30", "https://example.com/profile14.jpg"),
(1015, "C015", TRUE, "2018-05-15", "2022-05-15", "https://example.com/profile15.jpg"),
(1016, "C016", TRUE, "2019-07-07", "2023-07-07", "https://example.com/profile16.jpg"),
(1017, "C017", TRUE, "2020-10-25", "2024-10-25", "https://example.com/profile17.jpg"),
(1018, "C018", TRUE, "2021-01-13", "2025-01-13", "https://example.com/profile18.jpg"),
(1019, "C019", TRUE, "2022-02-16", "2026-02-16", "https://example.com/profile19.jpg"),
(1020, "C020", FALSE, "2020-03-29", "2024-03-29", "https://example.com/profile20.jpg"),
(1021, "C021", TRUE, "2019-04-05", "2023-04-05", "https://example.com/profile21.jpg"),
(1022, "C022", TRUE, "2020-09-10", "2024-09-10", "https://example.com/profile22.jpg"),
(1023, "C023", TRUE, "2021-11-01", "2025-11-01", "https://example.com/profile23.jpg"),
(1024, "C024", TRUE, "2022-06-12", "2026-06-12", "https://example.com/profile24.jpg"),
(1025, "C025", TRUE, "2019-01-15", "2023-01-15", "https://example.com/profile25.jpg"),
(1026, "C026", TRUE, "2020-12-03", "2024-12-03", "https://example.com/profile26.jpg"),
(1027, "C027", TRUE, "2021-05-23", "2025-05-23", "https://example.com/profile27.jpg"),
(1028, "C028", TRUE, "2022-03-01", "2026-03-01", "https://example.com/profile28.jpg"),
(1029, "C029", TRUE, "2020-06-06", "2024-06-06", "https://example.com/profile29.jpg"),
(1030, "C030", TRUE, "2019-02-15", "2023-02-15", "https://example.com/profile30.jpg");



INSERT INTO `famous-smithy-443003-b3.customer_management_system.Customer_Membership_Card_Bridge`
(Customer_ID, Membership_ID, Card_ID)
VALUES
("C001", "M001", 1001),
("C002", "M002", 1002),
("C003", "M003", 1003),
("C004", "M004", 1004),
("C005", "M005", 1005),
("C006", "M006", 1006),
("C007", "M007", 1007),
("C008", "M008", 1008),
("C009", "M009", 1009),
("C010", "M010", 1010),
("C011", "M011", 1011),
("C012", "M012", 1012),
("C013", "M013", 1013),
("C014", "M014", 1014),
("C015", "M015", 1015),
("C016", "M016", 1016),
("C017", "M017", 1017),
("C018", "M018", 1018),
("C019", "M019", 1019),
("C020", "M020", 1020),
("C021", "M021", 1021),
("C022", "M022", 1022),
("C023", "M023", 1023),
("C024", "M024", 1024),
("C025", "M025", 1025),
("C026", "M026", 1026),
("C027", "M027", 1027),
("C028", "M028", 1028),
("C029", "M029", 1029),
("C030", "M030", 1030);

