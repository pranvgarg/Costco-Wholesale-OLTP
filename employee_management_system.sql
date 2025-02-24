-- Set the dataset
CREATE SCHEMA IF NOT EXISTS `famous-smithy-443003-b3.employee_management_system`;

CREATE TABLE `famous-smithy-443003-b3.employee_management_system.Department` (
  `Department_id` STRING NOT NULL,
  `Department_name` STRING NOT NULL,
  `Department_head_id` STRING,
  `Contact_number` STRING,
  PRIMARY KEY (`Department_id`) NOT ENFORCED
);

CREATE TABLE `famous-smithy-443003-b3.employee_management_system.Job_Titles` (
  `Job_title_id` STRING NOT NULL,
  `Job_title` STRING NOT NULL,
  `Employment_type` STRING NOT NULL,
  `Annual_salary` FLOAT64,
  `Hourly_salary` FLOAT64,
  `Field` STRING NOT NULL,
  PRIMARY KEY (`Job_title_id`) NOT ENFORCED
);

CREATE TABLE `famous-smithy-443003-b3.employee_management_system.Job_dept_Bridge` (
  `Job_title_id` STRING NOT NULL,
  `Department_id` STRING NOT NULL,
  `Job_description` STRING,
  PRIMARY KEY (`Job_title_id`, `Department_id`) NOT ENFORCED,
  CONSTRAINT FK_Job_Bridge_Department FOREIGN KEY (`Department_id`) REFERENCES `famous-smithy-443003-b3.employee_management_system.Department` (`Department_id`) NOT ENFORCED,
  CONSTRAINT FK_Job_Bridge_Title FOREIGN KEY (`Job_title_id`) REFERENCES `famous-smithy-443003-b3.employee_management_system.Job_Titles` (`Job_title_id`) NOT ENFORCED
);

CREATE TABLE `famous-smithy-443003-b3.employee_management_system.Shift` (
  `Shift_id` STRING NOT NULL,
  `Shift_type` STRING NOT NULL,
  `Monday` BOOLEAN,
  `Tuesday` BOOLEAN,
  `Wednesday` BOOLEAN,
  `Thursday` BOOLEAN,
  `Friday` BOOLEAN,
  `Saturday` BOOLEAN,
  `Sunday` BOOLEAN,
  `Start_time` TIME NOT NULL,
  `End_time` TIME NOT NULL,
  `Break_duration` INT64,
  PRIMARY KEY (`Shift_id`) NOT ENFORCED
);


CREATE TABLE `famous-smithy-443003-b3.employee_management_system.Employee` (
  `Employee_id` STRING NOT NULL,
  `FirstName` STRING NOT NULL,
  `MiddleName` STRING,
  `LastName` STRING NOT NULL,
  `Job_title_id` STRING NOT NULL,
  `Date_of_Birth` DATE,
  `SSN` STRING NOT NULL,
  `Start_date` DATE,
  `Warehouse_id` STRING,
  `Shift_id` STRING NOT NULL,
  `Department_id` STRING NOT NULL,
  PRIMARY KEY (`Employee_id`) NOT ENFORCED,
  CONSTRAINT FK_Employee_Job FOREIGN KEY (`Job_title_id`) REFERENCES `famous-smithy-443003-b3.employee_management_system.Job_Titles` (`Job_title_id`) NOT ENFORCED,
  CONSTRAINT FK_Employee_Shift FOREIGN KEY (`Shift_id`) REFERENCES `famous-smithy-443003-b3.employee_management_system.Shift` (`Shift_id`) NOT ENFORCED,
  CONSTRAINT FK_Employee_Department FOREIGN KEY (`Department_id`) REFERENCES `famous-smithy-443003-b3.employee_management_system.Department` (`Department_id`) NOT ENFORCED
);

CREATE TABLE `famous-smithy-443003-b3.employee_management_system.Employee_TimeLog` (
  `Log_id` STRING NOT NULL,
  `Employee_id` STRING NOT NULL,
  `Shift_id` STRING NOT NULL,
  `Date_worked` DATE NOT NULL,
  `Clock_in_time` TIME,
  `Clock_out_time` TIME,
  `Break_start_time` TIME,
  `Break_end_time` TIME,
  PRIMARY KEY (`Log_id`) NOT ENFORCED,
  CONSTRAINT FK_TimeLog_Employee FOREIGN KEY (`Employee_id`) REFERENCES `famous-smithy-443003-b3.employee_management_system.Employee` (`Employee_id`) NOT ENFORCED,
  CONSTRAINT FK_TimeLog_Shift FOREIGN KEY (`Shift_id`) REFERENCES `famous-smithy-443003-b3.employee_management_system.Shift` (`Shift_id`) NOT ENFORCED
);

