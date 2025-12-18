CREATE DATABASE IF NOT EXISTS test2;
USE test2;

CREATE TABLE IF NOT EXISTS register (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  sex VARCHAR(100) NOT NULL,
  country VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO register(name,password,email,sex,country) VALUES
('arun','kumar','arun@gmail.com','Male','India'),
('sonoo','jaiswal','sonoo@javatpoint.com','male','India'),
('Ashok','ashok','ashok@javatpoint.com','male','India');
select * from register;
