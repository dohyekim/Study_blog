select e.last_name 이름, e.salary 급여, d.department_name 부서이름
from Employees e inner join Departments d on e.department_id = d.department_id
where d.department_name = 'Marketing' 
      and e.salary < (select avg(salary) from Employees em where em.department_id = 80)
;
