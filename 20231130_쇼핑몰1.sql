USE shopping_mall;

-- 회원테이블
CREATE TABLE  member_table(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_id VARCHAR(30) NOT NULL,
    member_pw VARCHAR(30) NOT NULL,
    member_name VARCHAR(20) NOT NULL,
    member_tel VARCHAR(20) NOT NULL,
    member_nic VARCHAR(20) NOT NULL,
    profile_img VARCHAR(100) NOT NULL DEFAULT 'C:\Users\HKIT\Documents\cjy\1.jpg',
    member_email VARCHAR(50) NOT NULL,
    member_grade VARCHAR(10) NOT NULL DEFAULT 'Bronze',
    reg_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- insert into member_tablecategory_tablemember_tableorder_table
-- values('hong1234','1234','홍길동','010-1234-1234','길동이','killdong@gmail.com');

-- 기존 테이블에 제약조건 추가
ALTER TABLE member_table ADD CONSTRAINT UNIQUE(member_id);
ALTER TABLE member_table ADD CONSTRAINT UNIQUE(member_nic);

select * from member_table;

DESC member_table;

DELETE FROM member_table WHERE id = 4;


select * from test_table;

INSERT INTO test_table(test_name) VALUES('테스트이름1'),('테스트이름2');

DELETE FROM test_table WHERE id = 2;

CREATE TABLE test_table(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    test_name VARCHAR(10) NOT NULL
);



-- member_table에 데이터 추가
INSERT INTO member_table(member_id, member_pw,
member_name, member_tel, member_nic, member_email, member_grade)
VALUES('kwang1234','1234',
'광개토대왕','010-4111-4337','광개토','kwanggaeto@gmail.com','Gold'),
('yskim','4567',
'김유신','010-1231-1231','김유신','yskim@gmail.com','Silver');

INSERT INTO category_table(cate_name)VALUES('상의');
INSERT INTO category_table(cate_name)VALUES('바지'),('아우터');

select * from category_table;

-- 카테고리 테이블
CREATE TABLE category_table(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cate_name VARCHAR(50) NOT NULL
);

select * from category_table;


CREATE TABLE product_table(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    stock INT NOT NULL,
    product_desc VARCHAR(100) NOT NULL,
    product_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    view_cnt INT NOT NULL DEFAULT 0,
    category_id BIGINT NOT NULL,
    FOREIGN KEY(category_id) REFERENCES category_table(id)
);

select * from product_table;
SELECT * FROM product_table ORDER BY product_date DESC;
SELECT * FROM product_table LIMIT 2;
SELECT * FROM product_table ORDER BY id DESC LIMIT 2;

UPDATE product_table SET price = 20000 WHERE id = 1;

UPDATE product_table SET price = 24000,
stock = 800 WHERE id =1;




INSERT INTO product_table(product_name, price,
stock, product_desc, category_id)
VALUES('스웨트셔츠',19960,
1000,'여유로운 실루엣의 오버사이즈 스웨트셔츠',1);

INSERT INTO product_table(product_name, price,
stock, product_desc, category_id)
VALUES('스웨트팬츠 그레이',26910,
500,'스웨트팬츠 그레이',2),
('데일리 푸퍼 숏 패딩 재킷 [블랙]',41890,
500,'매일 입기 좋은 데일리 푸퍼 숏 패딩 재킷.',3);


desc product_table;

CREATE TABLE order_table(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    product_cnt INT NOT NULL,
    total_price INT NOT NULL,
    order_process VARCHAR(10) NOT NULL,
    product_id BIGINT NOT NULL,
    FOREIGN KEY(product_id) REFERENCES product_table(id)
);

select * from order_table;

INSERT INTO order_table(product_cnt, total_price,
order_process, product_id)
VALUES(2,83780,'배송준비',3),
(3,53820,'배송준비',2);


-- 배송지 테이블
CREATE TABLE deliver_table(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    deliver_addr VARCHAR(50) NOT NULL,
    addr_detail VARCHAR(100),
    member_id VARCHAR(30) NOT NULL,
    FOREIGN KEY(member_id) REFERENCES member_table(member_id)
);

ALTER TABLE deliver_table 
ADD CONSTRAINT deliver_table_ibfk_2 FOREIGN KEY(member_id) REFERENCES member_table(member_id);
-- 참조 무결성 위배
SET foreign_key_checks= 0;

SET foreign_key_checks= 1;

select * from deliver_table;

DESC deliver_table;

ALTER TABLE deliver_table DROP FOREIGN KEY deliver_table_ibfk_1;
COMMIT;

INSERT INTO deliver_table(deliver_addr,addr_detail, member_id)
VALUES('대구광역시 동구 동대구로 566','한국IT교육원','kwang1234'),
('제주특별자치도 제주시 첨단로 242','카카오','yskim');

-- 후기 테이블
CREATE TABLE review_table(
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    review_star INT NOT NULL DEFAULT 3,
    review_content VARCHAR(100) NOT NULL,
    FOREIGN KEY(product_id) REFERENCES product_table(id)
);

select * from review_table;
select review_content from review_table;

select * from review_table WHERE product_id = 1;


INSERT INTO review_table(product_id,review_star,review_content)
VALUES(1,5,'가성비 좋게 잘 샀습니다 잘 쓰겠습니다'),
(3,4,'가볍고 착용감이 우수합니다.');


