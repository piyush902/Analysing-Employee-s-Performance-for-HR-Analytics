--Write an SQL query to solve the given problem statement.

--1)Find the average age of employees in each department and gender group. ( Round average  age up to two decimal places if needed)


select department,gender,round(avg(age),2) as 'Avarage_age' from employee group by department,gender

--2) List the top 3 departments with the highest average training scores. ( Round average scores up to two decimal places if needed)



select department,round(avg(avg_training_score),2) as 'avrageg_training_score' from employee group by department order by avg_training_score desc limit 3

--3)Find the percentage of employees who have won awards in each region. (Round percentages up to two decimal places if needed)


with t1 as(
    select count(*) as c1 ,region from employee where awards_won=1 group by region),
    t2 as (select count(*) as c2  from employee where awards_won=1)
    
select round(t1.c1/t2.c2*100,2) as 'percentage',t1.region from t1,t2

--4)Show the number of employees who have met more than 80% of KPIs for each recruitment channel and education level.

select count(*) as'emplyee',recruitment_channel,education from employee where KPIs_met_more_than_80=1
group by recruitment_channel,education

--5)Find the average length of service for employees in each department, considering only employees with previous year ratings greater than or equal to 4. ( Round average length up to two decimal places if needed)
select round(avg(length_of_service),2) as 'avrage_service',department from employee
where previous_year_rating>=4 group by department

--6)List the top 5 regions with the highest average previous year ratings. ( Round average ratings up to two decimal places if needed)
select round(avg(previous_year_rating),2) as 'avarage',region from employee group by region order by avarage desc limit 5

--7)List the departments with more than 100 employees having a length of service greater than 5 years.
select department,count(*) as'employee_no' from employee where length_of_service>5 group by department having employee_no>100

--8)Show the average length of service for employees who have attended more than 3 trainings, grouped by department and gender. ( Round average length up to two decimal places if needed)

select round(avg(length_of_service),2) as'avarage',department,gender from employee
where no_of_trainings>3 group by department,gender


---9)Find the percentage of female employees who have won awards, per department. Also show the number of female employees who won awards and total female employees. ( Round percentage up to two decimal places if needed)
select department,
round(count(case when awards_won=1 then employee_id end)*100/count(employee_id),2) as 'per_awarded_female',
count(case when awards_won=1 then employee_id end) as 'awarded_female',
count(employee_id) as 'total'

from employee
where gender='f'
group by department

--10) Calculate the percentage of employees per department who have a length of service between 5 and 10 years. ( Round percentage up to two decimal places if needed)
SELECT count(*),department from employee where length_of_service BETWEEN 5 and 10
GROUP by department

--11)Find the top 3 regions with the highest number of employees who have met more than 80% of their KPIs and received at least one award, grouped by department and region.
Find the top 3 regions with the highest number of employees who have met more than 80% of their KPIs and received at least one award, grouped by department and region.

--12)Calculate the average length of service for employees per education level and gender, considering only those employees who have completed more than 2 trainings and have an average training score greater than 75 ( Round average length up to two decimal places if needed)
select education,gender,round(avg(length_of_service),2) as 'avarage'  from employee
where no_of_trainings>2 and avg_training_score>75 group by education,gender

--13)For each department and recruitment channel, find the total number of employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, and have a length of service greater than 10 years.


select department,recruitment_channel,
count(*) as'total' from employee
where KPIs_met_more_than_80=1 and 
previous_year_rating=5 and 
length_of_service>10
group by department,recruitment_channel

--14)Calculate the percentage of employees in each department who have received awards, have a previous_year_rating of 4 or 5, and an average training score above 70, grouped by department and gender ( Round percentage up to two decimal places if needed).
select department,gender,round(count(case when awards_won=1 and previous_year_rating between
4 and 5 and avg_training_score>70 then employee_id end)*100 / count(employee_id),2) as'cnt'
from employee
group by department,gender

--15)List the top 5 recruitment channels with the highest average length of service for employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, and an age between 25 and 45 years, grouped by department and recruitment channel. ( Round average length up to two decimal places if needed).


select department,recruitment_channel,round(avg(length_of_service),2) as 'a'
from employee
where KPIs_met_more_than_80=1 and
previous_year_rating=5 and age between 25 and 45 group by department,recruitment_channel
order by a desc limit 5