CREATE TABLE ch02_r02_customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(100),
    last_purchase DATE,
    ssn VARCHAR(11)
);

CREATE TABLE ch02_r02_customers_clean (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(100),
    last_purchase DATE,
    ssn VARCHAR(11)
);



INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (1, 'Stephanie', 'Hunt', 'kaylee27@harris-nelson.info', '001-415-091-2832x228', 'Lisafurt', '2023-11-04', '256-99-9666');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (2, 'Gary', 'Love', 'jennifer52@torres-clay.com', '3737137304', 'Hammondhaven', '2024-03-23', '250-98-4827');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (3, 'Carol', 'Meyer', 'rebeccarush@hotmail.com', '(723)328-9114x84278', 'Michaelhaven', '2024-01-04', '663-18-8639');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (4, 'Jessica', 'Moran', 'cassandra97@valenzuela.com', '001-691-644-7190x551', 'North Hannahport', '2024-02-02', '704-28-9846');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (5, 'Johnathan', 'Arroyo', 'karennunez@hotmail.com', '6439107591', 'Bryanchester', '2023-11-24', '534-05-8503');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (6, 'Ricardo', 'Newman', 'edwardmcgee@summers.com', '304-794-1899x000', 'Lake Bonnieburgh', '2024-03-09', '260-34-4878');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (7, 'Bonnie', 'Williams', 'lcampbell@gmail.com', '691.869.0022', 'West Mariah', '2024-06-05', '475-64-0131');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (8, 'Vanessa', 'Richmond', 'browningmelinda@evans.com', '2147945031', 'East Mark', '2024-01-06', '264-74-8825');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (9, 'Margaret', 'Allen', 'hartcynthia@yahoo.com', '(816)340-3663', 'Meganstad', '2024-07-14', '850-64-4705');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (10, 'Anthony', 'Allen', 'howardcassandra@yahoo.com', '(091)239-6529x27955', 'West Sandyfurt', '2024-07-10', '118-58-7403');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (11, 'Stephanie', 'Hunt', 'kaylee27@harris-nelson.info', '001-415-091-2832x228', 'Lisafurt', '2023-11-04', '256-99-9666');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (12, 'Erica', 'Thomas', 'christopher22@yahoo.com', '001-766-316-1485', 'South Darlene', '2024-03-20', '407-32-1279');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (13, 'Marissa', 'Long', 'april19@dalton.org', '001-897-441-6662x725', 'Andrewshire', '2023-10-23', '229-16-9413');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (14, 'Megan', 'Harris', 'shannon59@lawrence.com', '+1-720-439-0363x350', 'New James', '2024-06-27', '590-80-3524');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (15, 'Jared', 'Santos', 'mark88@williams-wade.com', '(730)923-0264x8656', 'Caitlinberg', '2024-06-14', '703-26-8304');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (16, 'Stephanie', 'Marquez', 'amandadavis@anderson.net', '+1-514-455-6912', 'Harrisfort', '2024-05-23', '083-50-8630');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (17, 'Jessica', 'Ramos', 'james14@gmail.com', '001-969-808-8830x963', 'West Debra', '2024-09-12', '262-79-7645');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (18, 'Charles', 'Coleman', 'kevin27@pacheco.org', '(616)927-1122', 'Lake Paul', '2024-01-27', '472-34-9872');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (19, 'Christina', 'Davis', 'townsendmary@gmail.com', '370.995.8872x515', 'Morganberg', '2024-02-14', '201-30-2783');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (20, 'Jessica', 'Richardson', '', '', 'East William', '2024-09-06', '204-80-7411');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (21, 'Jessica', '', 'kristinacosta@gmail.com', '001-407-814-8164x816', 'East William', '2024-08-06', '204-80-7411');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (22, 'Kimberly', 'Mcconnell', 'xsnyder@yahoo.com', '6711300344', 'Larryville', '2024-05-22', '490-15-0632');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (23, 'Daniel', 'Scott', 'jennifertyler@yahoo.com', '001-950-539-4020', 'East Timothyhaven', '2024-10-08', '703-60-0569');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (24, 'Thomas', 'Tucker', 'chapmancindy@byrd.com', '+1-120-543-5449', 'Karenberg', '2024-05-04', '719-32-1764');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (25, 'Wayne', 'Castillo', 'elizabethgonzalez@gmail.com', '675-360-5863x0761', 'Lake Nicholas', '2024-02-24', '407-94-8160');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (26, 'Mark', 'Andersen', 'james09@hotmail.com', '131-755-5599x627', 'Lake Rachel', '2024-09-02', '251-84-4354');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (27, 'Angel', 'Hamilton', 'ryandavid@smith-anderson.com', '157-235-7008x511', 'Randyfort', '2024-01-20', '409-14-5060');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (28, 'Anthony', 'Simmons', 'jamesali@gmail.com', '255-227-6594x6630', 'Port Tina', '2024-01-24', '846-14-4807');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (29, 'Paul', 'Ruiz', 'joshua81@hotmail.com', '(759)288-1498', 'South William', '2024-08-23', '016-14-1358');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (30, 'Kevin', 'Bennett', 'jasmin92@warner-lopez.com', '(321)921-6327x2904', 'Brittanyfort', '2024-10-04', '664-92-4988');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (31, 'Anthony', 'Simmons', 'jamesali@gmail.com', '255-227-6594x6630', 'Port Tina', '2024-01-24', '846-14-4807');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (32, 'Steven', 'Cantu', 'jthompson@washington.biz', '(801)649-2118x110', 'Leachchester', '2024-01-08', '018-42-2246');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (33, 'Benjamin', 'Clark', 'sdecker@harrington.com', '745.565.2089', 'North Jeff', '2024-05-20', '332-40-1279');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (34, 'Dustin', 'Turner', 'michaelsmith@adams.com', '4760075800', 'North Andretown', '2024-09-17', '653-18-4502');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (35, 'John', 'Harris', 'jacksonjohn@hotmail.com', '(113)259-9848x3318', 'Lake Tammyberg', '2024-10-17', '411-93-0753');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (36, 'Joseph', 'Wells', 'randywebb@perez-higgins.info', '676-519-4407', 'Rojashaven', '2024-08-14', '640-54-1165');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (37, 'Daniel', 'Brown', 'stevenmckee@gmail.com', '+1-138-096-4784x9644', 'Lake Travis', '2024-09-09', '118-08-2047');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (38, 'Angelica', 'Arnold', 'carolsummers@sparks.com', '(192)664-9542x382', 'Ericachester', '2024-06-19', '434-68-0763');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (39, 'David', 'Coleman', 'john18@hotmail.com', '(353)071-4388', 'Fischerside', '2024-02-20', '084-94-6294');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (40, 'Tom', 'Irwin', 'nmurray@gmail.com', '001-017-869-0718x443', 'North Danielburgh', '2024-02-25', '017-18-3765');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (41, 'Thomas', 'Tucker', 'chapmancindy@byrd.com', '+1-120-543-5449', 'Karenberg', '2024-05-04', '719-32-1764');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (42, 'Anne', 'Cox', 'jamesjimenez@gmail.com', '498.759.9099', 'Taylorshire', '2024-07-31', '877-96-5393');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (43, 'Angela', 'Curry', 'timothy70@rice.net', '593.813.9856', 'Alexandraland', '2024-01-06', '181-14-8271');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (44, 'Michael', 'Alvarez', 'huynhkayla@yahoo.com', '8514592177', 'Nunezberg', '2024-08-25', '733-08-0675');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (45, 'Kelly', 'Baker', 'seanhall@yahoo.com', '001-030-892-1145', 'Douglasfort', '2024-10-03', '060-84-6749');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (46, 'Yvonne', 'Smith', 'mooremelissa@rogers.org', '0253483103', 'Rosalesstad', '2024-01-07', '160-85-3673');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (47, 'Jennifer', 'Hall', 'atkinsdonna@price.com', '(891)620-6532', 'Lisachester', '2023-11-24', '165-73-1821');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (48, 'Timothy', 'Jackson', 'bvelasquez@bishop.com', '502.750.4270x959', 'Cobbbury', '2024-04-01', '530-24-8350');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (49, 'Thomas', 'Black', 'fryeandrea@hotmail.com', '+1-658-305-9238x753', 'Riddleshire', '2024-04-06', '730-44-5664');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (50, 'Michelle', '', '', '(121)608-0534', 'Sarafort', '2024-06-08', '470-94-1218');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (51, 'Michelle', 'White', 'cantuphyllis@gmail.com', '(121)608-0535', 'Sarafort', '2023-06-08', '470-94-1218');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (52, 'Michelle', 'Snow', 'cantuphyllis@gmail.com', '', 'Sarafort', '2022-06-08', '470-94-1218');
INSERT INTO ch02_r02_customers (customer_id, first_name, last_name, email, phone, city, last_purchase, ssn) VALUES (53, 'Michelle', 'Snow', 'cantuphyllis@gmail.com', '', 'Sarafort', '2022-06-08', '470-94-1218');