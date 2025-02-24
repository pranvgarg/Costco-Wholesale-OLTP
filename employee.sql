-- 1. Create Job Titles Table
CREATE TABLE Job_Titles (
    Job_title_id INT PRIMARY KEY,
    Job_title VARCHAR(50) NOT NULL,
    Employment_type VARCHAR(20) NOT NULL,
    Annual_salary DECIMAL(10, 2),
    Hourly_salary DECIMAL(10, 2)
);
 
-- 2. Create Departments Table
CREATE TABLE Departments (
    Department_id INT PRIMARY KEY,
    Department_name VARCHAR(50) NOT NULL,
    Department_head_id INT,
    Contact_number VARCHAR(15) NOT NULL
);
 
-- 3. Create Warehouses Table
CREATE TABLE Warehouses (
    Warehouse_id INT PRIMARY KEY,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Zip_Code VARCHAR(10) NOT NULL
);
 
-- 4. Create Shifts Table
CREATE TABLE Shifts (
    Shift_id INT PRIMARY KEY,
    Shift_type VARCHAR(20) NOT NULL,
    Monday NUMBER(1) DEFAULT 0,
    Tuesday NUMBER(1) DEFAULT 0,
    Wednesday NUMBER(1) DEFAULT 0,
    Thursday NUMBER(1) DEFAULT 0,
    Friday NUMBER(1) DEFAULT 0,
    Saturday NUMBER(1) DEFAULT 0,
    Sunday NUMBER(1) DEFAULT 0,
    Start_time DATE NOT NULL,
    End_time DATE NOT NULL,
    Break_duration INT NOT NULL
);
 
-- 5. Create Employees Table
CREATE TABLE Employees (
    Employee_id INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL,
    Job_title_id INT NOT NULL,
    Date_of_Birth DATE NOT NULL,
    SSN CHAR(11) NOT NULL,
    Start_date DATE NOT NULL,
    Warehouse_id INT NOT NULL,
    Shift_id INT NOT NULL,
    Department_id INT NOT NULL,
    FOREIGN KEY (Job_title_id) REFERENCES Job_Titles(Job_title_id),
    FOREIGN KEY (Shift_id) REFERENCES Shifts(Shift_id),
    FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);
 
-- 6. Create Employee Job Assignments Table
CREATE TABLE Employee_Job_Assignments (
    Job_title_id INT NOT NULL,
    Warehouse_id INT NOT NULL,
    Department_id INT NOT NULL,
    Job_description CLOB,
    PRIMARY KEY (Job_title_id, Warehouse_id, Department_id),
    FOREIGN KEY (Job_title_id) REFERENCES Job_Titles(Job_title_id),
    FOREIGN KEY (Warehouse_id) REFERENCES Warehouses(Warehouse_id),
    FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);
 
-- 7. Create Employee TimeLogs Table
CREATE TABLE Employee_TimeLogs (
    Log_id INT PRIMARY KEY,
    Employee_id INT NOT NULL,
    Shift_id INT NOT NULL,
    Date_worked DATE NOT NULL,
    Clock_in_time TIMESTAMP NOT NULL,
    Clock_out_time TIMESTAMP NOT NULL,
    Break_start_time TIMESTAMP,
    Break_end_time TIMESTAMP,
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id),
    FOREIGN KEY (Shift_id) REFERENCES Shifts(Shift_id)
);
 
-- Insert Data into Job_Titles
INSERT INTO Job_Titles (Job_title_id, Job_title, Employment_type, Annual_salary, Hourly_salary)
VALUES (1, 'Sales Associate', 'Full-time', 50000.00, NULL);
INSERT INTO Job_Titles (Job_title_id, Job_title, Employment_type, Annual_salary, Hourly_salary)
VALUES (2, 'Warehouse Worker', 'Hourly', NULL, 20.00);
INSERT INTO Job_Titles (Job_title_id, Job_title, Employment_type, Annual_salary, Hourly_salary)
VALUES (3, 'Manager', 'Full-time', 70000.00, NULL);
 
-- Insert Data into Departments
INSERT INTO Departments (Department_id, Department_name, Department_head_id, Contact_number)
VALUES (1, 'Sales', NULL, '555-1234');
INSERT INTO Departments (Department_id, Department_name, Department_head_id, Contact_number)
VALUES (2, 'Logistics', NULL, '555-5678');
INSERT INTO Departments (Department_id, Department_name, Department_head_id, Contact_number)
VALUES (3, 'Management', NULL, '555-9101');
 
