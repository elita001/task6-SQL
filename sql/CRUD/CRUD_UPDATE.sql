# Up price by 5%
UPDATE Services SET curPrice=curPrice * 1.05 WHERE serviceID=1;

#Change phone number
UPDATE Users SET phoneNumber='654987' WHERE userID=2;

#Change mileage
UPDATE Cars SET mileage=28200 WHERE carID=3;