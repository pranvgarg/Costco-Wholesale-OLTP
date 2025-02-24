-- Set the dataset
CREATE SCHEMA IF NOT EXISTS `famous-smithy-443003-b3.product_management_system`;

CREATE TABLE `famous-smithy-443003-b3.product_management_system.Suppliers` (
  `Supplier_ID` STRING NOT NULL, -- Primary Key
  `Name` STRING NOT NULL, -- Supplier Name
  `Contact_Name` STRING NOT NULL, -- Contact Person's Name
  `Contact_Email` STRING NOT NULL, -- Contact Email
  `Phone_Number` STRING NOT NULL, -- Phone Number
  PRIMARY KEY (`Supplier_ID`) NOT ENFORCED
);

CREATE TABLE `famous-smithy-443003-b3.product_management_system.Products` (
  `Product_ID` STRING NOT NULL, -- Primary Key
  `Name` STRING NOT NULL, -- Product Name
  `Description` STRING, -- Product Description
  `Price` FLOAT64 NOT NULL, -- Product Price
  `Supplier_ID` STRING NOT NULL, -- Foreign Key References Suppliers
  PRIMARY KEY (`Product_ID`) NOT ENFORCED,
  CONSTRAINT FK_Product_Supplier FOREIGN KEY (`Supplier_ID`) REFERENCES `famous-smithy-443003-b3.product_management_system.Suppliers` (`Supplier_ID`) NOT ENFORCED
);

CREATE TABLE `famous-smithy-443003-b3.product_management_system.Distribution_Center` (
  `Distribution_Center_ID` STRING NOT NULL, -- Primary Key
  `Product_ID` STRING NOT NULL, -- Foreign Key References Products
  `Street` STRING NOT NULL, -- Street Address
  `City` STRING NOT NULL, -- City
  `State` STRING NOT NULL, -- State
  `Zipcode` STRING NOT NULL, -- Zipcode
  PRIMARY KEY (`Distribution_Center_ID`) NOT ENFORCED,
  CONSTRAINT FK_DistributionCenter_Product FOREIGN KEY (`Product_ID`) REFERENCES `famous-smithy-443003-b3.product_management_system.Products` (`Product_ID`) NOT ENFORCED
);


CREATE TABLE `famous-smithy-443003-b3.product_management_system.Warehouse` (
  `Warehouse_ID` STRING NOT NULL, -- Primary Key
  `Distribution_Center_ID` STRING NOT NULL, -- Foreign Key References Distribution Center
  `Street` STRING NOT NULL, -- Street Address
  `City` STRING NOT NULL, -- City
  `State` STRING NOT NULL, -- State
  `Zipcode` STRING NOT NULL, -- Zipcode
  PRIMARY KEY (`Warehouse_ID`) NOT ENFORCED,
  CONSTRAINT FK_Warehouse_DistributionCenter FOREIGN KEY (`Distribution_Center_ID`) REFERENCES `famous-smithy-443003-b3.product_management_system.Distribution_Center` (`Distribution_Center_ID`) NOT ENFORCED
);

CREATE TABLE `famous-smithy-443003-b3.product_management_system.Warehouse_Inventory` (
  `Warehouse_ID` STRING NOT NULL, -- Foreign Key References Warehouse
  `Product_ID` STRING NOT NULL, -- Foreign Key References Products
  `Number_in_Stock` INT NOT NULL, -- Stock Count
  PRIMARY KEY (`Warehouse_ID`, `Product_ID`) NOT ENFORCED,
  CONSTRAINT FK_Inventory_Product FOREIGN KEY (`Product_ID`) REFERENCES `famous-smithy-443003-b3.product_management_system.Products` (`Product_ID`) NOT ENFORCED,
  CONSTRAINT FK_Inventory_Warehouse FOREIGN KEY (`Warehouse_ID`) REFERENCES `famous-smithy-443003-b3.product_management_system.Warehouse` (`Warehouse_ID`) NOT ENFORCED
);

CREATE TABLE `famous-smithy-443003-b3.product_management_system.Distribution_Center_Products` (
  `Distribution_Center_ID` STRING NOT NULL, -- Foreign Key References Distribution Center
  `Product_ID` STRING NOT NULL, -- Foreign Key References Products
  PRIMARY KEY (`Distribution_Center_ID`, `Product_ID`) NOT ENFORCED,
  CONSTRAINT FK_Distribution_Product FOREIGN KEY (`Distribution_Center_ID`) REFERENCES `famous-smithy-443003-b3.product_management_system.Distribution_Center` (`Distribution_Center_ID`) NOT ENFORCED,
  CONSTRAINT FK_Product_Distribution FOREIGN KEY (`Product_ID`) REFERENCES `famous-smithy-443003-b3.product_management_system.Products` (`Product_ID`) NOT ENFORCED
);

