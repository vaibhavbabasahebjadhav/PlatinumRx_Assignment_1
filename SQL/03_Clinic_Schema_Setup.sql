CREATE TABLE clinics (
    cid TEXT PRIMARY KEY,
    clinic_name TEXT,
    city TEXT,
    state TEXT,
    country TEXT
);

CREATE TABLE customer (
    uid TEXT PRIMARY KEY,
    name TEXT,
    mobile TEXT
);

CREATE TABLE clinic_sales (
    oid TEXT PRIMARY KEY,
    uid TEXT,
    cid TEXT,
    amount INT,
    datetime DATETIME,
    sales_channel TEXT
);

CREATE TABLE expenses (
    eid TEXT PRIMARY KEY,
    cid TEXT,
    description TEXT,
    amount INT,
    datetime DATETIME
);

-- SAMPLE DATA
INSERT INTO clinics VALUES
('c1','Clinic A','Bangalore','Karnataka','India'),
('c2','Clinic B','Mysore','Karnataka','India');

INSERT INTO customer VALUES
('u1','John','9999999999'),
('u2','Sam','8888888888');

INSERT INTO clinic_sales VALUES
('o1','u1','c1',5000,'2021-01-10','online'),
('o2','u2','c1',7000,'2021-01-15','offline'),
('o3','u1','c2',4000,'2021-02-10','online');

INSERT INTO expenses VALUES
('e1','c1','medicine',2000,'2021-01-10'),
('e2','c2','rent',1000,'2021-02-10');