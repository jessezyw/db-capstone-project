USE littlelemondb;

/*
Insert query to populate "MenuItems" table:
*/

INSERT INTO MenuItems (ItemID, Course, Starter, Desert, Drink)
VALUES
(1, 'Greek salad', 'Olives', 'Greek yoghurt', 'Athens White wine'),
(2, 'Pizza', 'Minestrone', 'Cheesecake', 'Italian Coffee'),
(3, 'Kabasa', 'Minestrone', 'Ice cream', 'Turkish Coffee');


/*
Insert query to populate "Menus" table:
*/
INSERT INTO Menus (MenuID, ItemID, MenuName, Cuisine)
VALUES
(1, 1, 'Ogga','Greek'),
(2, 2, 'Mpct', 'Italian'),
(3, 3, 'Fitk', 'Turkish');


/*
Insert query to populate "Customers" table:
*/
INSERT INTO Customers (CustomerID, FirstName, LastName, ContactNumber, Email)
VALUES
(1, 'Anna', 'Iversen', 44627187, 'annaiversen@163.com'),
(2, 'Joakim', 'Iversen', 74237178, 'joakimiii@personal.com'),
(3, 'Vanessa', 'McCarthy', 25637176, 'vanessamcc@corpms.com'),
(4, 'Marcos', 'Romero', 17732934, 'macosromero@softcorp.com'),
(5, 'Hiroki', 'Yamane', 28832006, 'hirokiyamane@homeuse.com'),
(6, 'Diana', 'Pinto', 39634318, 'dianapc@accway.com');


/*
Insert query to populate "Address" table:
*/
INSERT INTO Address (AddressID, Street, City, State, Country, CustomerID)
VALUES
(1, '200 Maple Lane', 'Detroit', 'MI', 'USA', 1),
(2, '333 South Lake Drive', 'Columbus', 'OH', 'USA', 2),
(3, '1 Sunny Place', 'Muncie', 'IN', 'USA', 3),
(4, '829 Riverside Drive', 'Phoenix', 'AZ', 'USA', 4),
(5, '4545 53rd Street', 'Chicago', 'IL', 'USA', 4),
(6, '555 High Street','Dollsville','CA', 'USA', 5),
(7, '1000 5th Avenue','New York','NY', 'USA', 6);


/*
Insert query to populate "Delivery" table:
*/
INSERT INTO Delivery (DeliveryID, Status, DeliveryDate, AddressID)
VALUES 
(1, 'takeout', '2022-5-19', 1),
(2, 'dine-in', '2022-5-20', 2),
(3, 'dine-in', '2022-5-20', 7),
(4, 'dine-in', '2022-8-22', 5),
(5, 'dine-in', '2022-8-22', 3),
(6, 'dine-in', '2022-8-31', 6);


/*
Insert query to populate "Employees" table:
*/
INSERT INTO Employees (EmployeeID, Name, Role, Address, ContactNumber, Email, AnnualSalary)
VALUES
(1,'Mario Gollini','Manager',"724, Parsley Lane, Old Town, Chicago, IL",351258074,'Mario.g@littlelemon.com','$70,000'),
(2,'Adrian Gollini','Assistant Manager',"334, Dill Square, Lincoln Park, Chicago, IL",351474048,'Adrian.g@littlelemon.com','$65,000'),
(3,'Giorgos Dioudis','Head Chef',"879 Sage Street, West Loop, Chicago, IL",351970582,'Giorgos.d@littlelemon.com','$50,000'),
(4,'Fatma Kaya','Assistant Chef',"132  Bay Lane, Chicago, IL",351963569,'Fatma.k@littlelemon.com','$45,000'),
(5,'Elena Salvai','Head Waiter',"989 Thyme Square, EdgeWater, Chicago, IL",351074198,'Elena.s@littlelemon.com','$40,000'),
(6,'John Millar','Receptionist',"245 Dill Square, Lincoln Park, Chicago, IL",351584508,'John.m@littlelemon.com','$35,000');


/*
Insert query to populate "Bookings" table:
*/
INSERT INTO Bookings (BookingID, TableNo, CustomerID, BookingDate, EmployeeID)
VALUES
(1, 12, 1,'2022-5-19', 1),
(2, 12, 2, '2022-5-20', 1),
(3, 19, 6, '2022-8-22', 3),
(4, 15, 4, '2022-8-22', 4),
(5, 5, 3, '2022-8-31', 2),
(6, 8, 5, '2022-5-20', 5);


/*
Insert query to populate "Orders" table:
*/
INSERT INTO Orders (OrderID, CustomerID,TableNo, OrderDate, MenuID, BookingID, Quantity, TotalCost, DeliveryID)
VALUES
(1, 1, 12, '2022-5-19', 1, 1, 2, 170.00, 1),
(2, 2, 19, '2022-5-20', 2, 2, 1, 55.00, 2),
(3, 6, 15, '2022-5-20', 2, 3, 2, 110.00, 3),
(4, 4, 5, '2022-8-22', 3, 4, 3, 180.00, 4),
(5, 3, 8, '2022-8-22', 1, 5, 4, 350.00, 5),
(6, 5, 12, '2022-8-31', 3, 6, 3, 200.00, 6);




