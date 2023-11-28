CREATE TABLE board_table(
	id BIGINT NOT NULL COMMENT '자동생성' AUTO_INCREMENT PRIMARY KEY,
    board_cate BOOLEAN DEFAULT 0 COMMENT '일반글은 0, 공지글은 1',
    board_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    board_tit VARCHAR(20) board_table NULL,
    board_content VARCHAR(200) NOT NULL,
    board_like INT NOT NULL DEFAULT 0,
    board_dislike INT NOT NULL DEFAULT 0,
    board_comment_cnt INT NOT NULL DEFAULT 0,
    board_file_name VARCHAR(30) NULL,
    board_file_path VARCHAR(200) NULL,
    board_writer VARCHAR(15) NOT NULL
);

select * from board_table;

CREATE TABLE member_table(
	id BIGINT NOT NULL COMMENT '자동생성' AUTO_INCREMENT PRIMARY KEY,
    memer_id VARCHAR(15) NOT NULL UNIQUE,
    member_pw VARCHAR(15) NOT NULL,
    member_nic VARCHAR(15) NOT NULL UNIQUE,
    member_grade VARCHAR(10) NOT NULL DEFAULT 'Bronze' COMMENT '기본값은 Bronze',
    member_visit_cnt INT NOT NULL DEFAULT 0 COMMENT '기본값은 0'
);

select * from member_table;

desc member_table;
-- desc 확인할 테이블명;
-- 테이블의 제약조건을 확인할 수 있다

-- 제약조건 추가
ALTER TABLE board_table ADD CONSTRAINT
FOREIGN KEY(board_writer) REFERENCES member_table(member_nic);

desc board_table;

CREATE TABLE comment_table(
	id BIGINT NOT NULL COMMENT '자동생성' AUTO_INCREMENT PRIMARY KEY,
    comment_content VARCHAR(200) NOT NULL,
    comment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comment_board_id BIGINT NOT NULL,
    FOREIGN KEY(comment_board_id) REFERENCES board_table(id)
);

desc comment_table;

select * from comment_table;

