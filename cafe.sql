cafetaria database

0. menu_category table
CREATE TABLE menu_category(
category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
PRIMARY KEY(category_id),
UNIQUE(name)
)ENGINE = INNODB;

INSERT INTO menu_category(name)
VALUES('Starter'),('Lunch'),('Dinner');

1. menus table
CREATE TABLE menus(
menu_id int unsigned NOT NULL AUTO_INCREMENT,
category_id INT UNSIGNED NOT NULL,
name VARCHAR(40) NOT NULL,
info VARCHAR(100),
price DECIMAL(4,2) NOT NULL,
date_entered DATETIME NOT NULL,
PRIMARY KEY(menu_id),
FOREIGN KEY(category_id) REFERENCES menu_category(category_id),
UNIQUE(name),
INDEX(name)
)ENGINE = INNODB;

INSERT INTO menus(category_id,name, info, price, date_entered)
VALUES(2,'samosa', 'this is our samosa which is best', 5.4, now());

2. genders table

CREATE TABLE genders(gender_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
gender ENUM('Male', 'Female', 'Other') default 'Male' NOT NULL,
PRIMARY KEY(gender_id),
UNIQUE(gender)
)ENGINE = INNODB;

INSERT INTO genders(gender) VALUES('Male'),('Female'), ("Other");

3. users table

CREATE TABLE users(user_id int UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(40) NOT NULL,
middle_name VARCHAR(60),
last_name VARCHAR(60),
gender_id int UNSIGNED NOT NULL, 
email VARCHAR(60) NOT NULL,
pass CHAR(40) NOT NULL,
mobile VARCHAR(12) NOT NULL,
address LONGTEXT NOT NULL,
date_entered DATETIME NOT NULL,
PRIMARY KEY(user_id),
FOREIGN KEY(gender_id) REFERENCES genders(gender_id),
UNIQUE(email),
INDEX(date_entered),
INDEX(email)
)ENGINE = INNODB;

INSERT INTO users(
first_name, middle_name, last_name, gender_id, email, pass, mobile, address, date_entered
)VALUES(
'fuck', 'you', '', 1, 'anufz00@gmail.com', SHA1('mypass'), 83, 'want to know my address fuck you!!!!!!', now()
);


4. reservation table

CREATE TABLE reservations(
reservation_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
user_id INT UNSIGNED NOT NULL,
table_no INT UNSIGNED NOT NULL,
table_date DATE NOT NULL,
table_time TIME NOT NULL,
people INT UNSIGNED NOT NULL,
date_entered DATETIME NOT NULL,
PRIMARY KEY(reservation_id),
FOREIGN KEY(user_id) REFERENCES users(user_id),
UNIQUE(table_no),
INDEX(table_no),
INDEX(table_date),
INDEX(date_entered)
)ENGINE = INNODB;


INSERT INTO reservations(
user_id, table_no, table_date, table_time, people, date_entered
)VALUES(
1, 30, '2018-1-30', '03-30-00' ,6 , now()
);


5. feedback table

CREATE TABLE feedbacks(
feedback_id int UNSIGNED NOT NULL AUTO_INCREMENT,
email VARCHAR(60) NOT NULL,
body LONGTEXT NOT NULL,
date_entered DATETIME NOT NULL,
PRIMARY KEY(feedback_id),
UNIQUE(email),
INDEX(date_entered)
) ENGINE = INNODB;

INSERT INTO feedbacks(
email, body, date_entered
)VALUES(
1, 'Your starter is good', now()
);


6. temp table

CREATE TABLE t(
tid int unsigned not null AUTO_INCREMENT,
tdate date NOT NULL,
tpeople int NOT NULL
ttime TIME ,
PRIMARY KEY(tid)
);