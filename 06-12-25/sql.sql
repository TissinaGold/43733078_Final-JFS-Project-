CREATE DATABASE eshop;
USE eshop;
CREATE TABLE users (
    id BIGINT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    enabled TINYINT(1) NOT NULL,
    name VARCHAR(100),
    surname VARCHAR(100),
    address VARCHAR(255),
    PRIMARY KEY (id)
);
CREATE TABLE roles (
    role_id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (role_id)
);

CREATE TABLE users_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
);

INSERT INTO `users` (`user`,`username`,`password`,`enabled`, `name`, `surname`, `address`) 
VALUES 
(1 ,'admin1','$2a$12$8um7u23O.G0qOxGdWciMF.8W7vjJKeGVJAfHUT5xV9kEtV13U07Ze',1,'Admin','User','Address');

INSERT INTO `users` (`username`,`password`,`enabled`, `name`, `surname`, `address`) 
VALUES 
('user','$2a$12$4HJ/8/rd7woAb0gAB8FbxOr8i8T8eNq/1ynjPJtTMcQhC36NQ2gfS',1,'Normal','User','Address');

CREATE TABLE item (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    price DECIMAL(10,2) NOT NULL,
    photos VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE orders (
    id BIGINT NOT NULL AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    total_amount DECIMAL(10,2),
    PRIMARY KEY (id),
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE basket (
    order_id BIGINT NOT NULL,
    item_id BIGINT NOT NULL,
    quantity INT DEFAULT 1,
    PRIMARY KEY (order_id, item_id),
    CONSTRAINT fk_basket_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_basket_item FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE CASCADE
);

CREATE TABLE user_roles (
    user_id INT NOT NULL,
    role_id INT NOT NULL
);


INSERT INTO `roles` (`role_id`,`name`) VALUES (1, 'USER'); 
INSERT INTO `roles` (`role_id`,`name`) VALUES (2, 'ADMIN'); 

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES (11, 22); -- admin
INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES (5, 6); -- user

INSERT INTO item (name, description, price, photos) VALUES
('Laptop', 'High-performance laptop', 1200.00, 'laptop.jpg'),
('Smartphone', 'Latest Android smartphone', 800.00, 'smartphone.jpg'),
('Headphones', 'Noise-cancelling headphones', 150.00, 'headphones.jpg');

Select * from roles;
Select  * from item;