INSERT INTO `famous-smithy-443003-b3.employee_management_system.Department`
(Department_id, Department_name, Department_head_id, Contact_number)
VALUES
("D001", "Human Resources", "E001", "555-123-4567"),
("D002", "Engineering", "E002", "555-234-5678"),
("D003", "Finance", "E003", "555-345-6789"),
("D004", "Sales", "E004", "555-456-7890"),
("D005", "Operations", "E005", "555-567-8901"),
("D006", "Marketing", "E006", "555-678-9012"),
("D007", "IT Support", "E007", "555-789-0123"),
("D008", "Product Management", "E008", "555-890-1234"),
("D009", "Customer Support", "E009", "555-901-2345"),
("D010", "Logistics", "E010", "555-012-3456"),
("D011", "Quality Assurance", "E011", "555-234-5671"),
("D012", "Procurement", "E012", "555-345-6782"),
("D013", "Research and Development", "E013", "555-456-7893"),
("D014", "Legal", "E014", "555-567-8904"),
("D015", "Public Relations", "E015", "555-678-9015"),
("D016", "Security", "E016", "555-789-0126"),
("D017", "Facilities Management", "E017", "555-890-1237"),
("D018", "Compliance", "E018", "555-901-2348"),
("D019", "Analytics", "E019", "555-012-3459"),
("D020", "Content Creation", "E020", "555-123-4561"),
("D021", "Training", "E021", "555-234-5672"),
("D022", "Event Management", "E022", "555-345-6783"),
("D023", "Contracts", "E023", "555-456-7894"),
("D024", "Vendor Management", "E024", "555-567-8905"),
("D025", "Data Engineering", "E025", "555-678-9016"),
("D026", "Infrastructure", "E026", "555-789-0127"),
("D027", "Corporate Strategy", "E027", "555-890-1238"),
("D028", "Customer Experience", "E028", "555-901-2349"),
("D029", "Supply Chain", "E029", "555-012-3450"),
("D030", "Sales Operations", "E030", "555-123-4562");


INSERT INTO `famous-smithy-443003-b3.employee_management_system.Job_Titles`
(Job_title_id, Job_title, Employment_type, Annual_salary, Hourly_salary, Field)
VALUES
("JT001", "Software Engineer", "Full-Time", 100000.00, NULL, "Technology"),
("JT002", "Accountant", "Full-Time", 70000.00, NULL, "Finance"),
("JT003", "Sales Executive", "Part-Time", NULL, 30.00, "Sales"),
("JT004", "HR Manager", "Full-Time", 80000.00, NULL, "Human Resources"),
("JT005", "Operations Analyst", "Full-Time", 75000.00, NULL, "Operations"),
("JT006", "Marketing Specialist", "Full-Time", 65000.00, NULL, "Marketing"),
("JT007", "Support Technician", "Part-Time", NULL, 25.00, "IT Support"),
("JT008", "Product Manager", "Full-Time", 95000.00, NULL, "Product Management"),
("JT009", "Customer Support Rep", "Part-Time", NULL, 20.00, "Customer Support"),
("JT010", "Logistics Coordinator", "Full-Time", 60000.00, NULL, "Logistics"),
("JT011", "QA Analyst", "Full-Time", 70000.00, NULL, "Quality Assurance"),
("JT012", "Procurement Specialist", "Full-Time", 68000.00, NULL, "Procurement"),
("JT013", "R&D Scientist", "Full-Time", 120000.00, NULL, "Research and Development"),
("JT014", "Legal Advisor", "Full-Time", 85000.00, NULL, "Legal"),
("JT015", "PR Coordinator", "Full-Time", 65000.00, NULL, "Public Relations"),
("JT016", "Security Guard", "Part-Time", NULL, 15.00, "Security"),
("JT017", "Facilities Supervisor", "Full-Time", 60000.00, NULL, "Facilities Management"),
("JT018", "Compliance Officer", "Full-Time", 75000.00, NULL, "Compliance"),
("JT019", "Data Analyst", "Full-Time", 72000.00, NULL, "Analytics"),
("JT020", "Content Writer", "Full-Time", 55000.00, NULL, "Content Creation"),
("JT021", "Trainer", "Part-Time", NULL, 22.00, "Training"),
("JT022", "Event Planner", "Full-Time", 50000.00, NULL, "Event Management"),
("JT023", "Contract Manager", "Full-Time", 78000.00, NULL, "Contracts"),
("JT024", "Vendor Manager", "Full-Time", 70000.00, NULL, "Vendor Management"),
("JT025", "Data Engineer", "Full-Time", 110000.00, NULL, "Data Engineering"),
("JT026", "Infrastructure Engineer", "Full-Time", 105000.00, NULL, "Infrastructure"),
("JT027", "Strategy Consultant", "Full-Time", 120000.00, NULL, "Corporate Strategy"),
("JT028", "Customer Success Manager", "Full-Time", 65000.00, NULL, "Customer Experience"),
("JT029", "Supply Chain Analyst", "Full-Time", 70000.00, NULL, "Supply Chain"),
("JT030", "Sales Operations Analyst", "Full-Time", 68000.00, NULL, "Sales Operations");


