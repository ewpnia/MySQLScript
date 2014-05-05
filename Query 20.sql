#触发器
#表支持触发器，视图不支持

#直接这样写会报错：Error Code: 1415. Not allowed to return a result set from a trigger	
#SELECT 会返回结果集，MySQL不允许
#CREATE TRIGGER newproduct AFTER INSERT ON test.products
#FOR EACH ROW 
#SELECT 'Product added';

DELIMITER //

CREATE TRIGGER newproduct AFTER INSERT ON test.products  #此触发器将在INSERT成功执行后执行
FOR EACH ROW 											 #代码对每个插入行执行
SELECT 'Product added' INTO @ee;						 #'Product added'将对每个插入的行显示一次

//

DELIMITER ;

SELECT * FROM test.products;

INSERT INTO test.products
(
	prod_name,
	prod_price,
	prod_desc
)
VALUES
(
	'Peach',
	11.1,
	'Pink'
);

SELECT @ee;

#每个表最多支持6个触发器：
#每条INSERT、UPDATE、DELETE的BEFORE和AFTER

#如果BEFORE触发器失败，则不执行语句
#如果BEFORE触发器或语句本身失败，则不执行AFTER触发器

DROP TRIGGER newprocuct;
#触发器不能更新或覆盖，只能先删除再重新创建

#----------------------------------------------------------------

#INSERT 触发器

DELIMITER //

#对于orders的每次插入这个触发器总是返回新的订单号
CREATE TRIGGER test.neworder AFTER INSERT ON test.orders
FOR EACH ROW
SELECT NEW.order_num INTO @neworder;                 #NEW是AFTER INSERT触发器生成的虚拟表，用于访问被插入的行
//

DELIMITER ;

INSERT INTO test.orders(order_date, cust_id)
VALUES(Now(), 10001);

SELECT @neworder;

#----------------------------------------------------------------

#DELETE 触发器

#DELETE触发器有一个OLD的虚拟表，访问被删除的行
#OLD中的值全都是只读的，不能更新

#保存将要被删除的行到一个存档表中

CREATE TABLE IF NOT EXISTS test.archive_orders
	(
		id 			INT AUTO_INCREMENT, 
		order_num 	INT, 
		order_date 	DATETIME, 
		cust_id 	INT, 
		PRIMARY KEY(id)
	);

DELIMITER //

CREATE TRIGGER test.deleteorder BEFORE DELETE ON test.orders
FOR EACH ROW
BEGIN
	#触发器里不能进行建表操作
	INSERT INTO test.archive_orders
	(order_num, order_date, cust_id)
	VALUES
	(OLD.order_num, OLD.order_date, OLD.cust_id);
END;

//

DELIMITER ;

SELECT * FROM test.orders;

DELETE FROM test.orders
WHERE order_num = '20010';

SELECT * FROM test.archive_orders;

#如果插入archive_orders表不成功，则DELETE将被放弃

#--------------------------------------------------------------------

#UPDATE触发器

#OLD虚拟表：UPDATE语句前的值
#NEW虚拟表：UPDATE更新的值

#保证插入的总是大写
DELIMITER //

CREATE TRIGGER test.updatevendor BEFORE UPDATE ON test.vendors
FOR EACH ROW
SET NEW.vend_state = Upper(NEW.vend_state);

//
DELIMITER ;


