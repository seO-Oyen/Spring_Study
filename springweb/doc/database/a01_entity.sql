-- 하나의 속성에 여러개의 데이터가 입력 경우 처리 방법
CREATE TABLE customer(
	cu_id varchar2(50) PRIMARY KEY,
	name varchar2(50),
	address varchar2(100),
	phone varchar2(200)
);
INSERT INTO customer values('himan','홍길동','서울시..',
'010-8888-9999;010-5555-8888;010-7777-5555');
-- 해다 다중데이터 변경할 가망성 앞으로 없고, 전화번호이외의 정보가 필요없을 때.
SELECT * FROM customer;
CREATE TABLE customer2(
	cu_id varchar2(50) PRIMARY KEY,
	name varchar2(50),
	address varchar2(100)
);
INSERT INTO customer2 values('himan','홍길동','서울시..');
CREATE TABLE phoneInfo01(
	cu_id varchar2(50),
	phone varchar2(100),
	etc varchar2(100)
);
-- 속성에 다중데이터가 들어갈 때, entity를 분리 시키는 경우가 있는데
-- 1. 해당 다중데이터가 수정할 가능이 높고,
-- 2. 대중데이터뿐만아니라 연계된 속성도 포함되어 있을 때..
INSERT INTO phoneInfo01 values('himan','010-8888-9999','개인용');
INSERT INTO phoneInfo01 values('himan','010-5555-8888','회사영업');
INSERT INTO phoneInfo01 values('himan','010-7777-5555','회사사무');
SELECT * FROM customer2;
SELECT * FROM phoneInfo01;
SELECT * 
FROM customer2 a, phoneInfo01 b
WHERE a.cu_id = b.cu_id;




