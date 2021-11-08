--SQL HomeWork 3. Joins

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select e.employee_name, s.monthly_salary from employees e   
join employee_salary es on e.id = employee_id
join salary s on s.id = es.salary_id

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select e.employee_name, s.monthly_salary from employees e   
join employee_salary es on e.id = employee_id
join salary s on s.id = es.salary_id
where monthly_salary < 2000

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.) Da hack?!
select e.employee_name, s.monthly_salary from salary s
right join employee_salary es on s.id = es.salary_id 
left join employees e on e.id = es.employee_id
where es.employee_id not in(select employees.id from employees)

-- 4. Вывести все зарплатные позиции меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.) Da hack?!
select e.employee_name, s.monthly_salary from salary s
right join employee_salary es on s.id = es.salary_id 
left join employees e on e.id = es.employee_id
where es.employee_id not in(select employees.id from employees) and s.monthly_salary < 2000
    
-- 5. Найти всех работников кому не начислена ЗП. не срабатывает почему-то
select e.employee_name, s.monthly_salary from salary s
join employee_salary es on s.id = es.salary_id 
full join employees e on e.id = es.employee_id 
where e.id is null 
 
--  6. Вывести всех работников с названиями их должности.
select e.employee_name, r.role_name from roles_employee re   
join employees e on e.id = re.employee_id
join roles r on r.id = re.role_id

--  7. Вывести имена и должность только Java разработчиков.
select e.employee_name, r.role_name from employees e  
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id 
where role_name like '%Java developer%'

-- 8. Вывести имена и должность только Python разработчиков.
select e.employee_name, r.role_name from employees e  
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id 
where role_name like '%Python developer%'

--  9. Вывести имена и должность всех QA инженеров.
select e.employee_name, r.role_name from employees e  
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id 
where role_name like '%QA%'

--  10. Вывести имена и должность ручных QA инженеров.
select e.employee_name, r.role_name from employees e  
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id 
where role_name like '%Manual QA%'

--  11. Вывести имена и должность автоматизаторов QA
select e.employee_name, r.role_name from employees e  
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id  
where role_name like '%Automation QA%'

--  12. Вывести имена и зарплаты Junior специалистов
select e.employee_name, r.role_name, s.monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '%Junior%'

select e.employee_name, r.role_name, s.monthly_salary from employees e 
full join roles_employee re on re.employee_id  = e.id 
full join roles r on r.id = re.role_id 
full join employee_salary es on es.employee_id  = e.id 
inner join salary s on re.role_id  = s.id 
where r.role_name like '%Junior%'

--13. Вывести имена и зарплаты Middle специалистов
select e.employee_name, r.role_name, s.monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%Middle%'

-- 14. Вывести имена и зарплаты Senior специалистов
select e.employee_name, r.role_name, s.monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%Senior%'

-- 15. Вывести зарплаты Java разработчиков
select r.role_name, s.monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
where role_name like '%Java developer%'

--  16. Вывести зарплаты Python разработчиков
select r.role_name, s.monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id  
where r.role_name like '%Python developer%'

--  17. Вывести имена и зарплаты Junior Python разработчиков
select e.employee_name, s.monthly_salary, r.role_name from salary s
join employees e on e.id = s.id 
join roles_employee re on re.employee_id = e.id 
join roles r on r.id = re.role_id 
where r.role_name like '%Junior Python developer%'

--18. Вывести имена и зарплаты Middle JS разработчиков
select e.employee_name, r.role_name, s.monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where r.role_name like '%Middle JavaScript developer%'

--19. Вывести имена и зарплаты Senior Java разработчиков
select e.employee_name, r.role_name, s.monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where r.role_name like '%Senior Java developer%'

--  20. Вывести зарплаты Junior QA инженеров
select r.role_name, s.monthly_salary from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%Junior Manual QA engineer%'

--  21. Вывести среднюю зарплату всех Junior специалистов
select r.role_name, avg(s.monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where r.role_name like '%Junior%'
group by s.monthly_salary, r.role_name 

select avg(s.monthly_salary) from employees e 
full join roles_employee re on e.id = re.employee_id  
full join roles r on r.id = re.employee_id 
full join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id
where r.role_name like '%Junior%'
 
--  22. Вывести сумму зарплат JS разработчиков
select r.role_name, sum(s.monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where r.role_name like '%JavaScript developer%'
group by s.monthly_salary, r.role_name 

--  23. Вывести минимальную ЗП QA инженеров
select r.role_name, min(s.monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where r.role_name like '%QA%'
group by s.monthly_salary, r.role_name 

--  24. Вывести максимальную ЗП QA инженеров
select r.role_name, max(s.monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where r.role_name like '%QA%'
group by s.monthly_salary, r.role_name 

--  25. Вывести количество QA инженеров
select count(e.employee_name) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%QA%'

--  26. Вывести количество Middle специалистов.
select count(e.employee_name) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%Middle%'

--  27. Вывести количество разработчиков
select count(e.employee_name) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles r on r.id = re.role_id 
where role_name like '%developer%'

--  28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(s.monthly_salary) from employees e 
full join roles_employee re on re.employee_id  = e.id 
full join roles r on r.id = re.role_id 
full join employee_salary es on es.employee_id  = e.id 
inner join salary s on re.role_id  = s.id 
where role_name like '%developer%'

select sum(s.monthly_salary) from salary s 
join employee_salary es on s.id = es.salary_id 
full join employees e on e.id = es.employee_id 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id
where role_name like '%developer%'

--  29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select e.employee_name, r.role_name, s.monthly_salary from employees e 
full join roles_employee re on re.employee_id  = e.id 
full join roles r on r.id = re.role_id 
full join employee_salary es on es.employee_id  = e.id 
inner join salary s on re.role_id  = s.id 
order by s.monthly_salary 

--  30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select e.employee_name, r.role_name, s.monthly_salary from employees e 
full join roles_employee re on re.employee_id  = e.id 
full join roles r on r.id = re.role_id 
full join employee_salary es on es.employee_id  = e.id 
inner join salary s on re.role_id  = s.id 
where s.monthly_salary between 1700 and 2300 order by s.monthly_salary 

--  31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select e.employee_name, r.role_name, s.monthly_salary from employees e 
full join roles_employee re on re.employee_id  = e.id 
full join roles r on r.id = re.role_id 
full join employee_salary es on es.employee_id  = e.id 
inner join salary s on re.role_id  = s.id 
where s.monthly_salary < 2300 order by s.monthly_salary

--  32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary from employees e 
full join roles_employee re on re.employee_id  = e.id 
full join roles r on r.id = re.role_id 
full join employee_salary es on es.employee_id  = e.id 
inner join salary s on re.role_id  = s.id 
where s.monthly_salary in (1100, 1500, 2000) order by s.monthly_salary