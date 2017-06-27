create table APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   username VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   phone VARCHAR(20) NOT NULL,
   address VARCHAR(500),
   PRIMARY KEY (id),
   UNIQUE (username)
);
   
create table ROLE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);
   
CREATE TABLE APP_USER_ROLE (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_ROLE FOREIGN KEY (role_id) REFERENCES ROLE (id)
);
  
INSERT INTO ROLE (type) VALUES ('USER');
INSERT INTO ROLE(type) VALUES ('ADMIN');
  
INSERT INTO APP_USER(username, password, first_name, last_name, email, phone, address)
VALUES ('admin','1234', 'Dam','Duong','duongdp90@gmail.com', '0917787098', '5/9 Binh Dong');
  
INSERT INTO APP_USER_ROLE (user_id, role_id)
  SELECT user.id, profile.id FROM APP_USER user, ROLE profile
  where user.username='admin' and profile.type='ADMIN';
 
/* Create persistent_logins Table used to store rememberme related stuff*/
CREATE TABLE PERSISTENT_LOGINS (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);