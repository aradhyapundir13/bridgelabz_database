create table authors(
	author_id serial primary key,
	first_name varchar(8),
	last_name varchar(8),
	date_of_birth date,
	nationality varchar(8)
);

INSERT INTO authors (first_name, last_name, date_of_birth, nationality)
VALUES ('Jane', 'Austen', '1775-12-16', 'British');
Insert Into authors(first_name,last_name,date_of_birth,nationality)
Values('Shristi','Saha','11-01-2002','Indian');
Insert Into authors(first_name,last_name,date_of_birth,nationality)
Values('Yamuna','Shaw','15-11-2002','Indian');
INSERT INTO authors (first_name, last_name, date_of_birth, nationality)
VALUES ('Edgar', 'Poe', '1809-01-19', 'American');


select * from authors;

create table book(
	book_id serial primary key,
	title varchar(8),
	author_id int,
	publication_year date,
	genre varchar(8),
	isbn int,
	available_copies int,
	constraint fk_constraint foreign key (author_id) references authors(author_id)
);


INSERT INTO book(title,author_id, publication_year, genre, isbn, available_copies)
VALUES ('Incept',1, '2010-07-16', 'Sci-Fi', 81238, 20);

INSERT INTO book(title,author_id, publication_year, genre, isbn, available_copies)
VALUES ('Great',2, '1925-01-01', 'Fiction', 978123, 10);

update book
set author_id=3
	where book_id=1;
update book
set author_id=4
	where book_id=2;

select * from book;

create table members(
	member_id serial primary key,
	first_name varchar(8),
	last_name varchar(8),
	date_of_birth date,
	contact_number bigint,
	email varchar(15),
	membership_date date
);

INSERT INTO members (first_name, last_name, date_of_birth, contact_number, email, membership_date)
VALUES ('John', 'Doe', '1985-03-10', 123456, 'jdo@email.com', '2022-01-15');

INSERT INTO members (first_name, last_name, date_of_birth, contact_number, email, membership_date)
VALUES ('Alice', 'Smith', '1990-05-20', 987654, 'ali@email.com', '2015-03-12');

select * from members;

create table loans(
	loan_id serial primary key,
	book_id int,
	member_id int,
	loan_date Date,
	return_date Date,
	actual_return_date date,
	constraint fk_book_id
	foreign key (book_id)
	references Book(book_id),
	constraint fk_member_id
	foreign key (member_id)
	references members(member_id)
);
INSERT INTO loans (loan_date, return_date, actual_return_date)
VALUES ('2024-08-01', '2024-08-15', '2024-08-14');

INSERT INTO loans (loan_date, return_date, actual_return_date)
VALUES ('2024-08-01', '2024-08-15', '2024-08-14');

select * from loans;


create table staff(
	staff_id serial primary key,
	first_name varchar(8),
	last_name varchar(8),
	position1 varchar(8),
	contact_number bigint,
	email varchar(15),
	hire_date date
);
INSERT INTO staff (first_name, last_name, position1, contact_number, email, hire_date)
VALUES ('Olivia', 'Johnson', 'Devops', 9876543210, 'oli@example.com', '2023-04-15');

INSERT INTO staff (first_name, last_name, position1, contact_number, email, hire_date)
VALUES ('Ethan', 'Smith', 'Designer', 8765432109, 'et@example.com', '2022-09-10');

select * from staff;




--------- DDL Queries
-- 1. Add a new Column to the books table

alter table book
add column price double precision

-- 2.

alter table staff
rename column position1 to job_title

-- 3.

alter table members
drop column email


------ DML Queries

-- 1.

INSERT INTO books (title, publication_year, genre, isbn, available_copies,price)
VALUES ('Inception', '2010-07-16', 'Sci-Fi', 81238, 20, 1200);

-- 2.

update members
set contact_number = '123456'
Where member_id = 2

--3.

delete from loans
where loan_id=2

--4.

INSERT INTO loans (loan_date, return_date, actual_return_date)
VALUES ('2024-08-03', '2024-09-15', '2024-10-14');


------- Join Queries

-- 1.

select *
from book AS b
join authors AS a
On b.author_id=a.author_id;


-- 2.

select *
from loan as l
join members as mem
on mem.member_id=l.member_id
join book b
on b.book_id=l.book_id

-- 3.

select *
from book as b
join
	loan as l
	on l.book_id=b.book_id
join
	members as mem
	on mem.member_id=l.member_id
where
mem.member_id =2;


-- 4.

select count(*) from book;

select genre, count(*) from book Group by genre

--5.

select * from staff
where position1='Librarians' AND hire_date= '2022-09-10';