INSERT INTO `famous-smithy-443003-b3.product_management_system.Suppliers`
(Supplier_ID, Name, Contact_Name, Contact_Email, Phone_Number)
VALUES
("S001", "TechCorp", "Alice Johnson", "alice.johnson@techcorp.com", "123-456-7890"),
("S002", "GizmoWorks", "Bob Smith", "bob.smith@gizmoworks.com", "234-567-8901"),
("S003", "WidgetCo", "Carol Lee", "carol.lee@widgetco.com", "345-678-9012"),
("S004", "NextGen Supplies", "David King", "david.king@nextgensupplies.com", "456-789-0123"),
("S005", "Innovative Goods", "Emily Turner", "emily.turner@innovative.com", "567-890-1234"),
("S006", "Tech Innovations", "Frank Garcia", "frank.garcia@techinnovations.com", "678-901-2345"),
("S007", "FutureTech", "Grace Wilson", "grace.wilson@futuretech.com", "789-012-3456"),
("S008", "SupplyLine", "Henry Adams", "henry.adams@supplyline.com", "890-123-4567"),
("S009", "Alpha Supplies", "Ivy Scott", "ivy.scott@alphasupplies.com", "901-234-5678"),
("S010", "Omega Goods", "Jack Thomas", "jack.thomas@omegagoods.com", "012-345-6789"),
("S011", "Universal Products", "Karen Martinez", "karen.martinez@universal.com", "123-456-7891"),
("S012", "Prime Supplies", "Larry Davis", "larry.davis@primesupplies.com", "234-567-8902"),
("S013", "Velocity Goods", "Megan Lopez", "megan.lopez@velocitygoods.com", "345-678-9013"),
("S014", "Streamline Supplies", "Nathan White", "nathan.white@streamline.com", "456-789-0124"),
("S015", "Echo Products", "Olivia Harris", "olivia.harris@echoproducts.com", "567-890-1235"),
("S016", "Vanguard Goods", "Paul Martin", "paul.martin@vanguard.com", "678-901-2346"),
("S017", "Elite Supplies", "Quincy Clark", "quincy.clark@elitesupplies.com", "789-012-3457"),
("S018", "Epic Goods", "Rachel Rodriguez", "rachel.rodriguez@epicgoods.com", "890-123-4568"),
("S019", "Metro Supplies", "Sam Lewis", "sam.lewis@metro.com", "901-234-5679"),
("S020", "Zenith Products", "Tina Walker", "tina.walker@zenith.com", "012-345-6781"),
("S021", "Pinnacle Goods", "Uma Hall", "uma.hall@pinnacle.com", "123-456-7892"),
("S022", "Summit Supplies", "Victor Allen", "victor.allen@summit.com", "234-567-8903"),
("S023", "Crest Products", "Wendy Young", "wendy.young@crest.com", "345-678-9014"),
("S024", "Horizon Supplies", "Xander King", "xander.king@horizon.com", "456-789-0125"),
("S025", "Evo Goods", "Yara Scott", "yara.scott@evogoods.com", "567-890-1236"),
("S026", "Core Supplies", "Zoe Adams", "zoe.adams@coresupplies.com", "678-901-2347"),
("S027", "Edge Products", "Andrew Baker", "andrew.baker@edgeproducts.com", "789-012-3458"),
("S028", "PrimeEdge Supplies", "Beth Miller", "beth.miller@primeedge.com", "890-123-4569"),
("S029", "Global Goods", "Charlie Davis", "charlie.davis@globalgoods.com", "901-234-5670"),
("S030", "Infinite Supplies", "Dana Thomas", "dana.thomas@infinite.com", "012-345-6782");


