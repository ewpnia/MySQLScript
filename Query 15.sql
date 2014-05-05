CREATE TABLE test.customers
(
	cust_id			int			NOT NULL AUTO_INCREMENT,
	cust_name		char(50)	NOT NULL,
	cust_address 	char(50)	NULL,
	cust_city		char(50)	NULL,
	cust_state		char(5)		NULL,
	cust_zip		char(10)	NULL,
	cust_country	char(50)	NULL,
	cust_contact	char(50)	NULL,
	cust_email		char(255)	NULL,
	PRIMARY KEY (cust_id)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS test.customers
(
	cust_id			int			NOT NULL AUTO_INCREMENT,
	cust_name		char(50)	NOT NULL,
	cust_address 	char(50)	NULL,
	cust_city		char(50)	NULL,
	cust_state		char(5)		NULL,
	cust_zip		char(10)	NULL,
	cust_country	char(50)	NULL,
	cust_contact	char(50)	NULL,
	cust_email		char(255)	NULL,
	PRIMARY KEY (cust_id)
)ENGINE = InnoDB;

CREATE TABLE test.orders
(
	order_num		int			NOT NULL AUTO_INCREMENT,
	order_date		datetime	NOT NULL,
	cust_id		 	int			NOT NULL,
	PRIMARY KEY (order_num)
)ENGINE = InnoDB;

CREATE TABLE test.vendors
(
	vend_id			int			NOT NULL AUTO_INCREMENT,
	vend_name		char(50)	NOT NULL,
	vend_address 	char(50)	NULL,
	vend_city		char(50)	NULL,
	vend_state		char(5)		NULL,
	vend_zip		char(10)	NULL,
	vend_country	char(50)	NULL,
	PRIMARY KEY (vend_id)
)ENGINE = InnoDB;

#NOT NULL 的列允许写入‘’（空字符串）
#NULL 与‘’（空字符串）是不一样的

CREATE TABLE test.orderitems
(
	order_num		int			NOT NULL,
	order_item		int			NOT NULL,
	prod_id			char(10)	NOT NULL,
	quantity		int			NOT NULL,
	item_price		decimal(8,2)NOT NULL,
	PRIMARY KEY (order_num, order_item)
);

#每个表只允许一个AUTO_INCREMENT列
#且它必须被索引（如，通过使它成为主键）

#这里order_num为AUTO_INCREMENT
INSERT INTO test.orders
(
	order_num,
	order_date,
	cust_id
)
VALUES
(
	10,		#order_num设为10
	20140311,
	987654321
);
#以下的未声明，插入时order_num自动设为11
INSERT INTO test.orders
(
	order_date,
	cust_id
)
VALUES
(
	20140311,
	0000
);

#以下函数返回最后一个使用的AUTO_INCREMENT值
SELECT last_insert_id();

CREATE TABLE test.orderitems_2
(
	order_num		int			NOT NULL,
	order_item		int			NOT NULL,
	prod_id			char(10)	NOT NULL,
	quantity		int			NOT NULL DEFAULT 1, #设置默认值为1
	item_price		decimal(8,2)NOT NULL,
	PRIMARY KEY (order_num, order_item)
);
#默认值只能用常量，不能用函数
#使用默认值而不是NULL

