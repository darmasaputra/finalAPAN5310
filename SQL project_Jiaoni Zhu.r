# Import necessary packages to conenct to SQL server
install.packages('RPostgreSQL')

# Load the PostgreSQL driver
require('RPostgreSQL')

# Create a connection
drv <- dbDriver('PostgreSQL')
con <- dbConnect(drv, dbname = 'Test7',
                 host = 'su19server.apan5310.com', port = 50104,
                 user = 'postgres', password = 'gitp8tdn')

# Join two major table to build a main dataframe for analysis
respondents_inf <- "select ri.respondent_id, open_source,student_status,employment_status,
formal_education,undergrad_major, company_size, years_coding, 
years_coding_prof, job_satisfaction, career_satisfaction, hope_five_years,
job_search_status, last_new_job, converted_salary, education_parents,age, 
dependents, military_us, operating_system, number_monitors,adblocker,
adblocker_disable,ads_valuable,ads_enjoy,ads_dislike,
wake_time,hours_computer,hours_outside, skip_meals, exercise
from respondents_info ri
join respondents_behaviours_attitudes att on att.respondent_id=ri.respondent_id"

respondents_info_df <- dbGetQuery(con,respondents_inf)

# Overview of the result
table(respondents_info_df$job_search_status)

# Filter those who are interested in new job opportunities
activelylooking_df <- respondents_info_df[respondents_info_df$job_search_status != 'I am not interested in new job opportunities',]

# Overview of the new dataframe
head(activelylooking_df)
table(activelylooking_df$job_satisfaction)
table(activelylooking_df$age)
table(activelylooking_df$hope_five_years)
table(activelylooking_df$years_coding)
table(activelylooking_df$company_size)
table(activelylooking_df$adblocker)
table(activelylooking_df$hours_computer)

# Customer profiling for visualizaiton prep
# formal education
stmt_fm_edu <- "select formal_education, count(formal_education)
from respondents_info ri
where ri.job_search_status != 'I am not interested in new job opportunities'
group by formal_education
order by count (formal_education) desc"

#age group
stmt_age <- "select age, count(age)
from respondents_info ri
where ri.job_search_status != 'I am not interested in new job opportunities' and age is not null
group by age
order by case when age = 'Under 18 years old' then '1' else age end asc"

#years of coding professional
stmt_yrscodingprof <- "select years_coding_prof, count(years_coding_prof)
from respondents_info ri
where ri.job_search_status != 'I am not interested in new job opportunities' and years_coding_prof is not null
group by years_coding_prof
order by case when years_coding_prof = '0-2 years' then '01'
when years_coding_prof = '3-5 years' then '02'
when years_coding_prof = '6-8 years' then '03'
when years_coding_prof = '9-11 years' then '04'
else years_coding_prof end asc"

#next five year goal
stmt_next5<- "select hope_five_years, count(hope_five_years)
from respondents_info ri
where ri.job_search_status != 'I am not interested in new job opportunities' and hope_five_years is not null
group by hope_five_years
order by count(hope_five_years) desc"

#next five year goal with salary
stmt_next5_w_salary <-  "select hope_five_years, avg(converted_salary)
from respondents_info ri
where ri.job_search_status != 'I am not interested in new job opportunities' and hope_five_years is not null
group by hope_five_years
order by avg(converted_salary) desc"

#job satisfaction
stmt_job_sat <- "select job_satisfaction, count(job_satisfaction)
from respondents_info ri
where ri.job_search_status != 'I am not interested in new job opportunities' and job_satisfaction is not null
group by job_satisfaction
order by count(job_satisfaction) desc"

# Create a new column that transform job_search_status into binary value
respondents_info_df$job_search_status2 <- ifelse (respondents_info_df$job_search_status != 'I am not interested in new job opportunities',1,0)
head(respondents_info_df)
table(respondents_info_df$job_search_status2)

# Create another new column that further transform job_search_status into categorical value
respondents_info_df$job_search_status3 <- ifelse (respondents_info_df$job_search_status2 == 1,"Yes","No")

# Model preparation - split the data
library(caTools)
set.seed(100)
split=sample.split(respondents_info_df$respondent_id,SplitRatio = 0.7)
table(split)
train1=respondents_info_df[split,]
test1=respondents_info_df[!split,]

# 1st model - Binomial logistic regrssion for records that are interested in new opportunities
model1=glm(job_search_status2~employment_status+company_size+years_coding_prof+job_satisfaction+last_new_job+age+dependents,data=train1,family='binomial')
summary(model1)
pred=predict(model1,newdata=test1,type='response')
ct=table(test1$job_search_status2,pred>0.5);ct
accuracy=sum(ct[1,1],ct[2,2])/nrow(test1);accuracy

# 2nd model - Binomial logistic regrssion for records that are interested in new opportunities
model2= glm(job_search_status2~employment_status+company_size+years_coding_prof+job_satisfaction+last_new_job+age+dependents+hope_five_years+dependents+adblocker+hours_computer,data=train1,family='binomial')
pred2=predict(model2,newdata=test1,type='response')
ct2=table(test1$job_search_status2,pred2>0.5);ct
accuracy=sum(ct2[1,1],ct2[2,2])/nrow(test1);accuracy
summary(model2)

# 3rd model - Binomial logistic regrssion for records that are interested in new opportunities
model3= glm(job_search_status2~employment_status+company_size+years_coding_prof+job_satisfaction+last_new_job+age+dependents+hope_five_years,data=train1,family='binomial')
pred3=predict(model3,newdata=test1,type='response')
ct3=table(test1$job_search_status2,pred3>0.5);ct
accuracy=sum(ct3[1,1],ct3[2,2])/nrow(test1);accuracy
summary(model3)

#clean up the respondent_info_df by removing NA value in converted salary
respondent_sal_df <- respondents_info_df[!is.na(respondents_info_df$converted_salary),]
nrow(respondent_sal_df)

# Model preparation - split the data
set.seed(1011)
split2=sample(1:nrow(respondent_sal_df),770)
train2=respondent_sal_df[split2,]
test2=respondent_sal_df[-split2,]

# Set up models for salary analysis
# 1st model - Multinomial linear regression model
salarymodel1=lm(converted_salary~employment_status+company_size+years_coding_prof+job_satisfaction+last_new_job+age+dependents+hope_five_years, train2)
summary(salarymodel1) # adjusted R-square is too low

#2nd model - tree model for salary analysis
library(rpart);library(rpart.plot)
sal_tree1=rpart(converted_salary~employment_status+company_size+years_coding_prof+job_satisfaction+last_new_job+age+dependents+hope_five_years, data=train2)
predtree1=predict(sal_tree1, newdata=test2)
rmse_sal_tree1=sqrt(mean((predtree1-test2$converted_salary)^2));rmse_sal_tree1
