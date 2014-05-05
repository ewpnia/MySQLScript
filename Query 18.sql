#存储过程

#执行存储过程
CALL productpricing
(
	@pricelow,
	@pricehigh,
	@priceaverage
);
#执行名为productpricing的存储过程
#计算并返回产品的最低、最高和平均价格

#----------------------------------------------------------------

#DELIMITER 分隔符，因MySQL默认以‘；’为分隔符，若不声明分隔符，
#则编译器会把存储过程当成SQL语句进行处理，存储过程的编译会报错
DELIMITER //

CREATE PROCEDURE test.productpricing()
BEGIN
	SELECT Avg(prod_price) AS priceaverage
	FROM test.products;
END //

DELIMITER ;   #使用完后记得把分隔符还原

CALL productpricing();

DROP PROCEDURE test.productpricing;  #删除存储过程不带（）

#----------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE test.productpricing(
	OUT pl DECIMAL(8,2),                #OUT表示传出值给pl，还有IN、INOUT
	OUT ph DECIMAL(8,2),
	OUT pa DECIMAL(8,2)
)
BEGIN
	SELECT Min(prod_price)
	INTO pl                             #INTO关键字传值
	FROM test.products;
	SELECT Max(prod_price)
	INTO ph
	FROM test.products;
	SELECT Avg(prod_price)
	INTO pa
	FROM test.products;
END; //

DELIMITER ;
#不能通过一个参数返回多个行和列

#以下语句不显示任何数据，它返回以后可以显示的变量
CALL productpricing 
(
	@pricelow,
	@pricehigh,
	@priceaverage  #报WARNING是pa的精度只有两位小数，而平均值后跟很长的小数位，多余的被截掉
);

SELECT @priceaverage;

SELECT @pricelow,@pricehigh,@priceaverage;

#------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE test.ordertotal
(
	IN		onumber INT,
	OUT		ototal	DECIMAL(8,2)
)
BEGIN
	SELECT Sum(item_price * quantity)
	FROM test.orderitems
	WHERE order_num = onumber
	INTO ototal;
END; //

DELIMITER ;

#如果test.orderitems的数据变更了，或（20005，@total）变成（20064，@total）
#都要重新调CALL 再 SELECT
CALL ordertotal(20005, @total);

SELECT @total;

DROP PROCEDURE test.ordertotal;

#-----------------------------------------------------------

-- Name: ordertotal
-- Parameters: onumber = order number
-- 			   taxable = 0 if not taxable, 1 if taxable
-- 			   ototal = order total varible

DELIMITER //

CREATE PROCEDURE test.ordertotal
(
	IN onumber INT,
	IN taxable BOOLEAN,
	OUT ototal DECIMAL(8,2)
)COMMENT 'Obtain order total, optionally adding tax'  #SHOW PROCEDURE STATUS 中显示

BEGIN
	-- Declare variable for total
	DECLARE total DECIMAL(8,2);
	-- Declare tax percentage
	DECLARE taxrate INT DEFAULT 6;

	-- Get the order total
	SELECT Sum(item_price * quantity)
	FROM test.orderitems
	WHERE order_num = onumber
	INTO total;

	-- Is this taxable?
	IF taxable THEN
		-- Yes, so add taxrate to the total
		SELECT total + (total / 100 * taxrate) INTO total;
	END IF;

	-- And finally, save to out variable
	SELECT total INTO ototal;

END; //

DELIMITER ;

CALL test.ordertotal(20005, 0, @total);
SELECT @total;

CALL test.ordertotal(20005, 1, @total);
SELECT @total;

SHOW PROCEDURE STATUS;
SHOW PROCEDURE STATUS LIKE 'ordertotal';