create database gym_data;

use gym_data;

create table country (country_id int(9),
						country_name varchar(25),
                        primary key(country_id));
insert into country values (1,"Portugal");
insert into country values (2,"Spain");

create table city (city_id int(9),
					city_name varchar(25),
                    country_id int(9),
                    primary key (city_id),
                    foreign key (country_id) references country (country_id));
insert into city values (1,"Lisbon",1);
insert into city values (2,"Oporto",1);
insert into city values (3,"Coimbra",1);

create table class (class_id int(9),
					class_type varchar(25),
                    class_duration int(9),
                    class_condition varchar(25),
                    primary key (class_id));
insert into class values (1,"Abs",15,"Medium");
insert into class values (2,"HIIT",20,"Advanced");
insert into class values (3,"Full Body Training",25,"Advanced");

create table gym (gym_id int(9),
					gym_name varchar(50),
                    city_id int(9),
                    gym_email varchar(50),
                    gym_contact varchar(50),
                    primary key(gym_id),
                    foreign key (city_id) references city(city_id));
insert into gym values (1,"Swift-Elbert",2,"rdegoey0@homestead.com","+7-693-421-8235");
insert into gym values (2,"Langworth,Hettinger and Cremin",3,"mbackhurst1@samsung.com","+86-125-522-0218");
insert into gym values (3,"Jacobson-Orn",1,"mmoody2@java.com","+86-282-845-4221");

create table employee ( employee_id int(9),
						employee_firstname varchar(30),
                        employee_lastname varchar(30),
                        employee_birthday date,
                        employee_office int(9),
                        employee_gender varchar(25),
                        employee_phone varchar(50),
                        employee_email varchar(50),
                        gym_id int(9),
                        Primary key (employee_id),
                        foreign key (gym_id) references gym (gym_id));
insert into employee values (1,"Euphemia","Tilby","1976-03-20",2,"Female","+7 (632) 322-3654","EuphemiaTilby@gmail.com",1);
insert into employee values (2,"Grata","Father","1974-08-26",1,"Female","+62 (827) 331-5745","GrataFather@gmail,com",2);
insert into employee values (3,"Edmund","Edlyne","2002-05-20",2,"Male","+420 (850) 753-3263","EdmundEdlyne@gmail.com",3);

#Note: To make the code possible to run, we had to put the same gym_id of these employees as the ones on the gym table

create table publicity (publicity_id int(9),
						publicity_type varchar(50),
                        primary key (publicity_id));
insert into publicity values (1,"Instagram");
insert into publicity values (2,"Facebook");
insert into publicity values (3,"Linkdin");

create table client (client_id int(9),
						client_firstname varchar(25),
                        client_lastname varchar(25),
                        client_birthday date,
                        client_gender varchar(25),
                        client_accession date,
                        client_phone varchar(25),
                        client_email varchar (50),
                        gym_id int(9),
                        publicity_id int(9),
                        primary key(client_id),
                        foreign key (gym_id) references gym (gym_id),
                        foreign key (publicity_id) references publicity (publicity_id));
insert into client values (1,"Chas","Fernier","2022-11-01","Polygender","2021-05-12","+51 (569) 886-5784","ChasFernier@gmail.com",1,1);
insert into client values (2,"Zorina","Weekly","2004-11-18","Female","2020-03-18","+54 (112) 797-2131","ZorinaWeekly@gmail.com",2,1);
insert into client values (3,"Averil","Hammelberg","1985-04-29","Male","2022-09-23","+55 (347) 584-0885","AverilHammelberg@gmail.com",3,2);

#Note: To make the code possible to run, we had to put the same publicity_id and gym_id (foreign keys) of these clients as the ones on the publicity and gym table

create table class_client (class_id int(9),
							client_id int(9),
                            class_client_date date,
                            class_client_time time,
                            employee_id int(9),
                            primary key (class_id,client_id,class_client_date,class_client_time),
                            foreign key (employee_id) references employee (employee_id),
                            foreign key (class_id) references class (class_id),
							foreign key (client_id) references client (client_id));
insert into class_client values (2,1,"2022-02-19","9:40",1);
insert into class_client values (3,2,"2021-09-28","17:52",2);
insert into class_client values (1,3,"2022-06-30","19:31",3);

#Note: To make the code possible to run, we switched the values of the foreign keys

create table equipment (equipment_id int(9),
						equipment_name varchar(25),
                        primary key (equipment_id));
insert into equipment values (1,"Treadmill Machine");
insert into equipment values (2,"Elliptic");
insert into equipment values (3,"Bicycle");

