-- Active: 1744270185185@@127.0.0.1@5432@company_db@public

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) ,
    age INT,
    email VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL(10,2),
    "status" VARCHAR(20)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

drop table departments;
drop table employees;

INSERT INTO
    employees (
        employee_name,
        age,
        email,
        department_id,
        salary,
        "status"
    )
VALUES (
        'Alice',
        30,
        'alice@example.com',
        1,
        60000,
        NULL
    ),
    (
        'Bob',
        35,
        'bob@example.net',
        2,
        65000,
        NULL
    ),
    (
        'Charlie',
        28,
        'charlie@google.com',
        1,
        55000,
        NULL
    ),
    (
        'David',
        33,
        'david@yahoo.com',
        2,
        62000,
        NULL
    ),
    (
        'Eve',
        31,
        'eve@example.net',
        3,
        58000,
        NULL
    ),
    (
        'Frank',
        29,
        'frank@example.com',
        1,
        59000,
        NULL
    ),
    (
        'Grace',
        34,
        'grace@google.com',
        2,
        63000,
        NULL
    ),
    (
        'Henry',
        32,
        'henry@yahoo.com',
        3,
        57000,
        NULL
    ),
    (
        'Ivy',
        27,
        'ivy@gmail.com',
        1,
        56000,
        NULL
    ),
    (
        'Jack',
        36,
        'jack@example.net',
        2,
        64000,
        NULL
    ),
    (
        'Karen',
        29,
        'karen@gmail.com',
        3,
        60000,
        NULL
    ),
    (
        'Liam',
        33,
        'liam@gmail.com',
        1,
        59000,
        NULL
    ),
    (
        'Mia',
        31,
        'mia@yahoo.com',
        2,
        62000,
        NULL
    ),
    (
        'Nora',
        28,
        'nora@yahoo.com',
        3,
        57000,
        NULL
    ),
    (
        'Oliver',
        35,
        'oliver@example.net',
        1,
        61000,
        NULL
    ),
    (
        'Penelope',
        30,
        'penelope@google.com',
        2,
        63000,
        NULL
    ),
    (
        'Quinn',
        32,
        'quinn@google.com',
        3,
        59000,
        NULL
    ),
    (
        'Rachel',
        27,
        'rachel@gmail.com',
        1,
        55000,
        NULL
    ),
    (
        'Sam',
        34,
        'sam@example.net',
        2,
        64000,
        NULL
    ),
    (
        'Taylor',
        31,
        'taylor@yahoo.com',
        3,
        58000,
        NULL
    );

INSERT INTO
    departments (department_name)
VALUES ('Engineering'),
    ('Marketing'),
    ('Finance');

-- query 1:

select * from employees where salary >60000;


-- query 2:

select employee_name from employees where employee_id>2 LIMIT 2;


-- query 3:
select round(avg(age),1) from employees ;


-- query 4:
select employee_name from employees where email ILIKE '%example.com%' OR email LIKE '%example.net%' OR email LIKE '%google.com%';


-- query 5:
SELECT * from employees join departments using(department_id) WHERE  department_name LIKE '%Engineering%';


-- Query 6:
UPDATE employees
SET status='Promoted'
WHERE salary=(SELECT max(salary) from employees);

SELECT *
from employees
WHERE
    salary = (
        SELECT max(salary)
        from employees
    );

-- Query 7:
SELECT department_name,avg(salary) from employees join departments using (department_id) GROUP BY department_name,department_id ORDER BY department_id;