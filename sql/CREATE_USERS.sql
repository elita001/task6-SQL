CREATE USER 'user'@'localhost' IDENTIFIED BY 'upass';

# Select
GRANT SELECT ON repair_shop.Orders TO 'user'@'localhost';
GRANT SELECT ON repair_shop.OrdersInfo TO 'user'@'localhost';
GRANT SELECT ON repair_shop.Cars TO 'user'@'localhost';
GRANT SELECT ON repair_shop.Services TO 'user'@'localhost';

# Insert
GRANT INSERT ON repair_shop.Orders TO 'user'@'localhost';
GRANT INSERT ON repair_shop.OrdersInfo TO 'user'@'localhost';

# Delete
GRANT DELETE ON repair_shop.OrdersInfo TO 'user'@'localhost';