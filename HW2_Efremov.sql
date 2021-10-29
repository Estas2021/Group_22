--1. ������� ������� employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

--2. ��������� ������� employee 70 ��������.
insert into employees values (default, 'Jill');

-- 3. ������� ������� salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
create table salary (
	id serial primary key,
	monthly_salary int not null
);

-- 4 . ��������� ������� salary 15 ��������:
insert into salary values (default, 2500);

-- 5. ������� ������� employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

-- 6. ��������� ������� salary 40 ��������:
-- � 10 ����� �� 40 �������� �������������� employee_id
insert into employee_salary values (default, 69, 13);

-- 7. ������� ������� roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
create table roles (
	id serial primary key,
	role_name int not null unique
);

-- 8. �������� ��� ������ role_name � int �� varchar(30)
alter table roles
alter column role_name type varchar(30)

-- 9. ��������� ������� roles 20 ��������:
insert into roles values (default, 'Senior Automation QA engineer');

--10. ������� ������� employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (������� ���� ��� ������� employees, ���� id)
-- role_id. Int, not null (������� ���� ��� ������� roles, ���� id)
create table roles_employee (
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees (id),
	foreign key (role_id)
		references roles (id)
);

-- 11. ��������� ������� roles_employee 40 ��������:
insert into roles_employee values (default, 40, 7);

select * from roles_employee;