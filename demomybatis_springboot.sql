DROP DATABASE IF EXISTS javaspring_mybatis;

CREATE DATABASE javaspring_mybatis;

USE javaspring_mybatis;

CREATE TABLE users(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(50) NOT NULL, 
	password VARCHAR(100) NOT NULL,
	enabled BOOLEAN DEFAULT TRUE
);

CREATE TABLE roles(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE user_roles(
	user_id BIGINT NOT NULL,
	role_id BIGINT NOT NULL,
	PRIMARY KEY(user_id, role_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY(role_id) REFERENCES roles(id)
);

CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO roles (name) VALUES ('ROLE_USER'), ('ROLE_ADMIN');