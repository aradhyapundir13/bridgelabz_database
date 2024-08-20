create table Customers(customer_id serial primary key,first_name varchar(50),last_name varchar(50),email varchar(100),contact_number varchar(15),date_of_birth date,created_at timestamp default current_timestamp);
create table Agents(agent_id SERIAL PRIMARY KEY,first_name VARCHAR(50) NOT NULL,last_name VARCHAR(50)NOT NULL,email VARCHAR(100) NOT NULL UNIQUE,contact_number varchar(15),hire_date DATE,created_at timestamp DEFAULT CURRENT_TIMESTAMP);
create table Policies(policy_id SERIAL Primary key,policy_name varchar(100) NOT NULL,coverage_details TEXT,premium NUMERIC(10,2) NOT NULL,policy_type varchar(50),start_date DATE,end_date DATE,customer_id INT references customers(customer_id),agent_id int REFERENCES agents(agent_id),created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
create table Claims(claim_id serial Primary KEY,claim_date DATE NOT NULL,claim_amount NUMERIC(10,2)NOT NULL,status VARCHAR(50)DEFAULT 'Pending',policy_id int REFERENCES policies(policy_id),description TEXT,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
create table PolicyAssignments(assignment_id SERIAL PRIMARY KEY,customer_id int REFERENCES customers(customer_id),policy_id int REFERENCES policies(policy_id),start_date date,end_date DATE,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- INSERTING data into CUSTOMERS table
INSERT INTO Customers (first_name, last_name, email, contact_number,
date_of_birth) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '1985-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '1990-07-22'),
('Michael', 'Johnson', 'michael.johnson@example.com', '555-9876', '1983-02-14'),
('Emily', 'Davis', 'emily.davis@example.com', '555-4321', '1975-12-30'),
('David', 'Wilson', 'david.wilson@example.com', '555-6789', '1988-05-20'),
('Olivia', 'Brown', 'olivia.brown@example.com', '555-3456', '1995-09-15'),
('James', 'Jones', 'james.jones@example.com', '555-6543', '1982-11-25'),
('Sophia', 'Garcia', 'sophia.garcia@example.com', '555-8765', '1993-03-10'),
('Robert', 'Martinez', 'robert.martinez@example.com', '555-3456', '1979-06-14'),
('Isabella', 'Lopez', 'isabella.lopez@example.com', '555-6543', '1992-08-24');

-- INSERT INTO AGENTS
INSERT INTO Agents (first_name, last_name, email, contact_number, hire_date)
VALUES
('Alice', 'Green', 'alice.green@example.com', '555-1111', '2010-06-01'),
('Bob', 'White', 'bob.white@example.com', '555-2222', '2012-07-15'),
('Charlie', 'Black', 'charlie.black@example.com', '555-3333', '2014-09-10'),
('Diana', 'Red', 'diana.red@example.com', '555-4444', '2011-03-21'),
('Edward', 'Blue', 'edward.blue@example.com', '555-5555', '2013-11-05');

-- INSERT INTO POLICIES
INSERT INTO Policies (policy_name, coverage_details, premium, policy_type,
start_date, end_date, customer_id, agent_id) VALUES
('Health Protect', 'Comprehensive health coverage', 500.00, 'Health', '2024-01-01', '2025-01-01',
1, 1),
('Auto Secure', 'Car insurance with full coverage', 800.00, 'Auto', '2024-02-01', '2025-02-01', 2,
2),
('Home Shield', 'Home insurance against fire and theft', 1200.00, 'Home', '2024-03-01',
'2025-03-01', 3, 3),
('Life Guard', 'Life insurance with critical illness rider', 1500.00, 'Life', '2024-04-01', '2025-04-01',
4, 4),
('Travel Safe', 'Travel insurance with medical and baggage cover', 200.00, 'Travel', '2024-05-01',
'2025-05-01', 5, 5),
('Pet Protect', 'Insurance for pets against illness and injury', 300.00, 'Pet', '2024-06-01',
'2025-06-01', 6, 1),
('Health Shield', 'Basic health insurance coverage', 400.00, 'Health', '2024-07-01', '2025-07-01',
7, 2),
('Auto Protect', 'Car insurance with theft protection', 600.00, 'Auto', '2024-08-01', '2025-08-01', 8,
3),
('Home Secure', 'Home insurance with earthquake coverage', 1400.00, 'Home', '2024-09-01',
'2025-09-01', 9, 4),
('Life Secure', 'Life insurance with accidental death cover', 1300.00, 'Life', '2024-10-01',
'2025-10-01', 10, 5);

-- INSERT INTO CLAIMS
INSERT INTO Claims (claim_date, claim_amount, status, policy_id, description)
VALUES
('2024-07-15', 2500.00, 'Processed', 1, 'Medical expenses for surgery'),
('2024-08-05', 1500.00, 'Pending', 2, 'Car damage due to accident'),
('2024-09-10', 3500.00, 'Rejected', 3, 'Fire damage to home'),
('2024-10-20', 2000.00, 'Processed', 4, 'Critical illness treatment'),
('2024-11-25', 500.00, 'Pending', 5, 'Lost luggage during travel'),
('2024-12-12', 700.00, 'Processed', 6, 'Vet bills for pet injury'),
('2024-01-03', 400.00, 'Pending', 7, 'Outpatient treatment'),
('2024-02-15', 1000.00, 'Processed', 8, 'Car theft'),
('2024-03-22', 2500.00, 'Rejected', 9, 'Home repairs after earthquake'),
('2024-04-18', 1200.00, 'Pending', 10, 'Accidental death claim');

-- INSERT INTO POLICY ASSIGNMENTS
INSERT INTO PolicyAssignments (customer_id, policy_id, start_date, end_date)
VALUES
(1, 1, '2024-01-01', '2025-01-01'),
(2, 2, '2024-02-01', '2025-02-01'),
(3, 3, '2024-03-01', '2025-03-01'),
(4, 4, '2024-04-01', '2025-04-01'),
(5, 5, '2024-05-01', '2025-05-01'),
(6, 6, '2024-06-01', '2025-06-01'),
(7, 7, '2024-07-01', '2025-07-01'),
(8, 8, '2024-08-01', '2025-08-01'),
(9, 9, '2024-09-01', '2025-09-01'),
(10, 10, '2024-10-01', '2025-10-01');

-- PROBLEM 1
Delete from claims
where claim_date < current_date -interval '5 year';
-- Problem 2
create table Old_Agents(agent_id SERIAL PRIMARY KEY,first_name VARCHAR(50) NOT NULL,last_name VARCHAR(50)NOT NULL,email VARCHAR(100) NOT NULL UNIQUE,contact_number varchar(15),hire_date DATE,created_at timestamp DEFAULT CURRENT_TIMESTAMP);
Drop table Old_Agents;
select * from OLD_Agents;
-- Problem 3
select c.first_name,c.last_name,p.policy_id
from customers c
INNER JOIN policies p on c.customer_id = p.customer_id;

select c.first_name,p.policy_id
from customers c
left join policies p on c.customer_id = p.customer_id;

-- Problem 4
SELECT
    c.first_name,
    p.policy_name,
    a.first_name,
    cl.status
FROM
    customers c
    LEFT JOIN policies p ON c.customer_id = p.customer_id
    LEFT JOIN agents a ON p.agent_id = a.agent_id
    LEFT JOIN claims cl ON p.policy_id = cl.policy_id

-- Problem 5

-- Delete claims where status is closed
DELETE FROM Claims
WHERE status = 'Processed' AND claim_amount = 0;

DROP TABLE IF EXISTS Temp_Policies;

SELECT
    a.first_name,a.last_name,
    p.policy_name
FROM
    agents a
    LEFT JOIN policies p ON a.agent_id = p.policy_id;