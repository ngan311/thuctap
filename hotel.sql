CREATE DATABASE hotel;
Use hotel;

CREATE TABLE hotels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(100),
    room_type VARCHAR(50),
    stars INT,
    location_area VARCHAR(50),
    description TEXT,
    image VARCHAR(255),
    rating FLOAT DEFAULT 0,
    days INT,
    base_price FLOAT,
    final_price FLOAT,
    ai_score FLOAT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin','user') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    hotel_id INT,

    comment TEXT,
    score FLOAT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE hotel_price_history (
    id INT AUTO_INCREMENT PRIMARY KEY,

    hotel_id INT,

    price_date DATE,

    normal_price FLOAT,
    holiday_price FLOAT,

    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT,
    hotel_id INT,

    check_in DATE,
    check_out DATE,

    total_days INT,
    total_price FLOAT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users(username,email,password,role)
VALUES(
'admin',
'admin@gmail.com',
'123456',
'admin'
);