-- USERS TABLE
CREATE TABLE users (
    user_id TEXT PRIMARY KEY,
    name TEXT,
    phone_number TEXT,
    mail_id TEXT,
    billing_address TEXT
);

-- BOOKINGS TABLE
CREATE TABLE bookings (
    booking_id TEXT PRIMARY KEY,
    booking_date DATETIME,
    room_no TEXT,
    user_id TEXT
);

-- BOOKING COMMERCIALS
CREATE TABLE booking_commercials (
    id TEXT PRIMARY KEY,
    booking_id TEXT,
    bill_id TEXT,
    bill_date DATETIME,
    item_id TEXT,
    item_quantity FLOAT
);

-- ITEMS TABLE
CREATE TABLE items (
    item_id TEXT PRIMARY KEY,
    item_name TEXT,
    item_rate INT
);

-- SAMPLE DATA
INSERT INTO users VALUES
('u1','John Doe','9876543210','john@gmail.com','ABC City'),
('u2','Sam','9876543211','sam@gmail.com','XYZ City');

INSERT INTO bookings VALUES
('b1','2021-11-10 10:00:00','101','u1'),
('b2','2021-11-15 12:00:00','102','u1'),
('b3','2021-10-20 09:00:00','103','u2');

INSERT INTO items VALUES
('i1','Paratha',20),
('i2','Veg Curry',80);

INSERT INTO booking_commercials VALUES
('c1','b1','bill1','2021-11-10','i1',3),
('c2','b1','bill1','2021-11-10','i2',2),
('c3','b2','bill2','2021-11-15','i1',5),
('c4','b3','bill3','2021-10-20','i2',15);