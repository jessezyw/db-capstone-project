USE littlelemondb;


SELECT * FROM Bookings;
/*
Task 1

Little Lemon wants to populate the Bookings table of their database with some records of data. Your first task is to replicate the list of records 
in the following table by adding them to the Little Lemon booking table. 
*/
INSERT INTO Bookings(BookingDate, TableNo, CustomerID)
VALUES
('2022-10-10', 5, 1),
('2022-11-12', 3, 3),
('2022-10-11', 2, 2),
('2022-10-13', 2, 1);

SELECT * FROM Bookings;


/*
Task 2

Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this 
procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.

The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the procedure to check 
the status of each table.
*/
DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //
CREATE PROCEDURE CheckBooking(input_date DATE, input_table INT)
BEGIN
	DECLARE Statu_num INT;
    SELECT CustomerID INTO Statu_num 
	FROM Bookings
	WHERE BookingDate = input_date AND TableNo = input_table;
    
    IF Statu_num > 0 THEN
		SELECT CONCAT('Table ', input_table, ' is already booked.') AS 'Booking Status';
	ELSE 
		SELECT CONCAT('Table ', input_table, ' is unbooked.') AS 'Booking Status';
    END IF;
END //

-- test1
CALL CheckBooking('2022-11-12', 3);
-- test2
CALL CheckBooking('2022-11-22', 3);


/*
Task 3

Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. 

Since integrity is not optional, Little Lemon need to ensure that every booking attempt includes these verification and decline steps. However, implementing 
these steps requires a stored procedure and a transaction. 

To implement these steps, you need to create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if 
a customer reserves a table that’s already booked under another name.  

Use the following guidelines to complete this task:
	The procedure should include two input parameters in the form of booking date and table number.
	It also requires at least one variable and should begin with a START TRANSACTION statement.
	Your INSERT statement must add a new booking record using the input parameter's values.
	Use an IF ELSE statement to check if a table is already booked on the given date. 
	If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction.
*/

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //
CREATE PROCEDURE AddValidBooking(input_date DATE,
								 input_table INT, 
                                 customer_id INT)
BEGIN
	START TRANSACTION;
    
		SELECT @bookingstatu := COUNT(CustomerID)
		FROM Bookings
		WHERE BookingDate = input_date AND TableNo = input_table;
        
		INSERT INTO Bookings(CustomerID, BookingDate, TableNo)
		VALUES (customer_id, input_date, input_table);
    
    IF @bookingstatu > 0 THEN
		ROLLBACK;
		SELECT CONCAT('Table ', input_table, ' is already booked - booking cancelled') AS 'Booking Status';
        
	ELSEIF @bookingstatu = 0 THEN 
		COMMIT;
		SELECT CONCAT('Table ', input_table, ' is booked successfully.') AS 'Booking Status';
        
    END IF;

END //

SELECT * FROM Bookings;
-- test 1
CALL AddValidBooking('2022-11-12', 3, 2);

-- test 2 
CALL AddValidBooking('2022-12-17', 6, 3);

SELECT * FROM Bookings;



/*
Task 4

In this first task you need to create a new procedure called AddBooking to add a new table booking record.

The procedure should include four input parameters in the form of the following bookings parameters:
	booking id, 
	customer id, 
	booking date,
	and table number.
*/

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //
CREATE PROCEDURE AddBooking(booking_id INT,
							cust_id INT,
                            booking_date DATE,
                            table_num INT
							)
BEGIN
	INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNo)
    VALUES (booking_id, cust_id, booking_date, table_num);
    
    SELECT 'New Booking Added' AS Confirmation;
END//

CALL AddBooking(11, 3, '2022-12-30', 4);


/*
Task 5

For your second task, Little Lemon need you to create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.

The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement inside the procedure. 
*/

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //
CREATE PROCEDURE UpdateBooking(booking_id INT,
							   booking_date DATE
								)
BEGIN
	UPDATE Bookings
    SET BookingDate = booking_date
    WHERE BookingID = booking_id;
    
    SELECT 'Booking 9 updated.' AS Confirmation;
END //

CALL UpdateBooking(9, '2022-12-17');



/*
Task 6

 Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking.
 
 The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure.
*/

DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //
CREATE PROCEDURE CancelBooking(booking_id INT)
BEGIN
	DELETE FROM Bookings WHERE BookingID = booking_id;
    
    SELECT 'Booking 9 cancelled.' AS Confirmation;
END //

SELECT * FROM Bookings;
CALL CancelBooking(9);
SELECT * FROM Bookings;






