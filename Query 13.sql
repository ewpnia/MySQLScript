SELECT *
FROM test.productnotes;

INSERT INTO test.productnotes
VALUES(NULL,       #自增的值用NULL给出
	'1008',
	20140310,
	'刚发了笔617，失败了'
);

INSERT INTO test.productnotes
VALUES(NULL,
	'1009',
	20140310,
	NULL
);

#更安全的INSERT
INSERT INTO test.productnotes
(
	note_id,
	prod_id,
	note_date,
	note_text
)
VALUES
(
	NULL,
	'1010',
	20140310,
	'I have got a IPad Mini 2!!'
);

#省略可为NULL或有自增值的列
INSERT INTO test.productnotes
(
	prod_id,
	note_date,
	note_text
)
VALUES
(
	'1011',
	20140310150314,
	'I need more money.'
);


#降低语句优先级
#INSERT LOW_PRIORITY INTO
#UPDATE LOW_PRIORITY ...
#DELETE LOW_PRIORITY ...


#插入多条
INSERT INTO test.productnotes
(
	prod_id,
	note_date,
	note_text
)
VALUES
(
	'1012',
	20140310150908,
	NULL
),
(
	'1013',
	20140310150952,
	'Today is Monday.'
);

#INSERT SELECT
#别插入重复的主件
#以下的以不插入主键让MySQL自动生成主键
INSERT INTO test.productnotes
(
	prod_id,
	note_date,
	note_text
)
SELECT
	postal_code,
	last_update,
	address
FROM sakila.address
WHERE phone = '144453869132';   #不给条件则所有查出的值都会被插入
