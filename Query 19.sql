#游标
#只能在存储过程中使用
DELIMITER //

CREATE PROCEDURE test.processorders()
BEGIN

	DECLARE o INT;
	
	DECLARE done BOOLEAN DEFAULT 0;
	
	
	DECLARE ordernumbers CURSOR          #定义了游标
	FOR
	SELECT order_num FROM test.orders;

	-- Delcare continue handler
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;  #当没有更多行供REPEAT循环时，出现这个条件

	#定义有顺序：局部变量->游标->句柄，不遵守则出错

	#打开游标
	OPEN ordernumbers;

	-- Get order number
	-- FETCH ordernumbers INTO o;

	-- Loop through all rows
	REPEAT
		
		-- Get order number
		FETCH ordernumbers INTO o;
	
	-- End of loop
	UNTIL done END REPEAT;

	#关闭游标
	CLOSE ordernumbers;
	
END //

DELIMITER ;

DROP PROCEDURE test.processorders;


#-------------------------------------------------

DELIMITER //

CREATE PROCEDURE test.processorders()
BEGIN

	-- Declare local variables
	DECLARE done BOOLEAN DEFAULT 0;
	DECLARE o INT;
	DECLARE t DECIMAL(8,2);

	-- Declare the cursor
	DECLARE ordernumbers CURSOR
	FOR
	SELECT order_num  FROM test.orders;

	-- Declare continue handler
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

	-- Create a table to store the results
	CREATE TABLE IF NOT EXISTS test.ordertotals
	(order_num INT, total DECIMAL(8,2));

	-- Open the cursor	
	OPEN ordernumbers;

	-- Loop through all rows
	REPEAT

		-- Get order numer
		FETCH ordernumbers INTO o;

		-- Get the total for this order
		CALL test.ordertotal(o, 1, t);

		-- Insert order and total into ordertotals
		INSERT INTO test.ordertotals(order_num, total)
		VALUES(o, t);

	-- End of loop
	UNTIL done END REPEAT;

	-- Close the cursor
	CLOSE ordernumbers;

END //

DELIMITER ;

CALL test.processorders();

#多次执行以下SELECT会往表中反复插入数据
SELECT *
FROM test.ordertotals;

