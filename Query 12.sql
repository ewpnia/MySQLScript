#全文本搜索
#除非使用BINARY方式，否则不区分大小写
#短词（三个或以下字符）会被忽略
CREATE TABLE test.productnotes
(
	note_id		int			NOT NULL AUTO_INCREMENT,
	prod_id		char(10)	NOT NULL,
	note_date	datetime	NOT NULL,
	note_text	text		NULL,
	PRIMARY KEY(note_id),
	FULLTEXT(note_text)   #启用全文本搜索支持，可以索引多个列
)ENGINE = MyISAM;
#两个数据库引擎，InnoDB不支持全文本搜索，MyISAM支持
#除了在建表时创建，也可更改创建好的表使其支持全文本搜索
#导入数据后再修改其使其支持FULLTEXT

SELECT *
FROM test.productnotes;

#Match()指定被搜索的列，Against()指定要使用的搜索表达式
SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('rabbit');

#微妙的差别
SELECT note_text
FROM test.productnotes
WHERE note_text LIKE '%rabbit%';

#全文检索的结果经过排序
#排序依据是检索单词在文本中的靠前程度，越前越高
SELECT note_text,
       Match(note_text) Against('rabbit') AS rank
FROM test.productnotes;

SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('detect');
#查询拓展
SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('detect' WITH QUERY EXPANSION);


#布尔文本搜索
#没有定义FULLTEXT索引也可以使用(?)，效率低
#不排序
SELECT address_id, address 
FROM sakila.address
WHERE Match(address) Against('China' IN BOOLEAN MODE);  #WHY WRONG?

SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('rabbit' IN BOOLEAN MODE);

SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('rabbit -detect*' IN BOOLEAN MODE); #排除以detect开头的单词的行
#-、*等都是布尔操作符，还有其他一系列的操作符

SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('+rabbit +detect*' IN BOOLEAN MODE); #搜索包含这两个单词的行

#找到包含两个中任意一个单词的句子
SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('rabbit rabbits' IN BOOLEAN MODE);

SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('"saw rabbits"' IN BOOLEAN MODE);  #匹配一句

SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('>rabbits <rabbit' IN BOOLEAN MODE);  #增加前者等级，降低后者等级

SELECT note_text
FROM test.productnotes
WHERE Match(note_text) Against('+detect +(<rabbit)' IN BOOLEAN MODE);


