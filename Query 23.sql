#安全管理

#获得所有用户账号列表
USE mysql;
SELECT user FROM user;

SELECT * FROM user;

#创建用户账号
CREATE USER Isis IDENTIFIED BY 'password'; #这里密码明文显示了
#使用‘IDENTIFIED BY PASSWORD’后面跟密文密码

#用户名：Isis
#密码：	 password
#刚创建的用户是没有任何权限的

#重命名用户账号
RENAME USER Isis TO Anquely;

#删除用户及其权限
DROP USER Anquely;

#看赋予用户账号的权限
SHOW GRANTS FOR Isis;
#USAGE表示无任何权限

#设置权限
GRANT SELECT ON test.* TO Isis;
#允许用户Isis在test库中的所有表上使用SELECT
#即用户Isis对test数据库中的所有数据具有制度访问权限

GRANT SELECT, INSERT ON test.* TO Isis;

#撤销权限
#GRANT的反操作
REVOKE SELECT ON test.* FROM Isis;

#更改口令
SET PASSWORD FOR Isis = Password('newpassword');
#改为'newpassword'

#更改自己的口令
SET PASSWORD = Password('123456');


#-------------------------------------------------------

#检查表键是否正确
ANALYZE TABLE test.orders;

#发现并修复问题
CHECK TABLE test.orders, orderitems;