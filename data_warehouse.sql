-- Parent Tables
CREATE TABLE "Dim_Suppliers" (
  "Supplier_ID" NUMBER PRIMARY KEY,
  "Company_Name" VARCHAR2(255),
  "Contact_Name" VARCHAR2(255),
  "Email" VARCHAR2(255),
  "Phone_Number" VARCHAR2(20)
);

CREATE TABLE "Dim_Products" (
  "Product_ID" NUMBER PRIMARY KEY,
  "Name" VARCHAR2(255),
  "Description" VARCHAR2(500),
  "Unit_Price" NUMBER(10, 2)
);

CREATE TABLE "Dim_Warehouse" (
  "Warehouse_ID" NUMBER PRIMARY KEY,
  "Street" VARCHAR2(255),
  "City" VARCHAR2(100),
  "State" VARCHAR2(50),
  "Zipcode" VARCHAR2(10)
);

CREATE TABLE "Dim_Employees" (
  "Employee_ID" NUMBER PRIMARY KEY,
  "First_Name" VARCHAR2(100),
  "Middle_Name" VARCHAR2(100),
  "Last_Name" VARCHAR2(100),
  "SSN" VARCHAR2(15),
  "Date_of_Birth" DATE,
  "Email" VARCHAR2(255),
  "Phone_Number" VARCHAR2(20),
  "Start_Date" DATE
);

CREATE TABLE "Dim_Customers" (
  "Customer_ID" NUMBER PRIMARY KEY,
  "First_Name" VARCHAR2(100),
  "Middle_Name" VARCHAR2(100),
  "Last_Name" VARCHAR2(100),
  "Sex" CHAR(1),
  "Date_of_Birth" DATE,
  "Email" VARCHAR2(255),
  "Date_Joined" DATE
);

CREATE TABLE "Dim_Memberships" (
  "Membership_ID" NUMBER PRIMARY KEY,
  "Name" VARCHAR2(255),
  "Description" VARCHAR2(500),
  "Price" NUMBER(10, 2),
  "Annual_Reward" NUMBER(10, 2),
  "Discount" NUMBER(5, 2)
);

CREATE TABLE "Dim_DistributionCenter" (
  "Distribution_Center_ID" NUMBER PRIMARY KEY,
  "Street" VARCHAR2(255),
  "City" VARCHAR2(100),
  "State" VARCHAR2(50),
  "Zipcode" VARCHAR2(10)
);

CREATE TABLE "Dim_Departments" (
  "Department_ID" NUMBER PRIMARY KEY,
  "Name" VARCHAR2(255),
  "Description" VARCHAR2(500)
);

CREATE TABLE "Dim_JobTitles" (
  "Title_ID" NUMBER PRIMARY KEY,
  "Name" VARCHAR2(255),
  "Description" VARCHAR2(500),
  "Employment_Type" VARCHAR2(50),
  "Hourly_Salary" NUMBER(10, 2)
);

CREATE TABLE "Dim_Shifts" (
  "Shift_ID" NUMBER PRIMARY KEY,
  "Shift_Type" VARCHAR2(50),
  "Monday" NUMBER(1),
  "Tuesday" NUMBER(1),
  "Wednesday" NUMBER(1),
  "Thursday" NUMBER(1),
  "Friday" NUMBER(1),
  "Saturday" NUMBER(1),
  "Sunday" NUMBER(1),
  "Start_Time" TIMESTAMP,
  "End_Time" TIMESTAMP,
  "Break_Duration" NUMBER(5, 2)
);

-- Child Tables
CREATE TABLE "Fact_WarehouseInventory" (
  "Warehouse_Inventory_ID" NUMBER PRIMARY KEY,
  "Warehouse_ID" NUMBER REFERENCES "Dim_Warehouse"("Warehouse_ID"),
  "Product_ID" NUMBER REFERENCES "Dim_Products"("Product_ID"),
  "Quantity" NUMBER
);

