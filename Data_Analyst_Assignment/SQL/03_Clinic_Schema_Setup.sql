DROP TABLE IF EXISTS clinic_sales;
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS clinics;

CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE customer (
    uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(15)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description VARCHAR(100),
    amount DECIMAL(10,2),
    datetime DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

INSERT INTO clinics VALUES
('c1', 'ABC Clinic', 'Bangalore', 'Karnataka', 'India'),
('c2', 'XYZ Clinic', 'Hyderabad', 'Telangana', 'India');

INSERT INTO customer VALUES
('u1', 'John Doe', '9876543210'),
('u2', 'Alice', '9123456780'),
('u3', 'Bob', '9000000000');

INSERT INTO clinic_sales VALUES
('o1', 'u1', 'c1', 2000, '2021-10-10 10:00:00', 'online'),
('o2', 'u2', 'c1', 3000, '2021-10-15 12:00:00', 'offline'),
('o3', 'u3', 'c2', 5000, '2021-11-05 09:00:00', 'online'),
('o4', 'u1', 'c2', 1500, '2021-11-10 14:00:00', 'offline');

INSERT INTO expenses VALUES
('e1', 'c1', 'medicines', 1000, '2021-10-12 08:00:00'),
('e2', 'c1', 'staff salary', 1500, '2021-10-20 09:00:00'),
('e3', 'c2', 'equipment', 2000, '2021-11-08 10:00:00'),
('e4', 'c2', 'rent', 1000, '2021-11-15 11:00:00');

SHOW TABLES;
SELECT * FROM clinics;
SELECT * FROM clinic_sales;