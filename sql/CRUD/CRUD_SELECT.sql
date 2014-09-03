# Repair shop price list
SELECT name as `Service name`, curPrice as `Price` FROM Services ORDER BY curPrice;

# All customers and their cars
SELECT DISTINCT CONCAT(Users.lastName, ' ', Users.firstName) as `Full name`, Users.phoneNumber as `Phone`,
Users.email as `Email`, CONCAT(Manufacturers.name, ' ', Cars.model) as `Car model`,
Cars.number as `Car number`, Cars.mileage as `Mileage`
FROM Users INNER JOIN Cars ON Users.userID=Cars.customerID
INNER JOIN Manufacturers ON Cars.manufacturerID=Manufacturers.manufacturerID
ORDER BY `Full name`;

# Car orders with full price of services
SELECT Orders.orderID as `Order id`, CONCAT(Users.firstName, ' ', Users.lastName) as `Full name`,
CONCAT(Manufacturers.name, ' ', Cars.model) as `Car model`, Orders.status, 
(SELECT SUM(price) FROM OrdersInfo GROUP BY orderID HAVING orderID=Orders.orderID) as `Total price` FROM Orders
INNER JOIN Cars ON Orders.carID=Cars.carID
INNER JOIN Manufacturers ON Cars.manufacturerID=Manufacturers.manufacturerID
INNER JOIN Users ON Users.userID=Cars.customerID ORDER BY `Total price` desc;

# Full order price information
SELECT Services.name, OrdersInfo.price FROM ordersinfo
INNER JOIN Services ON OrdersInfo.serviceID=Services.serviceID
WHERE ordersinfo.orderID=2;

# Average order amount
SELECT AVG(total) as `Average order price` FROM 
(SELECT SUM(price) AS total FROM OrdersInfo GROUP BY orderID) as totalitems;

# List of cars being servicing
SELECT COUNT(*) as `Cars on servicing` FROM Orders WHERE status='processing';

# Percent of services on status done
SELECT (
(SELECT COUNT(*) FROM Orders WHERE status = 'done')/
(SELECT COUNT(*) FROM Orders WHERE status != 'done')*100) as 'Repaired machines (%)';