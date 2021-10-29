--1. Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

--2. Наполнить таблицу employee 70 строками.
insert into employees values (default, 'Jill');

-- 3. Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
create table salary (
	id serial primary key,
	monthly_salary int not null
);

-- 4 . Наполнить таблицу salary 15 строками:
insert into salary values (default, 2500);

-- 5. Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

-- 6. Наполнить таблицу salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary values (default, 69, 13);

-- 7. Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
create table roles (
	id serial primary key,
	role_name int not null unique
);

-- 8. Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name type varchar(30)

-- 9. Наполнить таблицу roles 20 строками:
insert into roles values (default, 'Senior Automation QA engineer');

--10. Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee (
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees (id),
	foreign key (role_id)
		references roles (id)
);

-- 11. Наполнить таблицу roles_employee 40 строками:
insert into roles_employee values (default, 40, 7);

select * from roles_employee;