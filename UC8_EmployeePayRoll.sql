/*---------UC8-----------------*/
create table emp_department(
depart_id int primary key auto_increment,
department varchar(50) not null,
street varchar(50) not null,
city varchar(50) not null,
pincode int not null
);

desc emp_department;

insert into emp_department(department, street, city, pincode) values ('HR', 'Cheppaluppada', 'Visakhapatnam', 531163);
insert into emp_department(department, street, city, pincode) values ('IT', 'Pune', 'Palaknam', 500231);
insert into emp_department(department, street, city, pincode) values ('Technical', 'Chennai', 'Talpur', 500003);

select * from emp_department;
select * from employee_payroll;

alter table employee_payroll add department int;

alter table employee_payroll add foreign key(department) references emp_department(depart_id);
update employee_payroll set department = 1 where id = 1;
update employee_payroll set department = 2 where id = 2;
update employee_payroll set department = 3 where id > 4;
update employee_payroll set department = 1 where id = 3;
update employee_payroll set department = 2 where id = 4;

select * from emp_department where depart_id = (select department from employee_payroll where id = 3);
select * from emp_department where depart_id = (select department from employee_payroll where name = 'Ashok');