create table Customers(
	customer_id serial primary key,
	first_name varchar(8),
	last_name varchar(8),
	date_of_birth date,
	gender varchar(8),
	contact_number bigint,
	email varchar(20),
	address varchar(30)
);

INSERT INTO Customers (first_name, last_name, date_of_birth, gender, contact_number, email, address)
VALUES
    ('Alice', 'Johnson', '1990-05-15', 'Female', 9876543210, 'ali.j@example.com', '123 Main Street, Anytown'),
    ('Bob', 'Smith', '1985-08-20', 'Male', 8765432109, 'smith@example.com', '456 Elm Avenue, Somewhereville');


create table Policies(
	policy_id serial primary key,
	policy_name varchar(10),
	policy_type varchar(14),
	coverage_details varchar(30),
	premium int,
	start_date date,
	end_date date
);

INSERT INTO Policies (policy_name, policy_type, coverage_details, premium, start_date, end_date)
VALUES
    ('Auto', 'Vehicle', 'coverage for accidents', 500, '2024-01-15', '2025-01-14'),
    ('Home', 'Property', 'Fire, flood', 800, '2023-07-01', '2024-06-30');


create table Claims(
	claim_id serial primary key,
	claim_date date,
	claim_amount double precision,
	approved_amount double precision,
	claim_status varchar(10),
	policy_id int,
	customer_id int,
	constraint fk_policy_id
	foreign key (policy_id)
	references Policies(policy_id),
	constraint fk_customer_id
	foreign key (customer_id)
	references Customers(customer_id)
);
INSERT INTO Claims (claim_date, claim_amount, approved_amount, claim_status)
VALUES
    ('2024-07-20', 1500.00, 1200.00, 'Pending'),
    ('2024-08-05', 2500.00, 2000.00, 'Approved');


create table Agents(
	agen_id serial primary key,
	first_name varchar(8),
	last_name varchar(8),
	contact_number bigint,
	email varchar(20),
	hire_date date
);
INSERT INTO Agents (first_name, last_name, contact_number, email, hire_date)
VALUES
    ('Olivia', 'Brown', 9876543210, 'olivia.b@example.com', '2023-03-15'),
    ('Ethan', 'Clark', 8765432109, 'ethan.c@example.com', '2022-09-10');


create table Policy_Assignments(
	assignment_id serial primary key,
	customer_id int,
	policy_id int,
	start_date date,
	end_date date,
	constraint fk_policy_id
	foreign key (policy_id)
	references Policies(policy_id),
	constraint fk_customer_id
	foreign key (customer_id)
	references Customers(customer_id)
);
INSERT INTO Policy_Assignments (start_date, end_date)
VALUES
    ('2024-01-15', '2025-01-14'),
    ('2023-07-01', '2024-06-30');


create table Test_Processing(
	processing_id serial primary key,
	claim_id int,
	processing_date date,
	payment_amount double precision,
	payment_date date,
	constraint fk_claim_id
	foreign key (claim_id)
	references Claims(claim_id)
);
INSERT INTO Claim_Processing ( processing_date, payment_amount, payment_date)
VALUES
    ( '2024-08-10', 1000.00, '2024-08-15'),
    ( '2024-08-12', 1800.00, '2024-08-18');

-- DDL queries

-- 1.

alter table Agents
add column agent_address varchar(20)

-- 2.
alter table Policies
rename column policy_name to policy_title

-- 3.

alter table Customers
drop column address

------ DML Queries

-- 1.

update Policies
set premium = 600
where policy_id=2

-- 2.

delete from Claims
where claim_id=1


-- 3.

INSERT INTO Policy_Assignments (start_date, end_date)
VALUES
    ('2024-04-15', '2025-07-14'),

------JOIN

-- 1.

select *
from customers as ca
join Policy_Assignments as pa
on pa.customer_id=ca.customer_id



-- 2.

select *
	from claims as c
join Policies as p
on c.policy_id=p.policy_id

-- 3.

select *
from claims as cl
join Customers as cu
on cl.customer_id=cu.customer_id


-- 4.

SELECT p.policy_type, SUM(c.claim_amount),count(c.claim_id) AS total_claim_amount
FROM Policies p
JOIN Claims c ON p.policy_id = c.policy_id
GROUP BY p.policy_type;