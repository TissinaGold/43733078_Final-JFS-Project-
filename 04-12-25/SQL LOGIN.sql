-- Create database (if not already created)
CREATE DATABASE IF NOT EXISTS hibernate_db;

-- Use the database
USE hibernate_db;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT NOT NULL AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