CREATE TABLE "Fact_CustMembershipCards" (
  "Card_ID" NUMBER PRIMARY KEY,
  "Customer_ID" NUMBER REFERENCES "Dim_Customers"("Customer_ID"),
  "Membership_ID" NUMBER REFERENCES "Dim_Memberships"("Membership_ID"),
  "Active" CHAR(1),
  "Start_Date" DATE,
  "End_Date" DATE
);

CREATE TABLE "Fact_Sales" (
  "Sale_ID" NUMBER PRIMARY KEY,
  "Warehouse_ID" NUMBER REFERENCES "Dim_Warehouse"("Warehouse_ID"),
  "Card_ID" NUMBER REFERENCES "Fact_CustMembershipCards"("Card_ID"),
  "Employee_ID" NUMBER REFERENCES "Dim_Employees"("Employee_ID"),
  "Date" DATE,
  "Total_Quantity" NUMBER,
  "Total_Sale_Amount" NUMBER(10, 2)
);

CREATE TABLE "Fact_SaleItems" (
  "Sale_Items_ID" NUMBER PRIMARY KEY,
  "Sale_ID" NUMBER REFERENCES "Fact_Sales"("Sale_ID"),
  "Warehouse_Inventory_ID" NUMBER REFERENCES "Fact_WarehouseInventory"("Warehouse_Inventory_ID"),
  "Quantity" NUMBER
);

CREATE TABLE "Fact_WarehouseRestock" (
  "Warehouse_Restock_ID" NUMBER PRIMARY KEY,
  "Product_ID" NUMBER REFERENCES "Dim_Products"("Product_ID"),
  "Distribution_Center_ID" NUMBER REFERENCES "Dim_DistributionCenter"("Distribution_Center_ID"),
  "Warehouse_ID" NUMBER REFERENCES "Dim_Warehouse"("Warehouse_ID"),
  "Restock_Date" DATE,
  "Quantity" NUMBER
);

CREATE TABLE "Fact_WarehouseDepartments" (
  "Warehouse_Dept_ID" NUMBER PRIMARY KEY,
  "Warehouse_ID" NUMBER REFERENCES "Dim_Warehouse"("Warehouse_ID"),
  "Department_ID" NUMBER REFERENCES "Dim_Departments"("Department_ID"),
  "Phone_Number" VARCHAR2(20),
  "Email" VARCHAR2(255)
);

CREATE TABLE "Fact_EmployeeAssignments" (
  "Assignment_ID" NUMBER PRIMARY KEY,
  "Employee_ID" NUMBER REFERENCES "Dim_Employees"("Employee_ID"),
  "Warehouse_Dept_ID" NUMBER REFERENCES "Fact_WarehouseDepartments"("Warehouse_Dept_ID"),
  "Job_Title_ID" NUMBER REFERENCES "Dim_JobTitles"("Title_ID"),
  "Shift_ID" NUMBER REFERENCES "Dim_Shifts"("Shift_ID")
);

CREATE TABLE "Fact_SupplierProducts" (
  "Supplier_Products_ID" NUMBER PRIMARY KEY,
  "Supplier_ID" NUMBER REFERENCES "Dim_Suppliers"("Supplier_ID"),
  "Product_ID" NUMBER REFERENCES "Dim_Products"("Product_ID")
);

CREATE TABLE "Fact_EmployeeTimeLog" (
  "Timelog_ID" NUMBER PRIMARY KEY,
  "Employee_ID" NUMBER REFERENCES "Dim_Employees"("Employee_ID"),
  "Assignment_ID" NUMBER REFERENCES "Fact_EmployeeAssignments"("Assignment_ID"),
  "Date_Worked" DATE,
  "Start_Time" TIMESTAMP,
  "End_Time" TIMESTAMP,
  "Break_Start_Time" TIMESTAMP,
  "Break_End_Time" TIMESTAMP
);

CREATE TABLE "Fact_DistributionCenterInventory" (
  "DistCenter_Inventory_ID" NUMBER PRIMARY KEY,
  "Product_ID" NUMBER REFERENCES "Dim_Products"("Product_ID"),
  "Distribution_Center_ID" NUMBER REFERENCES "Dim_DistributionCenter"("Distribution_Center_ID"),
  "Quantity" NUMBER
);


