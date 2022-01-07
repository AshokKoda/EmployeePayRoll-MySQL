/*----UC1--------*/
show databases;
create database emp_payroll_service;
use emp_payroll_service;

/*-------UC2-------*/
create table employee_payroll(
	id int not null auto_increment,
    name varchar(50) not null,
    salary Double not null,
    startDate Date not null,
    primary key(id)
);

desc employee_payroll;

/*--------UC3----------*/
insert into employee_payroll(name, salary, startDate) values('Ashok', 20000.0, '2021-01-01');
insert into employee_payroll(name, salary, startDate) values('John', 30000.0, '2021-01-02');
insert into employee_payroll(name, salary, startDate) values('Pooja', 250000.0, '2022-01-01');
insert into employee_payroll(name, salary, startDate) values('Kumari', 20000.0, '2022-01-04');

/*--------UC4----------*/
select * from employee_payroll;

/*--------UC5----------*/
select * from employee_payroll where id = 2;
select * from employee_payroll where name = 'Ashok';
select * from employee_payroll where startDate between '2022-01-01' and Date(now());

/*--------UC6----------*/
alter table employee_payroll add gender char(1) after name;
insert into employee_payroll(name, gender, salary, startDate) values('Lasya', 'F', 20000.0, '2022-01-04');
select * from employee_payroll;

update employee_payroll set gender = 'M' where id = 1;
update employee_payroll set gender = 'M' where id = 2;
update employee_payroll set gender = 'F' where id > 2;

/*--------UC7----------*/
select gender, sum(salary) from employee_payroll where gender = 'M' group by gender;
select gender, sum(salary) from employee_payroll where gender = 'F' group by gender;

select avg(salary) from employee_payroll;

select min(salary) as lowSalary from employee_payroll;
select max(salary) as highSalary from employee_payroll;

select count(gender) from employee_payroll where gender = 'M' group by gender;
select count(gender) from employee_payroll where gender = 'F' group by gender;

/*--------UC8----------*/
select * from employee_payroll;

alter table employee_payroll
add phoneno varchar(15),
add department varchar(50) not null after salary;

alter table employee_payroll
add address varchar(250) default 'Address' after phoneno;

/*--------UC9----------*/
select * from employee_payroll;
alter table employee_payroll rename column salary to basic_pay;

alter table employee_payroll
add deduction int,
add taxable_pay int,
add income_tax int,
add net_pay int;

/*--------UC10----------*/
insert into employee_payroll(name, basic_pay, startDate, department) values('Terrisa', 20000.0, '2021-01-01','Sales');

insert into employee_payroll(name, basic_pay, startDate, gender, phoneno, department, deduction, taxable_pay, income_tax, net_pay) 
values('Terrisa', 20000.0, '2021-01-01', 'M', '1234567890', 'Marketing', 2000, 1500, 1800, 15000);

/*--------UC11----------*/
create table employee(
	id int not null auto_increment primary key,
    name varchar(50) not null,
    gender varchar(1),
    phoneno varchar(30),
    address varchar(250),
    startDate Date not null
);

create table payroll(
	id int not null auto_increment primary key,
    basic_pay int,
    deduction int,
    income_tax int,
    taxable_pay int,
    net_pay int,
    emp_id int,
    foreign key(emp_id) references employee(id)
);

create table department(
	id int not null auto_increment primary key,
    dept_name varchar(50) not null
);

create table employee_department(
	employee_id int not null,
    department_id int not null,
    foreign key(employee_id) references employee(id),
    foreign key(department_id) references department(id),
    primary key(employee_id, department_id)
);

select * from employee;
select * from payroll;
select * from department;
select * from employee_department;

/*--------UC12----------*/
select * from employee_payroll;
select * from employee_payroll where name = 'Ashok';
select * from employee_payroll where startDate between '2022-01-01' and Date(now());

select gender, sum(basic_pay) from employee_payroll where gender = 'M' group by gender;
select gender, sum(basic_pay) from employee_payroll where gender = 'F' group by gender;

select avg(basic_pay) from employee_payroll;

select min(basic_pay) as lowSalary from employee_payroll;
select max(basic_pay) as highSalary from employee_payroll;

select count(gender) from employee_payroll where gender = 'M' group by gender;
select count(gender) from employee_payroll where gender = 'F' group by gender;