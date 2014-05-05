
#显示所有可用字符集
SHOW CHARACTER SET;

#显示所支持校对的完整列表
SHOW COLLATION;

SHOW VARIABLES LIKE 'character%';
SHOW VARIABLES LIKE 'collation%';

#建表时指定字符集和校对顺序
CREATE TABLE test.mytable1
(
	column1		INT,
	column2		VARCHAR(10)
)DEFAULT CHARACTER SET hebrew
 COLLATE hebrew_general_ci;

#对列进行设置
CREATE TABLE test.mytable2
(
	column1 	INT,
	column2		VARCHAR(10),
	column3		VARCHAR(10) CHARACTER SET latin1 COLLATE
		latin1_general_ci
)DEFAULT CHARACTER SET hebrew
 COLLATE hebrew_general_ci;

#使用与建表时不同的校对顺序排序
SELECT * FROM test.customers
ORDER BY lastname, firstname COLLATE latin1_general_cs;

#_ci:不区分大小写
#_cs:区分大小写

#COLLATE还可以用于GROUP BY、HAVING、聚集函数、别名等

#串可以在字符集之间进行转换
#使用Cast()或Convert()