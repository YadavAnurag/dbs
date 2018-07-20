schoolmangement database

CREATE DATABASE schoolmangement;




1. genders table

CREATE TABLE genders(
	gender_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	gender ENUM('Male', 'Female', 'Other') NOT NULL ,
	PRIMARY KEY (gender_id),
	UNIQUE(gender)
)engine = INNODB;

INSERT INTO genders(gender) values('Male'),('Female'),('Other');


2.maritals table

CREATE TABLE maritals(
	marital_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	marital ENUM('Married', 'Unmarried') NOT NULL,
	PRIMARY KEY (marital_id),
	UNIQUE(marital)
)engine = INNODB;

INSERT INTO maritals(marital) values('Married'), ('Unmarried');

3.semesters table

CREATE TABLE semesters(
	semester_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	semester ENUM('None', 'First Semester', 'Second Semester', 'Third Semester', 'Fourth Semester', 'Fifth Semester', 'Sixth Semester', 'Seventh Semester', 'Eighth Semester') NOT NULL,
	PRIMARY KEY(semester_id),
	UNIQUE(semester)	
)engine = INNODB;

INSERT INTO semesters(semester) values('None'),
	('First Semester'),
	('Second Semester'),
	('Third Semester'),
	('Fourth Semester'),
	('Fifth Semester'),
	('Sixth Semester'),
	('Seventh Semester'),
	('Eighth Semester');


4.years table

CREATE TABLE years(
	year_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	year ENUM('None', 'First Year','Second Year', 'Third Year', 'Final Year') NOT NULL,
	PRIMARY KEY (year_id),
	UNIQUE(year)
)engine = INNODB;

INSERT INTO years(year) values('None'),
 	('First Year'),
 	('Second Year'),
 	('Third Year'),
 	('Final Year');

5.branches table

CREATE TABLE branches(
	branch_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	branch  ENUM('Chemical Engineering',
		'Civil Engineering',
		'Computer Science and Engineering',
		'Electrical Engineering',
		'Electronics and Communication Engineering',
		'Mechanical Engineering') NOT NULL,
	PRIMARY KEY(branch_id),
	UNIQUE(branch)
)engine = INNODB;

INSERT INTO branches(branch) values('Chemical Engineering'),
	('Civil Engineering'),
	('Computer Science and Engineering'),
	('Electrical Engineering'),
	('Electronics and Communication Engineering'),
	('Mechanical Engineering');




6.users table

CREATE TABLE users(
	user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	pass CHAR(40) NOT NULL,
	date_entered DATETIME NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	middle_name VARCHAR(60) NULL,
	last_name VARCHAR(60) NOT NULL,
	email VARCHAR(60) NOT NULL,
	branch_id INT UNSIGNED NOT NULL,
	semester_id INT UNSIGNED NOT NULL,
	year_id INT UNSIGNED NOT NULL,
	dob DATE NOT NULL,
	marital_id INT UNSIGNED NOT NULL,
	gender_id INT UNSIGNED NOT NULL,
	age INT UNSIGNED NOT NULL,
	mobile INT(10) NULL,
	gaurdian VARCHAR(80) NOT NULL,
	gaurdian_relation VARCHAR(40) NOT NULL,
	address VARCHAR(300) NOT NULL,
	interest VARCHAR(60) NULL,
	PRIMARY KEY(user_id),
	FOREIGN KEY(branch_id) REFERENCES branches(branch_id),
	FOREIGN KEY(semester_id) REFERENCES semesters(semester_id),
	FOREIGN KEY(year_id) REFERENCES years(year_id),
	FOREIGN KEY(marital_id) REFERENCES maritals(marital_id),
	FOREIGN KEY(gender_id) REFERENCES genders(gender_id),
	INDEX (date_entered),
	INDEX (branch_id),
	INDEX(semester_id),
	INDEX(year_id),
	UNIQUE (email)
)engine = INNODB;

ALTER TABLE users AUTO_INCREMENT = 20160001;

student enters

INSERT INTO users(pass, date_entered, first_name,
	middle_name, last_name, email,
	branch_id, semester_id, year_id,
	dob, marital_id, gender_id,
	age, mobile, gaurdian,
	gaurdian_relation, address, interest)
	values(SHA1('mypass'), now(), 'Anu',
		'Gopal', 'Anurag', 'andsu@gmail.com',
		3, 3, 2,
		'1996-08-15', 1, 1,
		19, 8354820950, 'Deep Chand Yadav',
		'Father-son', 'Sakrawal Tanda Ambedkar Nagar U.P.', 'mypass');

staff enters

INSERT INTO users(pass, date_entered, first_name,
	middle_name, last_name, email,
	branch_id, semester_id, year_id,
	dob, marital_id, gender_id,
	age, mobile, gaurdian,
	gaurdian_relation, address, interest)
	values(SHA1('mypass'), now(), 'Anu',
		'Gopal', 'Anurag', 'gopal@gmail.com',
		3, 1, 1,
		'1996-08-15', 1, 1,
		19, 8354820950, 'Deep Chand Yadav',
		'Father-son', 'Sakrawal Tanda Ambedkar Nagar U.P.', 'Network Security');





7.attendances table

CREATE TABLE attendances( 
	attendance_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	date_entered DATETIME NOT NULL,
	java ENUM('Upsent', 'Present') NOT NULL,
	db ENUM('Upsent', 'Present') NOT NULL,
	networking ENUM('Upsent', 'Present') NOT NULL,
	php ENUM('Upsent', 'Present') NOT NULL,
	java_lab ENUM('Upsent', 'Present') NOT NULL,
	PRIMARY KEY (attendance_id),
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	INDEX(user_id),
	INDEX(date_entered)
 )engine = innodb;

INSERT INTO attendances(user_id, date_entered, java, db, networking, php, java_lab)
	values(20160001, now(), 'Present', 'Present', 'Upsent', 'Present', 'Present' );



8.marks table

CREATE TABLE marks(
	marks_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	date_entered DATETIME NOT NULL,
	java INT SIGNED NOT NULL,
	db INT SIGNED NOT NULL,
	networking INT SIGNED NOT NULL,
	php INT SIGNED NOT NULL,
	java_lab INT SIGNED NOT NULL,
	PRIMARY KEY(marks_id),
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	INDEX(user_id),
	INDEX(date_entered)
)engine = INNODB;

INSERT INTO marks(user_id, date_entered, java, db, networking, php, java_lab)
	values(20160001, now(), 85, -32, 12, -2, 56);


9.complains table

CREATE TABLE complains(
	complain_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	date_entered DATETIME NOT NULL,
	complain_type VARCHAR(100) NOT NULL,
	complain_body LONGTEXT NOT NULL,
	PRIMARY KEY(complain_id),
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	INDEX (user_id),
	INDEX (date_entered)
)engine = INNODB;

INSERT INTO complains(user_id, date_entered, complain_type, complain_body)
	values(20160001, now(), 'attendance problem', 'my attendane is wrong entered');