INSERT INTO `famous-smithy-443003-b3.product_management_system.Products`
(Product_ID, Name, Description, Price, Supplier_ID)
VALUES
("P001", "Laptop", "High-performance laptop", 1000.00, "S001"),
("P002", "Smartphone", "Latest smartphone model", 800.00, "S002"),
("P003", "Tablet", "Lightweight tablet", 600.00, "S003"),
("P004", "Headphones", "Noise-canceling headphones", 200.00, "S004"),
("P005", "Smartwatch", "Feature-rich smartwatch", 300.00, "S005"),
("P006", "Gaming Console", "Next-gen gaming console", 500.00, "S006"),
("P007", "Monitor", "4K UHD Monitor", 350.00, "S007"),
("P008", "Keyboard", "Mechanical keyboard", 100.00, "S008"),
("P009", "Mouse", "Wireless mouse", 50.00, "S009"),
("P010", "Printer", "All-in-one printer", 250.00, "S010"),
("P011", "Router", "High-speed Wi-Fi router", 150.00, "S011"),
("P012", "Speaker", "Bluetooth speaker", 100.00, "S012"),
("P013", "Fitness Band", "Smart fitness band", 120.00, "S013"),
("P014", "Webcam", "HD webcam", 80.00, "S014"),
("P015", "External Drive", "1TB external storage", 120.00, "S015"),
("P016", "Projector", "Portable projector", 400.00, "S016"),
("P017", "Drone", "Camera drone", 900.00, "S017"),
("P018", "Smart Light", "Wi-Fi enabled light bulb", 40.00, "S018"),
("P019", "Power Bank", "Fast-charging power bank", 60.00, "S019"),
("P020", "VR Headset", "Virtual reality headset", 450.00, "S020"),
("P021", "Microwave", "Compact microwave oven", 300.00, "S021"),
("P022", "Coffee Maker", "Smart coffee maker", 200.00, "S022"),
("P023", "Vacuum Cleaner", "Robot vacuum cleaner", 500.00, "S023"),
("P024", "Camera", "DSLR Camera", 800.00, "S024"),
("P025", "TV", "Smart LED TV", 1000.00, "S025"),
("P026", "Soundbar", "Dolby Atmos soundbar", 250.00, "S026"),
("P027", "Thermostat", "Smart thermostat", 180.00, "S027"),
("P028", "Dishwasher", "Energy-efficient dishwasher", 600.00, "S028"),
("P029", "Refrigerator", "Double-door refrigerator", 1500.00, "S029"),
("P030", "Washing Machine", "Top-load washing machine", 800.00, "S030");


INSERT INTO `famous-smithy-443003-b3.product_management_system.Distribution_Center`
(Distribution_Center_ID, Product_ID, Street, City, State, Zipcode)
VALUES
("DC001", "P001", "123 Tech Lane", "Austin", "TX", "73301"),
("DC002", "P002", "456 Innovation Blvd", "San Francisco", "CA", "94105"),
("DC003", "P003", "789 Gadget Way", "Seattle", "WA", "98101"),
("DC004", "P004", "321 Headphone St", "Denver", "CO", "80202"),
("DC005", "P005", "654 Watch Ave", "Boston", "MA", "02108"),
("DC006", "P006", "999 Gaming Rd", "Los Angeles", "CA", "90001"),
("DC007", "P007", "777 Monitor Way", "Chicago", "IL", "60601"),
("DC008", "P008", "555 Keyboard St", "Houston", "TX", "77001"),
("DC009", "P009", "222 Mouse Rd", "Phoenix", "AZ", "85001"),
("DC010", "P010", "888 Printer Ave", "Dallas", "TX", "75201"),
("DC011", "P011", "444 Router Blvd", "Atlanta", "GA", "30301"),
("DC012", "P012", "666 Speaker Lane", "Miami", "FL", "33101"),
("DC013", "P013", "999 Fitness Rd", "Orlando", "FL", "32801"),
("DC014", "P014", "111 Webcam St", "Portland", "OR", "97201"),
("DC015", "P015", "333 Drive Ave", "Salt Lake City", "UT", "84101"),
("DC016", "P016", "777 Projector Way", "Las Vegas", "NV", "89101"),
("DC017", "P017", "555 Drone Blvd", "San Diego", "CA", "92101"),
("DC018", "P018", "222 Light St", "New York", "NY", "10001"),
("DC019", "P019", "444 Power Bank Rd", "Philadelphia", "PA", "19101"),
("DC020", "P020", "666 VR Lane", "San Jose", "CA", "95101"),
("DC021", "P021", "888 Microwave St", "Nashville", "TN", "37201"),
("DC022", "P022", "111 Coffee Maker Rd", "Indianapolis", "IN", "46201"),
("DC023", "P023", "333 Vacuum Blvd", "Charlotte", "NC", "28201"),
("DC024", "P024", "777 Camera Way", "Columbus", "OH", "43201"),
("DC025", "P025", "555 TV Ave", "Detroit", "MI", "48201"),
("DC026", "P026", "222 Soundbar Blvd", "Memphis", "TN", "38101"),
("DC027", "P027", "444 Thermostat St", "Louisville", "KY", "40201"),
("DC028", "P028", "666 Dishwasher Rd", "Milwaukee", "WI", "53201"),
("DC029", "P029", "888 Refrigerator Lane", "Baltimore", "MD", "21201"),
("DC030", "P030", "999 Washing Machine Blvd", "Kansas City", "MO", "64101");