-- Insert Data into Warehouses
INSERT INTO Warehouses (Warehouse_id, Street, City, State, Zip_Code)
VALUES (1, '123 Main St', 'Austin', 'Texas', '73301');
INSERT INTO Warehouses (Warehouse_id, Street, City, State, Zip_Code)
VALUES (2, '456 Market St', 'Dallas', 'Texas', '75201');
 
-- Insert Data into Shifts
INSERT INTO Shifts (Shift_id, Shift_type, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, Start_time, End_time, Break_duration)
VALUES (1, 'Morning', 1, 1, 1, 1, 1, 0, 0, TO_DATE('08:00:00', 'HH24:MI:SS'), TO_DATE('16:00:00', 'HH24:MI:SS'), 30);
INSERT INTO Shifts (Shift_id, Shift_type, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, Start_time, End_time, Break_duration)
VALUES (2, 'Afternoon', 1, 1, 1, 1, 1, 0, 0, TO_DATE('14:00:00', 'HH24:MI:SS'), TO_DATE('22:00:00', 'HH24:MI:SS'), 30);
INSERT INTO Shifts (Shift_id, Shift_type, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, Start_time, End_time, Break_duration)
VALUES (3, 'Night', 0, 0, 0, 0, 1, 1, 1, TO_DATE('22:00:00', 'HH24:MI:SS'), TO_DATE('06:00:00', 'HH24:MI:SS'), 20);
 
-- Insert Data into Employees
INSERT INTO Employees (Employee_id, FirstName, MiddleName, LastName, Job_title_id, Date_of_Birth, SSN, Start_date, Warehouse_id, Shift_id, Department_id)
VALUES (101, 'John', NULL, 'Doe', 1, TO_DATE('1985-06-15', 'YYYY-MM-DD'), '123-45-6789', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1, 1, 1);
INSERT INTO Employees (Employee_id, FirstName, MiddleName, LastName, Job_title_id, Date_of_Birth, SSN, Start_date, Warehouse_id, Shift_id, Department_id)
VALUES (102, 'Jane', NULL, 'Smith', 2, TO_DATE('1990-08-20', 'YYYY-MM-DD'), '987-65-4321', TO_DATE('2023-02-20', 'YYYY-MM-DD'), 1, 2, 2);
INSERT INTO Employees (Employee_id, FirstName, MiddleName, LastName, Job_title_id, Date_of_Birth, SSN, Start_date, Warehouse_id, Shift_id, Department_id)
VALUES (103, 'Alice', 'Marie', 'Brown', 3, TO_DATE('1980-12-10', 'YYYY-MM-DD'), '555-55-5555', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 2, 3, 3);
 
-- Insert Data into Employee_Job_Assignments
INSERT INTO Employee_Job_Assignments (Job_title_id, Warehouse_id, Department_id, Job_description)
VALUES (1, 1, 1, 'Responsible for managing sales and client relations.');
INSERT INTO Employee_Job_Assignments (Job_title_id, Warehouse_id, Department_id, Job_description)
VALUES (2, 1, 2, 'Handles logistics, inventory, and warehouse operations.');
INSERT INTO Employee_Job_Assignments (Job_title_id, Warehouse_id, Department_id, Job_description)
VALUES (3, 1, 3, 'Oversees daily operations and manages staff.');
INSERT INTO Employee_Job_Assignments (Job_title_id, Warehouse_id, Department_id, Job_description)
VALUES (3, 2, 3, 'Strategic planning and overall management.');
 
-- Insert Data into Employee_TimeLogs
INSERT INTO Employee_TimeLogs (Log_id, Employee_id, Shift_id, Date_worked, Clock_in_time, Clock_out_time, Break_start_time, Break_end_time)
VALUES (1, 101, 1, TO_DATE('2023-04-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-04-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-10 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-10 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Employee_TimeLogs (Log_id, Employee_id, Shift_id, Date_worked, Clock_in_time, Clock_out_time, Break_start_time, Break_end_time)
VALUES (2, 102, 2, TO_DATE('2023-04-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-04-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-11 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-11 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-11 17:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Employee_TimeLogs (Log_id, Employee_id, Shift_id, Date_worked, Clock_in_time, Clock_out_time, Break_start_time, Break_end_time)
VALUES (3, 103, 3, TO_DATE('2023-04-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-04-12 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-13 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-13 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-13 02:20:00', 'YYYY-MM-DD HH24:MI:SS'));

