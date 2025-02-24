-- DDL
-- CREATE TABLES WITHOUT FOREIGN KEYS
-- Create Tables
CREATE TABLE "Payment_Methods" (
  "Payment_Type_ID" NUMBER PRIMARY KEY,
  "Name" VARCHAR2(100) NOT NULL
);

CREATE TABLE "Memberships" (
  "Membership_ID" NUMBER PRIMARY KEY,
  "Name" VARCHAR2(100) NOT NULL,
  "Price" NUMBER(10, 2) NOT NULL CHECK ("Price" >= 0),
  "Annual_Reward" NUMBER(10, 2) DEFAULT 0 CHECK ("Annual_Reward" >= 0),
  "Discount" NUMBER(5, 2) DEFAULT 0 CHECK ("Discount" >= 0)
);

CREATE TABLE "Customers" (
  "Customer_ID" NUMBER PRIMARY KEY,
  "FirstName" VARCHAR2(100) NOT NULL,
  "MiddleName" VARCHAR2(100),
  "LastName" VARCHAR2(100) NOT NULL,
  "Sex" CHAR(1) CHECK ("Sex" IN ('M', 'F', 'O')), -- M=Male, F=Female, O=Other
  "Date_of_Birth" DATE NOT NULL,
  "Date_Joined" DATE NOT NULL,
  "Membership_Renewal_Date" DATE
);

CREATE TABLE "Payment" (
  "Payment_Method_ID" NUMBER PRIMARY KEY,
  "Payment_Type_ID" NUMBER,
  "Customer_ID" NUMBER,
  "Card_Number" VARCHAR2(16) NOT NULL CHECK (REGEXP_LIKE("Card_Number", '^\d{16}$')), -- 16-digit card number
  "Expiration_Date" DATE NOT NULL,
  "Security_Code" VARCHAR2(4) NOT NULL CHECK (REGEXP_LIKE("Security_Code", '^\d{3,4}$')) -- 3 or 4 digit security code
);

CREATE TABLE "Costco_Membership_Cards" (
  "Card_ID" NUMBER PRIMARY KEY,
  "Customer_ID" NUMBER,
  "Membership_ID" NUMBER,
  "Active" CHAR(1) DEFAULT 'Y' CHECK ("Active" IN ('Y', 'N')), -- Y=Yes, N=No
  "Date_Opened" DATE NOT NULL,
  "Expiration_Date" DATE NOT NULL,
  "Profile_Picture" BLOB
);

-- Add Foreign Key Constraints
ALTER TABLE "Payment"
ADD CONSTRAINT "FK_Payment_Payment_Type_ID"
FOREIGN KEY ("Payment_Type_ID") REFERENCES "Payment_Methods"("Payment_Type_ID");

ALTER TABLE "Payment"
ADD CONSTRAINT "FK_Payment_Customer_ID"
FOREIGN KEY ("Customer_ID") REFERENCES "Customers"("Customer_ID");

ALTER TABLE "Costco_Membership_Cards"
ADD CONSTRAINT "FK_Costco_Membership_Cards_Customer_ID"
FOREIGN KEY ("Customer_ID") REFERENCES "Customers"("Customer_ID");

ALTER TABLE "Costco_Membership_Cards"
ADD CONSTRAINT "FK_Costco_Membership_Cards_Membership_ID"
FOREIGN KEY ("Membership_ID") REFERENCES "Memberships"("Membership_ID");

-- Insert Rows
INSERT INTO "Payment_Methods" ("Payment_Type_ID", "Name")
VALUES (1, 'Credit Card');

INSERT INTO "Payment_Methods" ("Payment_Type_ID", "Name")
VALUES (2, 'Debit Card');

INSERT INTO "Payment_Methods" ("Payment_Type_ID", "Name")
VALUES (3, 'Cash');


INSERT INTO "Memberships" ("Membership_ID", "Name", "Price", "Annual_Reward", "Discount")
VALUES (1, 'Gold', 60.00, 10.00, 5.00);

INSERT INTO "Memberships" ("Membership_ID", "Name", "Price", "Annual_Reward", "Discount")
VALUES (2, 'Executive', 120.00, 20.00, 10.00);

INSERT INTO "Memberships" ("Membership_ID", "Name", "Price", "Annual_Reward", "Discount")
VALUES (3, 'Basic', 30.00, 5.00, 2.50);


INSERT INTO "Customers" ("Customer_ID", "FirstName", "MiddleName", "LastName", "Sex", "Date_of_Birth", "Date_Joined", "Membership_Renewal_Date")
VALUES (1, 'John', 'A', 'Doe', 'M', DATE '1990-01-01', DATE '2020-01-15', DATE '2024-01-15');

INSERT INTO "Customers" ("Customer_ID", "FirstName", "MiddleName", "LastName", "Sex", "Date_of_Birth", "Date_Joined", "Membership_Renewal_Date")
VALUES (2, 'Jane', NULL, 'Smith', 'F', DATE '1985-05-20', DATE '2021-03-10', DATE '2024-03-10');

INSERT INTO "Customers" ("Customer_ID", "FirstName", "MiddleName", "LastName", "Sex", "Date_of_Birth", "Date_Joined", "Membership_Renewal_Date")
VALUES (3, 'Alex', 'B', 'Johnson', 'O', DATE '2000-07-15', DATE '2022-07-01', DATE '2024-07-01');


INSERT INTO "Payment" ("Payment_Method_ID", "Payment_Type_ID", "Customer_ID", "Card_Number", "Expiration_Date", "Security_Code")
VALUES (1, 1, 1, '1234567812345678', DATE '2025-01-31', '123');

INSERT INTO "Payment" ("Payment_Method_ID", "Payment_Type_ID", "Customer_ID", "Card_Number", "Expiration_Date", "Security_Code")
VALUES (2, 2, 2, '8765432187654321', DATE '2026-06-30', '456');

INSERT INTO "Payment" ("Payment_Method_ID", "Payment_Type_ID", "Customer_ID", "Card_Number", "Expiration_Date", "Security_Code")
VALUES (3, 1, 3, '1111222233334444', DATE '2027-12-31', '789');


INSERT INTO "Costco_Membership_Cards" ("Card_ID", "Customer_ID", "Membership_ID", "Active", "Date_Opened", "Expiration_Date", "Profile_Picture")
VALUES (1, 1, 1, 'Y', DATE '2020-01-15', DATE '2024-01-15', NULL);

INSERT INTO "Costco_Membership_Cards" ("Card_ID", "Customer_ID", "Membership_ID", "Active", "Date_Opened", "Expiration_Date", "Profile_Picture")
VALUES (2, 2, 2, 'Y', DATE '2021-03-10', DATE '2024-03-10', NULL);

INSERT INTO "Costco_Membership_Cards" ("Card_ID", "Customer_ID", "Membership_ID", "Active", "Date_Opened", "Expiration_Date", "Profile_Picture")
VALUES (3, 3, 3, 'Y', DATE '2022-07-01', DATE '2024-07-01', NULL);

