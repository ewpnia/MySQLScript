SELECT *
FROM test.productnotes;

#使用UPDATE时不带WHERE，会更新表中所有行！
UPDATE test.productnotes
SET prod_id = '10081'
WHERE note_id = 8;

UPDATE test.productnotes
SET prod_id = '10082',
	note_text = 'The text have been changed.'
WHERE note_id = 8;

#以下prod_id超长，更新失败
UPDATE test.productnotes
SET prod_id = '10083000000',
	note_text = 'Test for IGNORE'
WHERE note_id = 9;

#加了IGNORE后忽略错误，照常插入
#超长部分被截去，SQL报WARNING
UPDATE IGNORE test.productnotes
SET prod_id = '10083000000',
	note_text = 'Test for IGNORE'
WHERE note_id = 9;

#更新成NULL变相删除数据
UPDATE test.productnotes
SET note_text = NULL
WHERE note_id = 2;

#-----------------------------------------------------------

#使用DELETE时不带WHERE，会删除表中所有行！
#safe mode 不能使用非主键的方式删除行，以下删除会报错
DELETE FROM test.productnotes
WHERE prod_id = 21954;
#使用主键删除
DELETE FROM test.productnotes
WHERE note_id = 20;

#DELETE 删除行
#UPDATE 删除列

#TRUNCATE TABLE
#删除原表并重新创建一个相同的新表
#比直接使用DELETE删除表中所有行更快
