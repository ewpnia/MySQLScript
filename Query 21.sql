#事务处理(事务：一组SQL数据)
#InnoDB支持事务处理
#MyISAM不支持

#标识事务开始
START TRANSACTION;
#从STAR到COMMIT为止，中间的SQL语句块要么全部成功，要么全部不成功
#保证完整性

SELECT * FROM test.ordertotals;
START TRANSACTION;
DELETE FROM test.ordertotals
WHERE order_num = '10';
SELECT * FROM test.ordertotals;
ROLLBACK;                          #有了START TRANSACTION;才可以ROLLBACK
SELECT * FROM test.ordertotals;

#可回退：INSERT、UPDATE、DELETE
#不可回退：SELECT、CREATE、DROP

#--------------------------------------------------------------------------------- 

#在START TRANSACTION;中，COMMIT要明确发起
START TRANSACTION;

SELECT * FROM test.orderitems;
DELETE FROM test.orderitems WHERE order_num = '20005';

SELECT * FROM test.orders;
DELETE FROM test.orders WHERE order_num = '20005';

COMMIT;
#如果第一条DELETE起作用，但第二条失败，则DELETE不会提交
#事实上，DELETE会被自动撤销


#-------------------------------------------------------------------

#保留点
#用于仅回退到某个占位符，而不是整个事务回退

#创建占位符
SAVEPOINT delete1;
#回退
ROLLBACK TO delete1;

#释放保留点
RELEASE SAVEPOINT delete1;
#执行了相应的ROLLBACK或COMMIT后也会自动释放

#-------------------------------------------------------------------

#默认的MySQL行为是自动提交所有更改的

#指示MySQL不自动提交更改
SET autocommit = 0;
#autocommit 针对每个连接而不是服务器