INSERT INTO `famous-smithy-443003-b3.employee_management_system.Job_dept_Bridge`
(Job_title_id, Department_id, Job_description)
VALUES
("JT001", "D002", "Develops and maintains software systems."),
("JT002", "D003", "Manages financial accounts and reporting."),
("JT003", "D004", "Generates sales and manages client relationships."),
("JT004", "D001", "Oversees HR functions and recruitment."),
("JT005", "D005", "Analyzes and optimizes operational processes."),
("JT006", "D006", "Creates marketing campaigns and materials."),
("JT007", "D007", "Provides IT support and troubleshooting."),
("JT008", "D008", "Manages product lifecycle and strategy."),
("JT009", "D009", "Assists customers with inquiries and issues."),
("JT010", "D010", "Coordinates shipping and logistics."),
("JT011", "D011", "Tests and verifies product quality."),
("JT012", "D012", "Procures materials and negotiates contracts."),
("JT013", "D013", "Leads research and development initiatives."),
("JT014", "D014", "Advises on legal matters and compliance."),
("JT015", "D015", "Handles public relations and media."),
("JT016", "D016", "Monitors and enforces security protocols."),
("JT017", "D017", "Supervises building maintenance and facilities."),
("JT018", "D018", "Ensures organizational compliance with policies."),
("JT019", "D019", "Analyzes data to inform business decisions."),
("JT020", "D020", "Writes content for company platforms."),
("JT021", "D021", "Conducts employee training sessions."),
("JT022", "D022", "Plans and executes company events."),
("JT023", "D023", "Drafts and manages contracts."),
("JT024", "D024", "Manages vendor relationships and procurement."),
("JT025", "D025", "Designs and maintains data pipelines."),
("JT026", "D026", "Maintains infrastructure systems."),
("JT027", "D027", "Develops and executes corporate strategies."),
("JT028", "D028", "Improves customer satisfaction and retention."),
("JT029", "D029", "Optimizes supply chain operations."),
("JT030", "D030", "Supports sales operations and reporting.");


INSERT INTO `famous-smithy-443003-b3.employee_management_system.Shift`
(Shift_id, Shift_type, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, Start_time, End_time, Break_duration)
VALUES
("S001", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "08:00:00", "16:00:00", 60),
("S002", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "16:00:00", "00:00:00", 45),
("S003", "Night", FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, "00:00:00", "08:00:00", 30),
("S004", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "07:00:00", "15:00:00", 60),
("S005", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "15:00:00", "23:00:00", 45),
("S006", "Night", FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, "23:00:00", "07:00:00", 30),
("S007", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "09:00:00", "17:00:00", 60),
("S008", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "17:00:00", "01:00:00", 45),
("S009", "Night", FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, "01:00:00", "09:00:00", 30),
("S010", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "06:00:00", "14:00:00", 60),
("S011", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "14:00:00", "22:00:00", 45),
("S012", "Night", FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, "22:00:00", "06:00:00", 30),
("S013", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "10:00:00", "18:00:00", 60),
("S014", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "18:00:00", "02:00:00", 45),
("S015", "Night", FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, "02:00:00", "10:00:00", 30),
("S016", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "05:00:00", "13:00:00", 60),
("S017", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "13:00:00", "21:00:00", 45),
("S018", "Night", FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, "21:00:00", "05:00:00", 30),
("S019", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "08:30:00", "16:30:00", 60),
("S020", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "16:30:00", "00:30:00", 45),
("S021", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "06:30:00", "14:30:00", 60),
("S022", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "14:30:00", "22:30:00", 45),
("S023", "Night", FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, "22:30:00", "06:30:00", 30),
("S024", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "07:30:00", "15:30:00", 60),
("S025", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "15:30:00", "23:30:00", 45),
("S026", "Night", FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, "23:30:00", "07:30:00", 30),
("S027", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "05:30:00", "13:30:00", 60),
("S028", "Evening", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "13:30:00", "21:30:00", 45),
("S029", "Morning", TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, "09:30:00", "17:30:00", 60),
("S030", "Night", FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, "00:30:00", "08:30:00", 30);

