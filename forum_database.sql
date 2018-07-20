forum database

1. forums table

CREATE TABLE forums (
forum_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(60) NOT NULL,
PRIMARY KEY (forum_id),
UNIQUE (name)
) ENGINE = INNODB;

INSERT INTO forums(name)
values(
'MySQL', 'PHP', 'Sports', 'HTML', 'CSS','Kindling'
);


2. users table

CREATE TABLE users(
user_id mediumint unsigned not null auto_increment,
username varchar(30) not null,
pass char(40) not null,
first_name varchar(20) not null,
last_name varchar(40) not null,
email varchar(60) not null,
primary key(user_id),
unique(email),
unique(username),
index login(pass,email)
)ENGINE=INNODB;


INSERT INTO users(
username, pass, first_name, last_name, email
)values(
'reptile', SHA1('com'), 'Shivam', 'Kushwaha', 'Kushwaha@gmail.com'
);


3. messages table

CREATE TABLE messages(
message_id int(10) unsigned not null auto_increment,
parent_id int(10) unsigned not null default 0,
forum_id tinyint unsigned not null,
user_id mediumint unsigned not null,
subject varchar(100) not null,
body longtext not null,
date_entered datetime not null,
primary key(message_id),
index(parent_id),
index(forum_id),
index(user_id),
index(date_entered)
)ENGINE = MYISAM;

INSERT INTO messages(
parent_id, forum_id, user_id, subject, body, date_entered
)values(
4, 7, 3, 'Game', 'Update your version', now()
);
