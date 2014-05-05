#添加一列
ALTER TABLE test.vendors
ADD vend_phone CHAR(20);

#删除添加的列
ALTER TABLE test.vendors
DROP COLUMN vend_phone;

CREATE TABLE test.products
(
	prod_id		int			NOT NULL AUTO_INCREMENT,
	prod_name	char(20)	NULL,
	prod_price	char(10)	NULL,
	prod_desc	char(50)	NULL,
	PRIMARY KEY (prod_id)
)ENGINE = InnoDB;

#ALTER TABLE 常用于定义外键
ALTER TABLE test.orderitems
ADD CONSTRAINT fk_orderitems_orders
FOREIGN KEY (order_num) 
REFERENCES test.orders (order_num);

#不知道为什么失败了……
ALTER TABLE test.orderitems
ADD CONSTRAINT fk_orderitems_products
FOREIGN KEY (prod_id) 
REFERENCES test.products (prod_id);

#不知道为什么失败了……
ALTER TABLE test.orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (cust_id) 
REFERENCES test.customers (cust_id);

#不知道为什么失败了……
ALTER TABLE test.products
ADD CONSTRAINT fk_products_vendors
FOREIGN KEY (vend_id) 
REFERENCES test.vendors (vend_id);


#-----------------------------------------------

DROP TABLE test.orderitems_2;

#-----------------------------------------------

RENAME TABLE test.customers2 TO customers;

RENAME TABLE backup_customers TO customers,
			 backup_vendors	  TO vendors,
			 backup_products  TO products;