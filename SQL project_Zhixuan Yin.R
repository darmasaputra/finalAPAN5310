  # Import necessary packages to conenct to SQL server:
  install.packages('RPostgreSQL')
  require('RPostgreSQL')
  
  # Load the PostgreSQL driver
  drv <- dbDriver('PostgreSQL')
  
  # Create a connection
  con <- dbConnect(drv, dbname = 'Test7',
                   host = 'su19server.apan5310.com', port = 50104,
                   user = 'postgres', password = 'gitp8tdn')
  
  # What languages do people work with most now?
  stmt_language_worked_with_count <- "
  select l.language, count(l.language) as language_counts
  from languages l
  join languages_worked_with_respondents lww on lww.language_id_worked_with = l.language_id
  where l.language != 'No answer'
  group by l.language
  order by count(l.language) desc;
  "
  
  language_worked_with_count <- dbGetQuery(con, stmt_language_worked_with_count)
  
  #bar chart
  library(ggplot2)
  ggplot(data=language_worked_with_count[1:10,],aes(x=reorder(language,-language_counts),y=language_counts))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  # What languages do people desire to work with next year?
  stmt_language_desire_next_year_count <- "
  select l.language, count(l.language) as language_counts
  from languages l
  join languages_desire_next_year_respondents ldny on ldny.language_id_desire_next_year = l.language_id
  where l.language != 'No answer'
  group by l.language
  order by count(l.language) desc;
  "
  
  language_desire_next_year_count <- dbGetQuery(con, stmt_language_desire_next_year_count)
  
  #bar chart
  ggplot(data=language_desire_next_year_count[1:10,],aes(x=reorder(language,-language_counts),y=language_counts))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  
  #Sample wordcloud visualization for language desire next year
  stmt_language_next_year <- "
  select *
  from Languages_Desire_Next_Year_Respondents ldny
  join languages l on l.language_id = ldny.language_id_desire_next_year;
  "
  
  language_next_year = dbGetQuery(con, stmt_language_next_year)
  
  library(tidytext)
  library(dplyr)
  library(wordcloud)
  wordcloudData = 
    language_next_year%>%
    group_by(respondent_id)%>%
    unnest_tokens(output=word,input=language)%>%
    anti_join(stop_words)%>%
    group_by(word)%>%
    summarize(freq = n())%>%
    arrange(desc(freq))%>%
    ungroup()%>%
    data.frame()
  
  library(wordcloud)
  set.seed(617)
  wordcloud(words = wordcloudData$word,wordcloudData$freq,scale=c(2,0.5),max.words = 100,colors=brewer.pal(9,"Spectral"))
  
  # Course Design for languages 
  #Which language class should we have? (most potential customers)
  
  stmt_language_worked_with_percent <-"
  select l.language, count(lww.language_id_worked_with) as language_worked_with_counts, count(lww.language_id_worked_with)*100.0/(select count(*) from languages_worked_with_respondents) as language_worked_with_percent 
  from languages l
  join languages_worked_with_respondents lww on lww.language_id_worked_with = l.language_id
  where l.language != 'No answer'
  group by l.language
  order by language_worked_with_percent desc;
  "
  
  language_worked_with_percent <- dbGetQuery(con, stmt_language_worked_with_percent)
  
  stmt_language_desire_next_year_percent <-"
  select l.language, count(ldny.language_id_desire_next_year) as language_desire_next_year_counts, count(ldny.language_id_desire_next_year)*100.0/(select count(*) from languages_desire_next_year_respondents) as language_desire_next_year_percent 
  from languages l
  join languages_desire_next_year_respondents ldny on ldny.language_id_desire_next_year = l.language_id
  where l.language != 'No answer'
  group by l.language
  order by language_desire_next_year_percent desc;
  "
  
  language_desire_next_year_percent <- dbGetQuery(con, stmt_language_desire_next_year_percent)
  
  #merge data frame
  language_course_need <- merge(language_worked_with_percent,language_desire_next_year_percent, by = "language")
  
  language_course_need$language_gap <-language_course_need$language_desire_next_year_percent- language_course_need$language_worked_with_percent
  
  #find out which languages people need most
  language_course_need <- language_course_need[order(-language_course_need$language_gap),]
  
  ggplot(data=language_course_need[1:10,],aes(x=reorder(language,-language_gap),y=language_gap))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  
  #course design - potential customer profile
  #create prodfile for people who want to use Go next year(potential customers)
  stmt_Go_user <-"
  select *
  from Languages_Desire_Next_Year_Respondents ldny
  join languages l on l.language_id = ldny.language_id_desire_next_year
  join Respondents_Info ri on ri.respondent_id = ldny.respondent_id
  join Respondents_Behaviours_Attitudes rba on rba.respondent_id = ldny.respondent_id
  join Developer_Types_Respondents dtr on dtr.respondent_id = ldny.respondent_id
  join Developer_Types dt on dt.developer_type_id = dtr.developer_type_id
  where l.language = 'Go';
  "
  
  Go_user = dbGetQuery(con, stmt_Go_user)
  
  #python course potential customer profile
  #age
  Go_age=as.data.frame(table(Go_user$age))
  ggplot(data=Go_age,aes(x=factor(Var1),y=Freq))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  #former education
  Go_former_education=as.data.frame(table(Go_user$formal_education))
  ggplot(data=Go_former_education[1:5,],aes(x=reorder(Var1, -Freq),y=Freq))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  #student status
  Go_student_status=as.data.frame(table(Go_user$student_status))
  ggplot(data=Go_student_status,aes(x=factor(Var1),y=Freq))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  #developer type
  Go_developer_type = as.data.frame(table(Go_user$developer_type))
  ggplot(data=Go_developer_type[1:5,],aes(x=reorder(Var1,-Freq),y=Freq))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  
  #create prodfile for people who want to use python next year(potential customers)
  stmt_python_user <-"
  select *
  from Languages_Desire_Next_Year_Respondents ldny
  join languages l on l.language_id = ldny.language_id_desire_next_year
  join Respondents_Info ri on ri.respondent_id = ldny.respondent_id
  join Respondents_Behaviours_Attitudes rba on rba.respondent_id = ldny.respondent_id
  join Developer_Types_Respondents dtr on dtr.respondent_id = ldny.respondent_id
  join Developer_Types dt on dt.developer_type_id = dtr.developer_type_id
  where l.language = 'Python';
  "
  
  python_user = dbGetQuery(con, stmt_python_user)
  
  #python course potential customer profile
  #age
  python_age=as.data.frame(table(python_user$age))
  ggplot(data=python_age,aes(x=factor(Var1),y=Freq))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  #former education
  python_former_education=as.data.frame(table(python_user$formal_education))
  ggplot(data=python_former_education[1:5,],aes(x=reorder(Var1, -Freq),y=Freq))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  #student status
  python_student_status=as.data.frame(table(python_user$student_status))
  ggplot(data=python_student_status,aes(x=factor(Var1),y=Freq))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  #developer type
  python_developer_type = as.data.frame(table(python_user$developer_type))
  ggplot(data=python_developer_type[1:5,],aes(x=reorder(Var1,-Freq),y=Freq))+
    geom_bar(stat = 'identity',fill = 'light blue')
  
  
  #predicting model for a new user
  #What course is he/she possibly interested in?
  stmt_data <-"
  select *
  from Languages_Desire_Next_Year_Respondents ldny
  join languages l on l.language_id = ldny.language_id_desire_next_year
  join Respondents_Info ri on ri.respondent_id = ldny.respondent_id
  join Respondents_Behaviours_Attitudes rba on rba.respondent_id = ldny.respondent_id
  join Developer_Types_Respondents dtr on dtr.respondent_id = ldny.respondent_id
  join Developer_Types dt on dt.developer_type_id = dtr.developer_type_id;
  "
  data = dbGetQuery(con, stmt_data)
  
  #create a new column, 1 for target group, 0 for non-target group. Default is 0.
  data['in_target_group']=0
  #Select all those that want to learn go.
  desired_users <- data[ data$language_id_desire_next_year==18,]
  res_id <- desired_users[,1]
  unique_res <- unique(res_id)
  print(unique_res)
  data$in_target_group[(data$respondent_id %in% unique_res)] <- 1
  data$in_target_group <- as.factor(data$in_target_group)
  
  data= na.omit(data)
  
  #split data
  library(caTools)
  set.seed(100)
  split = sample.split(data$respondent_id,SplitRatio = 0.7)
  train = data[split,]
  test = data[!split,]
  
  #set up model
  #multinomial logistic regrssion
  model1 <-multinom(language~student_status+age,train)
  model2 <- multinom(language ~ student_status+employment_status+company_size+years_coding+years_coding_prof+job_satisfaction+career_satisfaction +hope_five_years +job_search_status +converted_salary+age+operating_system+ads_valuable+ads_enjoy+ads_dislike+wake_time+hours_computer+hours_outside+skip_meals+exercise, data = train, maxit=5000 )
  #neural network
  model3 = nnet(language~open_source+student_status+employment_status+company_size+years_coding+years_coding_prof+job_satisfaction+career_satisfaction +hope_five_years +job_search_status +converted_salary +education_parents+age+operating_system+ads_valuable+ads_enjoy+ads_dislike+wake_time+hours_computer+hours_outside+skip_meals+exercise,data=train,size = 5)
  summary(model) 
  #binomial logistic regression
  model4 <- glm(in_target_group~open_source+student_status+employment_status+company_size+years_coding+years_coding_prof+job_satisfaction+career_satisfaction +hope_five_years +job_search_status +converted_salary +education_parents+age+operating_system+ads_valuable+ads_enjoy+ads_dislike+wake_time+hours_computer+hours_outside+skip_meals+exercise,data=data,family='binomial')
  summary(model1)
  model5 <- glm(in_target_group~.-adblocker-country-respondent_id,data=data,family='binomial')
  model <- glm(in_target_group~respondent_id+open_source+student_status+employment_status+company_size+years_coding+years_coding_prof+job_satisfaction+career_satisfaction +hope_five_years +job_search_status +converted_salary +developer_type+education_parents+age+operating_system+ads_valuable+ads_enjoy+ads_dislike+wake_time+hours_computer+hours_outside+skip_meals+exercise,data=train,family='binomial')

  #test model
  pred = predict(model2,test, type='response')
  table(as.numeric(pred>0.5))
  ct = table(test$in_target_group,pred>0.5);ct
  accuracy = sum(ct[1,1],ct[2,2])/nrow(train); accuracy
 