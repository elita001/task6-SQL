CREATE DATABASE IF NOT EXISTS repair_shop;
USE repair_shop;

CREATE TABLE Roles
(
	roleID int AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE
) engine=InnoDB;

CREATE TABLE Users
(
    userID int AUTO_INCREMENT PRIMARY KEY,
	roleID int NOT NULL,
    firstName varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    phoneNumber int unsigned,
    email varchar(50) NOT NULL UNIQUE,

	FOREIGN KEY (roleID) REFERENCES Roles(roleID) ON DELETE RESTRICT ON UPDATE CASCADE
) engine=InnoDB;

CREATE TABLE Services
(
    serviceID int AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) NOT NULL,
    curPrice int unsigned
) engine=InnoDB;

CREATE TABLE Manufacturers
(
	manufacturerID int AUTO_INCREMENT PRIMARY KEY,
	name varchar(50)
) engine=InnoDB;

CREATE TABLE Cars
(
    carID int AUTO_INCREMENT PRIMARY KEY,
    customerID int,
    manufacturerID INT,
    number varchar(6) NOT NULL,
    model varchar(30),
    mileage int unsigned,

    FOREIGN KEY (customerID) REFERENCES Users(userID) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (manufacturerID) REFERENCES Manufacturers(manufacturerID) ON DELETE SET NULL ON UPDATE CASCADE
) engine=InnoDB;

CREATE TABLE Orders
(
    orderID int AUTO_INCREMENT PRIMARY KEY,
    carID int,
    status ENUM('open', 'processing', 'done'),

    FOREIGN KEY (carID) REFERENCES Cars(carID) ON DELETE SET NULL ON UPDATE CASCADE
) engine=InnoDB;

CREATE TABLE OrdersInfo
(
    infoID int AUTO_INCREMENT PRIMARY KEY,
    orderID int NOT NULL,
    serviceID int NOT NULL,
    price int unsigned NOT NULL,

    FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (serviceID) REFERENCES Services(serviceID) ON DELETE RESTRICT ON UPDATE CASCADE
) engine=InnoDB;