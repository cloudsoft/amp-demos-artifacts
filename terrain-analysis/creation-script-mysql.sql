create database visitors;

-- creating users
CREATE USER 'brooklyn'@'%' IDENTIFIED BY 'br00k11n';
CREATE USER 'brooklyn'@'localhost' IDENTIFIED BY 'br00k11n';

-- if your blueprint sets the password it can be removed here
-- grant all privileges on *.*  to 'brooklyn'@'%' identified by 'br00k11n';
--  useful if sockets work also
grant all privileges on *.* to 'brooklyn'@'localhost';
grant all privileges on *.* to 'brooklyn'@'%';

delete from mysql.user where User='';
flush privileges;

-- and now the table for visitors
use visitors;

CREATE TABLE MESSAGES (
                          id BIGINT NOT NULL AUTO_INCREMENT,
                          NAME VARCHAR(30) NOT NULL,
                          MESSAGE VARCHAR(400) NOT NULL,
                          PRIMARY KEY (ID)
);

INSERT INTO MESSAGES(NAME, MESSAGE) values ('J. C. Wylie', 'A plan of action designed in order to achieve some end; a purpose together with a system of measures for its accomplishment.' );
