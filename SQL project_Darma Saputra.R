#install.packages('RPostgreSQL')
require('RPostgreSQL')
library(dplyr)
library(ggplot2)
library(tidyverse)
library(stringr)
library(scales)
library(tidytext)
library(igraph)
library(RColorBrewer)

drv <- dbDriver('PostgreSQL')
country_list <- read.csv('C:\Users\Darma\Downloads\SQL_Darma\Book.csv')
#Established Connection
con <- dbConnect(drv,dbname = "Test7", host = "su19server.apan5310.com", port = 50104, user = "postgres", password = "gitp8tdn")
dbListTables(con)

save(Book1,file = 'book1.Rdata')

#Load Data into R
respondents_info <- dbReadTable(con, "respondents_info")
respondents_info
languages <- dbReadTable(con, "languages")
languages
databases <- dbReadTable(con, "databases")
databases
languages_worked_with_respondents <- dbReadTable(con, "languages_worked_with_respondents")
languages_worked_with_respondents
summary(languages_worked_with_respondents)
databases_worked_with_respondents <- dbReadTable(con, "databases_worked_with_respondents")
databases_worked_with_respondents



## joining tables using dplyr
# respondents_info = left_join(respondents_info,languages_worked_with_respondents, by = 'respondent_id')
# 
# respondents_info = left_join(respondents_info,languages, by = c('language_id_worked_with'='language_id'))
# 
# respondents_info = left_join(respondents_info,databases_worked_with_respondents, by = 'respondent_id')
# 
# respondents_info = left_join(respondents_info,databases, by = c('database_id_worked_with'='database_id'))

respondents_info_upd = respondents_info %>% 
  left_join(languages_worked_with_respondents, by = 'respondent_id') %>% 
  left_join(languages, by = c('language_id_worked_with'='language_id')) %>% 
  left_join(databases_worked_with_respondents, by = 'respondent_id') %>% 
  left_join(databases, by = c('database_id_worked_with'='database_id')) %>% 
    select(-language_id_worked_with,-database_id_worked_with)


view(respondents_info_upd)

#Questions Needed to answer
#1. What is the most use database for each programming language? → How does the combination of language and database use the most

most_used_data = respondents_info_upd %>% 
  filter(database!='No answer') %>% 
  filter(language!='No answer') %>% 
  group_by(language, database) %>% 
  summarise(count_use = n()) %>% 
  group_by(language) %>% 
  mutate(count_use = ifelse(count_use==max(count_use),count_use,NA)) %>% 
  filter(!is.na(count_use)) 
  
print(most_used_data)
View(most_used_data)

#Most used language with another language (On Progress)

respondents_info_upd1 = respondents_info %>% 
  left_join(languages_worked_with_respondents, by = 'respondent_id') %>% 
  left_join(languages, by = c('language_id_worked_with'='language_id')) %>% 
  left_join(databases_worked_with_respondents, by = 'respondent_id') %>% 
  left_join(databases, by = c('database_id_worked_with'='database_id')) %>% 
  select(-database_id_worked_with)
view(respondents_info_upd1)

most_used_language = respondents_info_upd1 %>% 
  #filter(database!='No answer') %>% 
  filter(language!='No answer') %>% 
  group_by(language, respondent_id) %>% 
  summarise(count_use = n()) %>% 
  group_by(language) %>% 
  mutate(count_use = ifelse(count_use==max(count_use),count_use,NA)) %>% 
  filter(!is.na(count_use)) 

print(most_used_language)
View(most_used_language)

most_used_language_upd = most_used_language %>%
  left_join(languages, by = c('language_id_worked_with' = 'language_id'))
view(most_used_language_upd)
view(languages)

#2. What are the most Popular language based age and years of experiences? → How does technology adapted through different age group and years of experiences?

level_exp = c("0-2 years","3-5 years","6-8 years", "9-11 years",
"12-14 years", "15-17 years","18-20 years","21-23 years","24-26 years","27-29 years","30 or more years")