INSERT INTO `famous-smithy-443003-b3.employee_management_system.Employee`
(Employee_id, FirstName, MiddleName, LastName, Job_title_id, Date_of_Birth, SSN, Start_date, Warehouse_id, Shift_id, Department_id)
VALUES
("E001", "John", NULL, "Doe", "JT004", "1985-06-15", "123-45-6789", "2020-01-01", "W001", "S001", "D001"),
("E002", "Jane", NULL, "Smith", "JT001", "1990-07-20", "234-56-7890", "2021-05-10", "W002", "S002", "D002"),
("E003", "Alice", NULL, "Johnson", "JT002", "1992-11-25", "345-67-8901", "2022-03-15", "W003", "S001", "D003"),
("E004", "Bob", NULL, "Brown", "JT003", "1987-02-10", "456-78-9012", "2019-06-01", "W004", "S002", "D004"),
("E005", "Charlie", NULL, "Davis", "JT005", "1995-09-18", "567-89-0123", "2020-08-10", "W005", "S003", "D005"),
("E006", "David", NULL, "Garcia", "JT006", "1989-03-05", "678-90-1234", "2021-04-22", "W006", "S004", "D006"),
("E007", "Emily", NULL, "Martinez", "JT007", "1994-01-15", "789-01-2345", "2022-07-30", "W007", "S005", "D007"),
("E008", "Frank", NULL, "Lopez", "JT008", "1988-10-10", "890-12-3456", "2020-11-11", "W008", "S006", "D008"),
("E009", "Grace", NULL, "Gonzalez", "JT009", "1993-05-22", "901-23-4567", "2021-03-09", "W009", "S007", "D009"),
("E010", "Hannah", NULL, "Wilson", "JT010", "1996-08-14", "012-34-5678", "2022-12-01", "W010", "S008", "D010"),
("E011", "Ian", NULL, "Anderson", "JT011", "1980-04-25", "123-45-6780", "2019-09-01", "W011", "S009", "D011"),
("E012", "Jack", NULL, "Thomas", "JT012", "1984-12-12", "234-56-7891", "2020-02-05", "W012", "S010", "D012"),
("E013", "Karen", NULL, "Taylor", "JT013", "1986-03-16", "345-67-8902", "2021-06-20", "W013", "S011", "D013"),
("E014", "Larry", NULL, "Moore", "JT014", "1983-07-08", "456-78-9013", "2022-09-30", "W014", "S012", "D014"),
("E015", "Megan", NULL, "Jackson", "JT015", "1981-01-19", "567-89-0124", "2018-05-15", "W015", "S013", "D015"),
("E016", "Nathan", NULL, "White", "JT016", "1982-06-28", "678-90-1235", "2019-07-07", "W016", "S014", "D016"),
("E017", "Olivia", NULL, "Harris", "JT017", "1988-12-21", "789-01-2346", "2020-10-25", "W017", "S015", "D017"),
("E018", "Paul", NULL, "Martin", "JT018", "1985-09-30", "890-12-3457", "2021-01-13", "W018", "S016", "D018"),
("E019", "Quincy", NULL, "Clark", "JT019", "1991-03-22", "901-23-4568", "2022-02-16", "W019", "S017", "D019"),
("E020", "Rachel", NULL, "Rodriguez", "JT020", "1997-11-10", "012-34-5679", "2020-03-29", "W020", "S018", "D020"),
("E021", "Sam", NULL, "Lewis", "JT021", "1990-01-01", "123-45-6781", "2019-04-05", "W021", "S019", "D021"),
("E022", "Tina", NULL, "Walker", "JT022", "1994-12-20", "234-56-7892", "2020-09-10", "W022", "S020", "D022"),
("E023", "Uma", NULL, "Hall", "JT023", "1993-10-15", "345-67-8903", "2021-11-01", "W023", "S021", "D023"),
("E024", "Victor", NULL, "Allen", "JT024", "1987-08-08", "456-78-9014", "2022-06-12", "W024", "S022", "D024"),
("E025", "Wendy", NULL, "Young", "JT025", "1989-04-04", "567-89-0125", "2019-01-15", "W025", "S023", "D025"),
("E026", "Xander", NULL, "King", "JT026", "1995-05-05", "678-90-1236", "2020-12-03", "W026", "S024", "D026"),
("E027", "Yara", NULL, "Scott", "JT027", "1998-02-02", "789-01-2347", "2021-05-23", "W027", "S025", "D027"),
("E028", "Zoe", NULL, "Adams", "JT028", "1992-07-07", "890-12-3458", "2022-03-01", "W028", "S026", "D028"),
("E029", "Andrew", NULL, "Baker", "JT029", "1999-06-06", "901-23-4569", "2020-06-06", "W029", "S027", "D029"),
("E030", "Beth", NULL, "Miller", "JT030", "1991-01-01", "012-34-5670", "2019-02-15", "W030", "S028", "D030");


