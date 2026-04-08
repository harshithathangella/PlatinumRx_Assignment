CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);

INSERT INTO users VALUES
('u1', 'John Doe', '9876543210', 'john@mail.com', 'Bangalore'),
('u2', 'Alice', '9123456780', 'alice@mail.com', 'Hyderabad');

CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO bookings VALUES
('b1', '2021-11-10 10:00:00', '101', 'u1'),
('b2', '2021-11-15 12:00:00', '102', 'u2'),
('b3', '2021-10-05 09:00:00', '103', 'u1');

SELECT 
    u.name,
    b.room_no,
    b.booking_date
FROM users u
JOIN bookings b ON u.user_id = b.user_id;

CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate DECIMAL(10,2)
);

INSERT INTO items VALUES
('i1', 'Tawa Paratha', 18),
('i2', 'Mix Veg', 89),
('i3', 'Paneer Butter Masala', 120);

CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

INSERT INTO booking_commercials VALUES
('bc1', 'b1', 'bill1', '2021-11-10 11:00:00', 'i1', 3),
('bc2', 'b1', 'bill1', '2021-11-10 11:00:00', 'i2', 2),
('bc3', 'b2', 'bill2', '2021-11-15 13:00:00', 'i1', 5),
('bc4', 'b3', 'bill3', '2021-10-05 10:00:00', 'i3', 10);

SELECT 
    bc.bill_id,
    i.item_name,
    bc.item_quantity,
    i.item_rate,
    (bc.item_quantity * i.item_rate) AS total
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id;

SELECT 
    bc.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
GROUP BY bc.booking_id;