create table class_equipment (class_id int(9),
								equipment_id int(9),
                                date_ce date,
                                time_ce time,
                                primary key (class_id,equipment_id,date_ce,time_ce),
                                foreign key (class_id) references class(class_id),
                                foreign key (equipment_id) references equipment(equipment_id));
insert into class_equipment values (1,2,"2022-02-10","10:32");
insert into class_equipment values (2,1,"2021-01-13","14:17");
insert into class_equipment values (3,3,"2021-09-22","21:43");

#Note: To make the code possible to run, we switched the values of the foreign keys

create table training (training_id int(9),
						employee_id int(9),
                        client_id int(9),
                        training_date date,
                        primary key (training_id),
                        foreign key (employee_id) references employee (employee_id),
                        foreign key (client_id) references client (client_id));
insert into training values (1,2,3,"2022-12-29");
insert into training values (2,1,2,"2021-09-26");
insert into training values (3,3,1,"2022-11-10");

#Note: To make the code possible to run, we switched the values of the foreign keys


Create table equipment_training (equipment_id int(9),
								training_id int(9),
                                date_et date,
                                time_et time,
                                primary key(equipment_id,training_id,date_et, time_et),
                                foreign key (equipment_id) references equipment (equipment_id),
                                foreign key (training_id) references training (training_id));
insert into equipment_training values (3,2,"2022-01-05","15:58");
insert into equipment_training values (2,1,"2021-05-16","16:02");
insert into equipment_training values (1,3,"2022-08-06","11:16");

#Note: To make the code possible to run, we switched the values of the foreign keys

create table gym_equipment (gym_id int(9),
							equipment_id int(9),
                            primary key (gym_id,equipment_id),
                            foreign key (gym_id) references gym (gym_id),
                            foreign key (equipment_id) references equipment (equipment_id));
insert into gym_equipment values (1,2);
insert into gym_equipment values (2,3);
insert into gym_equipment values (3,1);

#Note: To make the code possible to run, we switched the values of the foreign keys

create table payment (payment_id int(9),
						client_id int(9),
                        payment_amount int(9),
                        payment_date date,
                        primary key(payment_id),
                        foreign key (client_id) references client (client_id));
insert into payment values (1,2,53,"2022-02-20");
insert into payment values (2,3,16,"2022-11-07");
insert into payment values (3,1,45,"2022-05-27");

#Note: To make the code possible to run, we switched the values of the foreign keys

#QUERIES
#See all clients that joined our gyms since 2022
select * 
from client 
where client_accession > '2022-01-01';

#Finding the most popular gym
select class_type, count(*) as total_clients
from class
join class_client on class.class_id = class_client.class_id
group by class_type
order by total_clients desc
limit 1;

#Table of employees and their gyms
select employee_firstname, employee_lastname, gym_name
from employee
join gym on employee.gym_id = gym.gym_id;

#Calculating the total revenue by gym
select gym_name, sum(payment_amount) as total_revenue
from payment
join client on payment.client_id = client.client_id
join gym on client.gym_id = gym.gym_id
group by gym_name;

#Number of clients per city
select city_name, count(*) as total_clients
from client
join gym on client.gym_id = gym.gym_id
join city on gym.city_id = city.city_id
group by city_name;

#Average duration of classes per gym
select gym.gym_name, avg(class.class_duration) as average_duration
from class
join gym on class.class_id = gym.gym_id
group by gym.gym_name;

#Number of clients per employee
select e.employee_id, e.employee_firstname, e.employee_lastname, COUNT(*) AS total_clients
from employee e
join class_client cc on e.employee_id = cc.employee_id
group by e.employee_id, e.employee_firstname, e.employee_lastname;

#Client who made the highest payment
select client_firstname, client_lastname
from client
join payment on client.client_id = payment.client_id
where payment_amount = (select max(payment_amount) from payment);

#Average age of clients in each gym
select gym.gym_name, avg(DATEDIFF(CURRENT_DATE, client.client_birthday) / 365) as average_age
from client
join gym on client.gym_id = gym.gym_id
group by gym.gym_name;

#Total number of equipment in each gym
select gym.gym_name, count(*) as total_equipment
from gym
join gym_equipment on gym.gym_id = gym_equipment.gym_id
group by gym.gym_name;

#Number of employees per gym
select gym.gym_name, count(*) as total_employees
from gym
join employee on gym.gym_id = employee.gym_id
group by gym.gym_name;

#Total number of classes attended by each client
select client.client_id, client.client_firstname, client.client_lastname, count(*) as total_classes
from client
join class_client on client.client_id = class_client.client_id
group by client.client_id, client.client_firstname, client.client_lastname;