INSERT INTO `famous-smithy-443003-b3.employee_management_system.Employee_TimeLog`
(Log_id, Employee_id, Shift_id, Date_worked, Clock_in_time, Clock_out_time, Break_start_time, Break_end_time)
VALUES
("L001", "E001", "S001", "2023-11-01", "08:00:00", "16:00:00", "12:00:00", "12:30:00"),
("L002", "E002", "S002", "2023-11-01", "16:00:00", "00:00:00", "20:00:00", "20:15:00"),
("L003", "E003", "S001", "2023-11-01", "08:00:00", "16:00:00", "12:00:00", "12:30:00"),
("L004", "E004", "S002", "2023-11-01", "16:00:00", "00:00:00", "20:00:00", "20:15:00"),
("L005", "E005", "S003", "2023-11-01", "00:00:00", "08:00:00", "04:00:00", "04:15:00"),
("L006", "E006", "S004", "2023-11-01", "07:00:00", "15:00:00", "11:00:00", "11:30:00"),
("L007", "E007", "S005", "2023-11-01", "15:00:00", "23:00:00", "19:00:00", "19:15:00"),
("L008", "E008", "S006", "2023-11-01", "23:00:00", "07:00:00", "03:00:00", "03:15:00"),
("L009", "E009", "S007", "2023-11-01", "09:00:00", "17:00:00", "13:00:00", "13:30:00"),
("L010", "E010", "S008", "2023-11-01", "17:00:00", "01:00:00", "21:00:00", "21:15:00"),
("L011", "E011", "S009", "2023-11-01", "01:00:00", "09:00:00", "05:00:00", "05:15:00"),
("L012", "E012", "S010", "2023-11-01", "06:00:00", "14:00:00", "10:00:00", "10:30:00"),
("L013", "E013", "S011", "2023-11-01", "14:00:00", "22:00:00", "18:00:00", "18:15:00"),
("L014", "E014", "S012", "2023-11-01", "22:00:00", "06:00:00", "02:00:00", "02:15:00"),
("L015", "E015", "S013", "2023-11-01", "10:00:00", "18:00:00", "14:00:00", "14:30:00"),
("L016", "E016", "S014", "2023-11-01", "18:00:00", "02:00:00", "22:00:00", "22:15:00"),
("L017", "E017", "S015", "2023-11-01", "02:00:00", "10:00:00", "06:00:00", "06:15:00"),
("L018", "E018", "S016", "2023-11-01", "05:00:00", "13:00:00", "09:00:00", "09:30:00"),
("L019", "E019", "S017", "2023-11-01", "13:00:00", "21:00:00", "17:00:00", "17:15:00"),
("L020", "E020", "S018", "2023-11-01", "21:00:00", "05:00:00", "01:00:00", "01:15:00"),
("L021", "E021", "S019", "2023-11-01", "08:30:00", "16:30:00", "12:30:00", "13:00:00"),
("L022", "E022", "S020", "2023-11-01", "16:30:00", "00:30:00", "20:30:00", "20:45:00"),
("L023", "E023", "S021", "2023-11-01", "06:30:00", "14:30:00", "10:30:00", "11:00:00"),
("L024", "E024", "S022", "2023-11-01", "14:30:00", "22:30:00", "18:30:00", "18:45:00"),
("L025", "E025", "S023", "2023-11-01", "22:30:00", "06:30:00", "02:30:00", "02:45:00"),
("L026", "E026", "S024", "2023-11-01", "07:30:00", "15:30:00", "11:30:00", "12:00:00"),
("L027", "E027", "S025", "2023-11-01", "15:30:00", "23:30:00", "19:30:00", "19:45:00"),
("L028", "E028", "S026", "2023-11-01", "23:30:00", "07:30:00", "03:30:00", "03:45:00"),
("L029", "E029", "S027", "2023-11-01", "05:30:00", "13:30:00", "09:30:00", "10:00:00"),
("L030", "E030", "S028", "2023-11-01", "09:30:00", "17:30:00", "13:30:00", "14:00:00");




