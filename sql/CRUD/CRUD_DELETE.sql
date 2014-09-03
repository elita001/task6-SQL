# Delete all Customer Cars
DELETE Cars FROM Cars
INNER JOIN Users ON Cars.customerID=Users.userID
WHERE Users.userID=1;

# Delete specific order
DELETE FROM Orders WHERE Orders.orderID=2;

# Delete user with specific email
DELETE FROM Users WHERE email='email9@mail.ru';

# Delete some services from order with specific price, if status not done
DELETE OrdersInfo FROM OrdersInfo
INNER JOIN Orders ON OrdersInfo.orderID=Orders.orderID
WHERE (Orders.orderID = 7) AND (Orders.status != 'done') AND (OrdersInfo.price > 2000);