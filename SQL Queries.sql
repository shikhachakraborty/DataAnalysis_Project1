#1. Get Max, Min & Average score of Math, Reading & Writing exam 

select gender, avg(MathScore) as Math_avg, max(MathScore) as Math_max, min(MathScore) as Math_min
from student_score
group by gender;

select gender, avg(ReadingScore) as Read_avg, max(ReadingScore) as Read_max, min(ReadingScore) as Read_min
from student_score
group by gender;

select gender, avg(WritingScore) Write_avg, max(WritingScore) as Write_max, min(WritingScore) as Write_min
from student_score
group by gender;


#2. Get Gender Count of Student

select distinct gender from student_score;

select gender, count(gender) as Count
from student_score
group by gender;


#3. Students average score based on Parents highest education

select avg(MathScore), avg(ReadingScore), avg(WritingScore)
from student_score
group by ParentEduc
having ParentEduc = "master's degree";

#4. Students average score Gender wise based on Weekly Study Hours, Test preparation and Sport 

select Gender, WklyStudyHours, TestPrep, PracticeSport, avg(MathScore), avg(ReadingScore), avg(WritingScore)
from student_score
group by WklyStudyHours, TestPrep, PracticeSport, gender
having WklyStudyHours = '> 10' and
TestPrep = "completed" and
PracticeSport = "regularly"
order by WklyStudyHours desc;


#5. Bifurcation by Ethnic Group

select distinct ethnicgroup
from student_score
order by ethnicgroup;

select gender, ethnicgroup, avg(MathScore), avg(ReadingScore), avg(WritingScore)
from student_score
group by gender, ethnicgroup
order by ethnicgroup, gender;


#6. Passing Students gender wise breakup:

select gender, count(gender)
from student_score
where (MathScore + ReadingScore + WritingScore) >= 180
group by gender;