INSERT INTO `famous-smithy-443003-b3.product_management_system.Warehouse`
(Warehouse_ID, Distribution_Center_ID, Street, City, State, Zipcode)
VALUES
("W001", "DC001", "321 Warehouse St", "Austin", "TX", "73301"),
("W002", "DC002", "654 Depot Rd", "San Francisco", "CA", "94105"),
("W003", "DC003", "987 Stockpile Ave", "Seattle", "WA", "98101"),
("W004", "DC004", "111 Inventory St", "Denver", "CO", "80202"),
("W005", "DC005", "222 Stock Ave", "Boston", "MA", "02108"),
("W006", "DC006", "123 Storage Ln", "Los Angeles", "CA", "90001"),
("W007", "DC007", "555 Logistic Rd", "Chicago", "IL", "60601"),
("W008", "DC008", "777 Supply St", "Houston", "TX", "77001"),
("W009", "DC009", "999 Mouse St", "Phoenix", "AZ", "85001"),
("W010", "DC010", "888 Printer Rd", "Dallas", "TX", "75201"),
("W011", "DC011", "444 Router Rd", "Atlanta", "GA", "30301"),
("W012", "DC012", "666 Speaker St", "Miami", "FL", "33101"),
("W013", "DC013", "222 Fitness Rd", "Orlando", "FL", "32801"),
("W014", "DC014", "777 Webcam Blvd", "Portland", "OR", "97201"),
("W015", "DC015", "111 Drive Ln", "Salt Lake City", "UT", "84101"),
("W016", "DC016", "333 Projector Rd", "Las Vegas", "NV", "89101"),
("W017", "DC017", "555 Drone St", "San Diego", "CA", "92101"),
("W018", "DC018", "999 Light St", "New York", "NY", "10001"),
("W019", "DC019", "444 Power Bank Rd", "Philadelphia", "PA", "19101"),
("W020", "DC020", "888 VR Lane", "San Jose", "CA", "95101"),
("W021", "DC021", "333 Microwave St", "Nashville", "TN", "37201"),
("W022", "DC022", "222 Coffee Maker Ln", "Indianapolis", "IN", "46201"),
("W023", "DC023", "555 Vacuum Blvd", "Charlotte", "NC", "28201"),
("W024", "DC024", "666 Camera Rd", "Columbus", "OH", "43201"),
("W025", "DC025", "444 TV Ave", "Detroit", "MI", "48201"),
("W026", "DC026", "888 Soundbar Blvd", "Memphis", "TN", "38101"),
("W027", "DC027", "111 Thermostat Ln", "Louisville", "KY", "40201"),
("W028", "DC028", "333 Dishwasher St", "Milwaukee", "WI", "53201"),
("W029", "DC029", "999 Refrigerator Blvd", "Baltimore", "MD", "21201"),
("W030", "DC030", "555 Washing Machine Ave", "Kansas City", "MO", "64101");


INSERT INTO `famous-smithy-443003-b3.product_management_system.Warehouse_Inventory`
(Warehouse_ID, Product_ID, Number_in_Stock)
VALUES
("W001", "P001", 100),
("W002", "P002", 200),
("W003", "P003", 150),
("W004", "P004", 80),
("W005", "P005", 90),
("W006", "P006", 75),
("W007", "P007", 110),
("W008", "P008", 120),
("W009", "P009", 50),
("W010", "P010", 140),
("W011", "P011", 200),
("W012", "P012", 100),
("W013", "P013", 90),
("W014", "P014", 75),
("W015", "P015", 85),
("W016", "P016", 130),
("W017", "P017", 70),
("W018", "P018", 60),
("W019", "P019", 110),
("W020", "P020", 100),
("W021", "P021", 120),
("W022", "P022", 200),
("W023", "P023", 140),
("W024", "P024", 75),
("W025", "P025", 85),
("W026", "P026", 90),
("W027", "P027", 50),
("W028", "P028", 100),
("W029", "P029", 200),
("W030", "P030", 150);

INSERT INTO `famous-smithy-443003-b3.product_management_system.Distribution_Center_Products`
(Distribution_Center_ID, Product_ID)
VALUES
("DC001", "P001"),
("DC002", "P002"),
("DC003", "P003"),
("DC004", "P004"),
("DC005", "P005"),
("DC006", "P006"),
("DC007", "P007"),
("DC008", "P008"),
("DC009", "P009"),
("DC010", "P010"),
("DC011", "P011"),
("DC012", "P012"),
("DC013", "P013"),
("DC014", "P014"),
("DC015", "P015"),
("DC016", "P016"),
("DC017", "P017"),
("DC018", "P018"),
("DC019", "P019"),
("DC020", "P020"),
("DC021", "P021"),
("DC022", "P022"),
("DC023", "P023"),
("DC024", "P024"),
("DC025", "P025"),
("DC026", "P026"),
("DC027", "P027"),
("DC028", "P028"),
("DC029", "P029"),
("DC030", "P030");





































