
CREATE DATABASE BOARD_01;

USE BOARD_01;

drop table MEMBER;

CREATE TABLE MEMBER(
member_id	varchar(20)	not null	primary key,
member_pw	varchar(30) not null,
member_name	varchar(30) not null,
member_regDate datetime not null
);

drop table ARTICLE;
CREATE TABLE ARTICLE(
article_no int auto_increment not null	primary key,
member_id varchar(20) not null,
article_title varchar(50) not null,
article_content text not null,
article_c_date datetime not null ,
article_u_date datetime not null,
article_count int not null default 0,
article_del varchar(1) not null default 'n'
);
ALTER TABLE ARTICLE ADD CONSTRAINT FK_article_member_id_member_member_id FOREIGN KEY(member_id)
			REFERENCES MEMBER (member_id) ON DELETE CASCADE ON UPDATE CASCADE;



drop table CMT;
CREATE TABLE CMT(
cmt_no int auto_increment not null primary key,
article_no int	not null,
member_id varchar(20) not null,
cmt_content varchar(300) not null,
cmt_c_date datetime not null,
cmt_u_date datetime not null,
depth int not null default 0,
seq int not null default 1,
parent_cmt_no int null,
cmt_del varchar(1) not null default 'n'
);

ALTER TABLE CMT ADD CONSTRAINT FK_cmt_article_no_article_article_no FOREIGN KEY(article_no)
	REFERENCES Article (article_no) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE CMT ADD CONSTRAINT FK_cmt_member_id_member_member_id FOREIGN KEY(member_id)
	REFERENCES Member (member_id) ON DELETE CASCADE ON UPDATE CASCADE;
    
    
   