respondents_info_upd$years_coding = factor(respondents_info_upd$years_coding, levels = level_exp)

most_pop_lang = respondents_info_upd %>% 
    #filter(database!='No answer') %>% 
  filter(language!='No answer') %>% 
  filter(!is.na(years_coding)) %>% 
  group_by(years_coding,language) %>% 
  summarise(count = n()) %>% 
  group_by(years_coding) %>% 
  mutate(perc = count/sum(count), rank = rank(desc(count), ties.method = 'first')) %>% 
  filter(rank<=7)

ggplot(most_pop_lang, aes(x = years_coding, y = perc , fill = language, label = paste0(100*round(perc,3),'%'))) +
         geom_bar(stat='identity')+
  geom_text(size = 3, position = position_stack(vjust = 0.5))+
  theme(axis.text.x = element_text(angle = 90))+
  scale_fill_brewer(palette = 'Paired')

levels_age = c('Under 18 years old','18 - 24 years old',"25 - 34 years old",
               "35 - 44 years old" ,"45 - 54 years old","55 - 64 years old" )

respondents_info_upd$age = factor(respondents_info_upd$age, levels = levels_age)

most_pop_lang_age = respondents_info_upd %>% 
    #filter(database!='No answer') %>% 
  filter(language!='No answer') %>% 
  filter(!is.na(age)) %>% 
  group_by(age,language) %>% 
  summarise(count = n()) %>% 
  group_by(age) %>% 
  mutate(perc = count/sum(count), rank = rank(desc(count), ties.method = 'first')) %>% 
  filter(rank<=7)

ggplot(most_pop_lang_age, aes(x = age, y = perc , fill = language, label = paste0(100*round(perc,3),'%'))) +
         geom_bar(stat='identity')+
  geom_text(size = 3, position = position_stack(vjust = 0.5))+
  theme(axis.text.x = element_text(angle = 90))+
  scale_fill_brewer(palette = 'Paired')

#3  What are the most use Language, databases, and environment in different country?  → People in different country has different needs
load('Book1.Rdata')
#match(unique(respondents_info_upd$country),Book1$`alpha-2`)

top_20_country = respondents_info_upd %>% 
    filter(database!='No answer') %>% 
  filter(language!='No answer') %>% 
  group_by(country) %>% 
  count() %>% ungroup() %>% 
  mutate(rank = rank(desc(n), ties.method = 'first')) %>% 
  filter(rank<=20) %>% pull(country)


country_data =respondents_info_upd %>% 
  filter(country %in% top_20_country ) %>% 
  group_by(country,language) %>% 
  summarise(count = n()) %>% 
  group_by(country) %>% 
mutate(perc = count/sum(count), rank = rank(desc(count), ties.method = 'first')) %>%
  filter(rank<=7)

ggplot(country_data, aes(x = country, y = perc , fill = language, label = paste0(100*round(perc,3),'%'))) +
  geom_bar(stat='identity')+
  geom_text(size = 3, position = position_stack(vjust = 0.5))+
  theme(axis.text.x = element_text(angle = 90))+
  scale_fill_brewer(palette = 'Paired')

country_data2 =respondents_info_upd %>% 
  filter(country %in% top_20_country ) %>% 
  group_by(country,database) %>% 
  summarise(count = n()) %>% 
  group_by(country) %>% 
  mutate(perc = count/sum(count), rank = rank(desc(count), ties.method = 'first')) %>%
  filter(rank<=7)

ggplot(country_data2, aes(x = country, y = perc , fill = database, label = paste0(100*round(perc,3),'%'))) +
  geom_bar(stat='identity')+
  geom_text(size = 3, position = position_stack(vjust = 0.5))+
  theme(axis.text.x = element_text(angle = 90))+
  scale_fill_brewer(palette = 'Paired')



