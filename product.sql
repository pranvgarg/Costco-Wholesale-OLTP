-- DDL
-- CREATE TABLES WITHOUT FOREIGN KEYS
CREATE TABLE "Distribution_Centers" (
  "Distribution_Center_ID" NUMBER PRIMARY KEY,
  "Product_ID" NUMBER,
  "Street" VARCHAR2(255) NOT NULL,
  "City" VARCHAR2(100) NOT NULL,
  "State" VARCHAR2(50) NOT NULL CHECK (LENGTH("State") = 2),
  "Zipcode" VARCHAR2(10) CHECK (REGEXP_LIKE("Zipcode", '^\d{5}(-\d{4})?$'))
);

CREATE TABLE "Suppliers" (
  "Supplier_ID" NUMBER PRIMARY KEY,
  "Name" VARCHAR2(100) NOT NULL,
  "Contact_Name" VARCHAR2(100) NOT NULL,
  "Contact_Email" VARCHAR2(255) NOT NULL CHECK (REGEXP_LIKE("Contact_Email", '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')),
  "Phone_Number" VARCHAR2(15) NOT NULL CHECK (REGEXP_LIKE("Phone_Number", '^\+?[0-9]{10,15}$'))
);

CREATE TABLE "Products" (
  "Product_ID" NUMBER PRIMARY KEY,
  "Name" VARCHAR2(100) NOT NULL,
  "Description" VARCHAR2(255),
  "Price" NUMBER(10, 2) NOT NULL CHECK ("Price" >= 0),
  "Supplier_ID" NUMBER
);

CREATE TABLE "Distribution_Center_Inventory" (
  "Distribution_Center_ID" NUMBER,
  "Product_ID" NUMBER,
  "Quantity" NUMBER NOT NULL CHECK ("Quantity" >= 0),
  PRIMARY KEY ("Distribution_Center_ID", "Product_ID")
);

CREATE TABLE "Warehouses" (
  "Warehouse_ID" NUMBER PRIMARY KEY,
  "Distribution_Center_ID" NUMBER,
  "Street" VARCHAR2(255) NOT NULL,
  "City" VARCHAR2(100) NOT NULL,
  "State" VARCHAR2(50) NOT NULL CHECK (LENGTH("State") = 2),
  "Zipcode" VARCHAR2(10) CHECK (REGEXP_LIKE("Zipcode", '^\d{5}(-\d{4})?$'))
);

CREATE TABLE "Warehouse_Inventory" (
  "Warehouse_ID" NUMBER,
  "Product_ID" NUMBER,
  "Number_in_Stock" NUMBER NOT NULL CHECK ("Number_in_Stock" >= 0),
  PRIMARY KEY ("Warehouse_ID", "Product_ID")
);

-- ADD FOREIGN KEY CONSTRAINTS
ALTER TABLE "Distribution_Centers"
ADD CONSTRAINT "FK_Distribution_Centers_Product_ID"
FOREIGN KEY ("Product_ID") REFERENCES "Products"("Product_ID");

ALTER TABLE "Products"
ADD CONSTRAINT "FK_Products_Supplier_ID"
FOREIGN KEY ("Supplier_ID") REFERENCES "Suppliers"("Supplier_ID");

ALTER TABLE "Distribution_Center_Inventory"
ADD CONSTRAINT "FK_Dist_Center_Inventory_Dist_Center_ID"
FOREIGN KEY ("Distribution_Center_ID") REFERENCES "Distribution_Centers"("Distribution_Center_ID");

ALTER TABLE "Distribution_Center_Inventory"
ADD CONSTRAINT "FK_Dist_Center_Inventory_Product_ID"
FOREIGN KEY ("Product_ID") REFERENCES "Products"("Product_ID");

ALTER TABLE "Warehouses"
ADD CONSTRAINT "FK_Warehouses_Distribution_Center_ID"
FOREIGN KEY ("Distribution_Center_ID") REFERENCES "Distribution_Centers"("Distribution_Center_ID");

ALTER TABLE "Warehouse_Inventory"
ADD CONSTRAINT "FK_Warehouse_Inventory_Warehouse_ID"
FOREIGN KEY ("Warehouse_ID") REFERENCES "Warehouses"("Warehouse_ID");

