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


--SQL HomeWork 3. Joins

-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select e.employee_name, s.monthly_salary from employees e   
join employee_salary es on e.id = employee_id
join salary s on s.id = es.salary_id;

-- 2. ������� ���� ���������� � ������� �� ������ 2000.
select e.employee_name, s.monthly_salary from employees e   
join employee_salary es on e.id = employee_id
join salary s on s.id = es.salary_id where monthly_salary < 2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select e.employee_name, s.monthly_salary from salary s
left join employee_salary es on s.id = es.salary_id 
left join employees e on e.id = es.employee_id

-- 4. ������� ��� ���������� ������� ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select e.employee_name, s.monthly_salary from salary s
left join employee_salary es on s.id = es.salary_id 
left join employees e on e.id = es.employee_id where monthly_salary < 2000

--  5. ����� ���� ���������� ���� �� ��������� ��.
select e.employee_name from employees e 
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id where es.employee_name = 'NULL'
 
--  6. ������� ���� ���������� � ���������� �� ���������.
select e.employee_name, r.role_name from roles_employee re   
join employees e on e.id = re.employee_id
join roles r on r.id = re.role_id;

--  7. ������� ����� � ��������� ������ Java �������������.
select e.employee_name, r.role_name from roles_employee re   
join employees e on e.id = re.employee_id
join roles r on r.id = re.role_id where role_name like '%Java%' and not role_name like '%JavaScript%'

-- 8. ������� ����� � ��������� ������ Python �������������.
select e.employee_name, r.role_name from roles_employee re   
join employees e on e.id = re.employee_id
join roles r on r.id = re.role_id where role_name like '%Python%'

--  9. ������� ����� � ��������� ���� QA ���������.
select e.employee_name, r.role_name from roles_employee re   
join employees e on e.id = re.employee_id
join roles r on r.id = re.role_id where role_name like '%QA%'

--  10. ������� ����� � ��������� ������ QA ���������.
select e.employee_name, r.role_name from roles_employee re   
join employees e on e.id = re.employee_id
join roles r on r.id = re.role_id where role_name like '%Manual QA%'

--  11. ������� ����� � ��������� ��������������� QA
select e.employee_name, r.role_name from roles_employee re   
join employees e on e.id = re.employee_id
join roles r on r.id = re.role_id where role_name like '%Automation QA%'

--  12. ������� ����� � �������� Junior ������������
select e.employee_name, s.monthly_salary from roles r 
join employees e on e.id = r.id
join salary s on s.id = r.id
where role_name like '%Junior%'

-- ��� ���������?? ����� � ������ ��� ������� ������ (������ �������). �� ���� 1 � ��� ��. ������ ��� Automation junior*
select e.employee_name, s.monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
join salary s on e.id = s.id where role_name like '%Junior%'

--13. ������� ����� � �������� Middle ������������
select e.employee_name, s.monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
join salary s on e.id = s.id
where role_name like '%Middle%'

-- 14. ������� ����� � �������� Senior ������������
select e.employee_name, s.monthly_salary from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
join salary s on e.id = s.id
where role_name like '%Senior%'

-- 15. ������� �������� Java �������������
--select s.monthly_salary from roles r 
--join employees e on e.id = r.id
--join salary s on s.id = r.id
--where role_name like '%Java developer%'

select s.monthly_salary from salary s
join roles r on s.id = r.id 
where role_name like '%Java developer%'

--  16. ������� �������� Python �������������
--select s.monthly_salary from roles r 
--join employees e on e.id = r.id
--join salary s on s.id = r.id
--where role_name like '%Python developer%'

select s.monthly_salary from salary s
join roles r on s.id = r.id 
where role_name like '%Python developer%'

--  17. ������� ����� � �������� Junior Python �������������
--select e.employee_name, s.monthly_salary from roles r 
--join employees e on e.id = r.id
--join salary s on s.id = r.id
--where role_name like '%Junior Python developer%'

select e.employee_name, s.monthly_salary from salary s
join employees e on e.id = s.id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%Junior Python developer%'

--18. ������� ����� � �������� Middle JS �������������
select e.employee_name, s.monthly_salary from salary s
join employees e on e.id = s.id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%Middle JavaScript developer%'

--19. ������� ����� � �������� Senior Java �������������
select e.employee_name, s.monthly_salary from salary s
join employees e on e.id = s.id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where role_name like '%Senior Java developer%'

--  20. ������� �������� Junior QA ���������
select s.monthly_salary from salary s  
join roles r on s.id = r.id
where role_name like '%Junior Manual QA engineer%'

--  21. ������� ������� �������� ���� Junior ������������
select avg(monthly_salary) from salary s
join roles r on s.id = r.id
where role_name like '%Junior%'

--  22. ������� ����� ������� JS �������������
select sum(monthly_salary) from salary s
join roles r on s.id = r.id
where role_name like '%JavaScript developer%'

--  23. ������� ����������� �� QA ���������
select min(monthly_salary) from salary s
join roles r on s.id = r.id
where role_name like '%QA%'

--  24. ������� ������������ �� QA ���������
select max(monthly_salary) from salary s
join roles r on s.id = r.id
where role_name like '%QA%'

--  25. ������� ���������� QA ���������
select count(role_name) from roles
where role_name like '%QA%'

--  26. ������� ���������� Middle ������������.
select count(role_name) from roles
where role_name like '%Middle%'

--  27. ������� ���������� �������������
select count(role_name) from roles
where role_name like '%developer%'

--  28. ������� ���� (�����) �������� �������������.
select sum(monthly_salary) from salary s
join roles r on r.id = s.id where role_name like '%developer%'

--  29. ������� �����, ��������� � �� ���� ������������ �� �����������
--select e.employee_name, r.role_name, s.monthly_salary from employees e 
--join roles_employee re on e.id = re.employee_id
--join roles r on re.role_id = r.id 
--join salary s on s.id = r.id 

select e.employee_name, r.role_name, s.monthly_salary from salary s
join employee_salary es on s.id = es.salary_id 
full join employees e on e.id = es.employee_id 
full join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
order by s.monthly_salary asc 

--  30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select e.employee_name, r.role_name, s.monthly_salary from salary s
join employee_salary es on s.id = es.salary_id 
full join employees e on e.id = es.employee_id 
full join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where s.monthly_salary between 1700 and 2300 order by s.monthly_salary asc 

--  31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select e.employee_name, r.role_name, s.monthly_salary from salary s
join employee_salary es on s.id = es.salary_id 
full join employees e on e.id = es.employee_id 
full join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where s.monthly_salary < 2300 order by s.monthly_salary asc

--  32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary from salary s
join employee_salary es on s.id = es.salary_id 
full join employees e on e.id = es.employee_id 
full join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where s.monthly_salary in (1100, 1500, 2000) order by s.monthly_salary asc