ALTER TABLE "Warehouse_Inventory"
ADD CONSTRAINT "FK_Warehouse_Inventory_Product_ID"
FOREIGN KEY ("Product_ID") REFERENCES "Products"("Product_ID");

--Insert Rows
-- Insert into Suppliers
INSERT INTO "Suppliers" ("Supplier_ID", "Name", "Contact_Name", "Contact_Email", "Phone_Number")
VALUES (1, 'Global Supplies Inc.', 'Alice Smith', 'alice.smith@globalsupplies.com', '+1234567890');

INSERT INTO "Suppliers" ("Supplier_ID", "Name", "Contact_Name", "Contact_Email", "Phone_Number")
VALUES (2, 'Tech World', 'Bob Johnson', 'bob.johnson@techworld.com', '+9876543210');

INSERT INTO "Suppliers" ("Supplier_ID", "Name", "Contact_Name", "Contact_Email", "Phone_Number")
VALUES (3, 'Green Goods Co.', 'Charlie Brown', 'charlie.brown@greengoods.com', '+1122334455');

-- Insert into Products
INSERT INTO "Products" ("Product_ID", "Name", "Description", "Price", "Supplier_ID")
VALUES (101, 'Laptop', 'High-performance laptop', 1200.50, 2);

INSERT INTO "Products" ("Product_ID", "Name", "Description", "Price", "Supplier_ID")
VALUES (102, 'Office Chair', 'Ergonomic chair for offices', 200.00, 1);

INSERT INTO "Products" ("Product_ID", "Name", "Description", "Price", "Supplier_ID")
VALUES (103, 'LED Light Bulb', 'Energy-efficient light bulb', 15.75, 3);

-- Insert into Distribution_Centers
INSERT INTO "Distribution_Centers" ("Distribution_Center_ID", "Product_ID", "Street", "City", "State", "Zipcode")
VALUES (1, 101, '123 Main St', 'Los Angeles', 'CA', '90001');

INSERT INTO "Distribution_Centers" ("Distribution_Center_ID", "Product_ID", "Street", "City", "State", "Zipcode")
VALUES (2, 102, '456 Elm St', 'Dallas', 'TX', '75201');

INSERT INTO "Distribution_Centers" ("Distribution_Center_ID", "Product_ID", "Street", "City", "State", "Zipcode")
VALUES (3, 103, '789 Oak St', 'Chicago', 'IL', '60601');

-- Insert into Distribution_Center_Inventory
INSERT INTO "Distribution_Center_Inventory" ("Distribution_Center_ID", "Product_ID", "Quantity")
VALUES (1, 101, 500);

INSERT INTO "Distribution_Center_Inventory" ("Distribution_Center_ID", "Product_ID", "Quantity")
VALUES (2, 102, 300);

INSERT INTO "Distribution_Center_Inventory" ("Distribution_Center_ID", "Product_ID", "Quantity")
VALUES (3, 103, 200);

-- Insert into Warehouses
INSERT INTO "Warehouses" ("Warehouse_ID", "Distribution_Center_ID", "Street", "City", "State", "Zipcode")
VALUES (10, 1, '321 Maple St', 'Seattle', 'WA', '98101');

INSERT INTO "Warehouses" ("Warehouse_ID", "Distribution_Center_ID", "Street", "City", "State", "Zipcode")
VALUES (11, 2, '654 Pine St', 'Houston', 'TX', '77001');

INSERT INTO "Warehouses" ("Warehouse_ID", "Distribution_Center_ID", "Street", "City", "State", "Zipcode")
VALUES (12, 3, '987 Birch St', 'Miami', 'FL', '33101');

-- Insert into Warehouse_Inventory
INSERT INTO "Warehouse_Inventory" ("Warehouse_ID", "Product_ID", "Number_in_Stock")
VALUES (10, 101, 100);

INSERT INTO "Warehouse_Inventory" ("Warehouse_ID", "Product_ID", "Number_in_Stock")
VALUES (11, 102, 150);

INSERT INTO "Warehouse_Inventory" ("Warehouse_ID", "Product_ID", "Number_in_Stock")
VALUES (12, 103, 75);
