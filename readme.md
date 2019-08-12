

```python
import pandas as pd
from sqlalchemy import create_engine
```


```python
import pandas as pd
from sqlalchemy import create_engine
# Pass the connection string to a variable, conn_url
conn_url = 'postgresql://postgres:gitp8tdn@su19server.apan5310.com:50104/Test7'

# Create an engine that connects to PostgreSQL server
engine = create_engine(conn_url)

# Establish a connection
connection = engine.connect()
```


```python
# Pass the SQL statements that create all tables
stmt = """

CREATE TABLE Respondents_Info (
respondent_id VARCHAR (10),
open_source VARCHAR (5),
student_status VARCHAR (20),
country VARCHAR (100),
employment_status VARCHAR (100),
formal_education VARCHAR (100),
undergrad_major VARCHAR (100),
company_size VARCHAR (100),
years_coding VARCHAR (50),
years_coding_prof VARCHAR (50),
job_satisfaction VARCHAR (100),
career_satisfaction VARCHAR (100),
hope_five_years VARCHAR (100),
job_search_status VARCHAR (100),
last_new_job VARCHAR (50),
converted_salary NUMERIC (12,2),
education_parents VARCHAR (100),
age VARCHAR (50),
dependents VARCHAR (5),
military_us VARCHAR (5),
PRIMARY KEY (respondent_id)
);

CREATE TABLE Respondents_Behaviours_Attitudes(
respondent_id VARCHAR (10),
operating_system VARCHAR (100),
number_monitors VARCHAR (100),
check_in_code VARCHAR (100),
adblocker VARCHAR (100),
adblocker_disable VARCHAR (100),
ads_valuable VARCHAR (100),
ads_enjoy VARCHAR (100),
ads_dislike VARCHAR (100),
wake_time VARCHAR (100),
hours_computer VARCHAR (100),
hours_outside VARCHAR (100),
skip_meals VARCHAR (100),
exercise VARCHAR (100),
PRIMARY KEY (respondent_id),
FOREIGN KEY (respondent_id) REFERENCES Respondents_Info
);

CREATE TABLE Developer_Types(
	developer_type_id	VARCHAR(10),
	developer_type	VARCHAR(225),
	PRIMARY KEY (developer_type_id)
);

CREATE TABLE Developer_Types_Respondents(
	respondent_id	VARCHAR(10),
	developer_type_id	VARCHAR(10),
	PRIMARY KEY (respondent_id, developer_type_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (developer_type_id) REFERENCES Developer_Types
);

CREATE TABLE Education_Types(
	education_type_id	VARCHAR(10),
	education_type VARCHAR(225),
	PRIMARY KEY (education_type_id)
);

CREATE TABLE Education_Respondents(
	respondent_id		VARCHAR(10),
	education_type_id	VARCHAR(10),
	PRIMARY KEY (respondent_id, education_type_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (education_type_id) REFERENCES Education_Types
);


CREATE TABLE Self_Taught_Types(
	self_taught_type_id	VARCHAR(10),
	self_taught_type		VARCHAR(225),
	PRIMARY KEY (self_taught_type_id)
);

CREATE TABLE Self_Taught_Respondents(
	respondent_id		VARCHAR(10),
	self_taught_type_id	VARCHAR(10),
	PRIMARY KEY (respondent_id, self_taught_type_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (self_taught_type_id) REFERENCES Self_Taught_Types
);


CREATE TABLE Hackathon_Reasons(
	hackathon_reason_id	VARCHAR(10),
	hackathon_reason	VARCHAR(225),
	PRIMARY KEY (hackathon_reason_id)
);

CREATE TABLE Hackathon_Reasons_Respondents(
	respondent_id	VARCHAR(10),
	hackathon_reason_id	VARCHAR(10),
	PRIMARY KEY (respondent_id, hackathon_reason_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (hackathon_reason_id) REFERENCES Hackathon_Reasons
);



CREATE TABLE Languages(
	language_id	VARCHAR(10),
	language	VARCHAR(225),
	PRIMARY KEY (language_id)
);

CREATE TABLE Languages_Worked_With_Respondents(
	respondent_id			VARCHAR(10),
	language_id_worked_with	VARCHAR(10),
	PRIMARY KEY (respondent_id, language_id_worked_with),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (language_id_worked_with) REFERENCES Languages (language_id)
);

CREATE TABLE Languages_Desire_Next_Year_Respondents(
	respondent_id			VARCHAR(10),
	language_id_desire_next_year	VARCHAR(10),
	PRIMARY KEY (respondent_id, language_id_desire_next_year),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (language_id_desire_next_year) REFERENCES Languages (language_id)
);



CREATE TABLE Databases(
	database_id	VARCHAR(10),
	database	VARCHAR(225),
	PRIMARY KEY (database_id)
);

CREATE TABLE Databases_Worked_With_Respondents(
	respondent_id			VARCHAR(10),
	database_id_worked_with	VARCHAR(10),
	PRIMARY KEY (respondent_id, database_id_worked_with),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (database_id_worked_with) REFERENCES Databases (database_id)
);

CREATE TABLE Databases_Desire_Next_Year_Respondents(
	respondent_id			VARCHAR(10),
	database_id_desire_next_year	VARCHAR(10),
	PRIMARY KEY (respondent_id, database_id_desire_next_year),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (database_id_desire_next_year) REFERENCES Databases (database_id)
);


CREATE TABLE Platforms(
	platform_id	VARCHAR(10),
	platform	VARCHAR(225),
	PRIMARY KEY (platform_id)
);

CREATE TABLE Platforms_Worked_With_Respondents(
	respondent_id			VARCHAR(10),
	platform_id_worked_with	VARCHAR(10),
	PRIMARY KEY (respondent_id, platform_id_worked_with),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (platform_id_worked_with) REFERENCES Platforms (platform_id)
);

CREATE TABLE Platforms_Desire_Next_Year_Respondents(
	respondent_id			VARCHAR(10),
	platform_id_desire_next_year	VARCHAR(10),
	PRIMARY KEY (respondent_id, platform_id_desire_next_year),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (platform_id_desire_next_year) REFERENCES Platforms (platform_id)
);



CREATE TABLE Frameworks(
	framework_id	VARCHAR(10),
	framework	VARCHAR(225),
	PRIMARY KEY (framework_id)
);

CREATE TABLE Frameworks_Worked_With_Respondents(
	respondent_id			VARCHAR(10),
	framework_id_worked_with	VARCHAR(10),
	PRIMARY KEY (respondent_id, framework_id_worked_with),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (framework_id_worked_with) REFERENCES Frameworks (framework_id)
);

CREATE TABLE Frameworks_Desire_Next_Year_Respondents(
	respondent_id			VARCHAR(10),
	framework_id_desire_next_year	VARCHAR(10),
	PRIMARY KEY (respondent_id, framework_id_desire_next_year),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (framework_id_desire_next_year) REFERENCES Frameworks (framework_id)
);


CREATE TABLE IDE(
	ide_id	VARCHAR(10),
	ide	VARCHAR(225),
	PRIMARY KEY (ide_id)
);

CREATE TABLE IDE_Respondents (
	respondent_id	VARCHAR(10),
	ide_id		VARCHAR(10),
	PRIMARY KEY (respondent_id, ide_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (ide_id) REFERENCES IDE
);


CREATE TABLE Methodologies(
	methodology_id	VARCHAR(10),
	methodology		VARCHAR(225),
	PRIMARY KEY (methodology_id)
);

CREATE TABLE Methodologies_Respondents(
	respondent_id		VARCHAR(10),
	methodology_id	VARCHAR(10),
	PRIMARY KEY (respondent_id, methodology_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (methodology_id) REFERENCES Methodologies
);



CREATE TABLE Version_Control(
	version_control_id	VARCHAR(10),
	version_control		VARCHAR(225),
	PRIMARY KEY (version_control_id)
);

CREATE TABLE Version_Control_Respondents(
	respondent_id		VARCHAR(10),
	version_control_id	VARCHAR(10),
	PRIMARY KEY (respondent_id, version_control_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (version_control_id) REFERENCES Version_Control
);

CREATE TABLE Ads_Attributes(
ads_attribute_id VARCHAR (10),
	ads_attribute	 VARCHAR(225),
	PRIMARY KEY (ads_attribute_id)
);

CREATE TABLE Ads_Attributes_Rank_Respondents(
respondent_id VARCHAR (10),
	ads_attribute_id	 VARCHAR(10),
            rank INTEGER,
	PRIMARY KEY (respondent_id, ads_attribute_id),
             FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
             FOREIGN KEY (ads_attribute_id) REFERENCES Ads_Attributes
);


CREATE TABLE AdBlocker_Reasons(
	adblocker_reason_id	 VARCHAR(10),
	adblocker_reason	VARCHAR(225),
	PRIMARY KEY (adblocker_reason_id)
);

CREATE TABLE AdBlocker_Reasons_Respondents(
	respondent_id		VARCHAR(10),
	adblocker_reason_id VARCHAR(10),
	PRIMARY KEY (respondent_id, adblocker_reason_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (adblocker_reason_id) REFERENCES AdBlocker_Reasons
);



CREATE TABLE Ads_Actions(
	ads_action_id	VARCHAR(10),
	ads_action	VARCHAR(225),
	PRIMARY KEY (ads_action_id)
);

CREATE TABLE Ads_Actions_Respondents(
	respondent_id	VARCHAR(10),
	ads_action_id VARCHAR(10),
	PRIMARY KEY (respondent_id, ads_action_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (ads_action_id) REFERENCES Ads_Actions
);

CREATE TABLE Ergonomic_Devices(
	ergonomic_device_id	VARCHAR(10),
	ergonomic_device	VARCHAR(225),
	PRIMARY KEY (ergonomic_device_id)
);

CREATE TABLE Ergonomic_Devices_Respondents(
	respondent_id		VARCHAR(10),
	ergonomic_device_id	VARCHAR(10),
	PRIMARY KEY (respondent_id, ergonomic_device_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (ergonomic_device_id) REFERENCES Ergonomic_Devices
);


CREATE TABLE Genders(
	gender_id	VARCHAR(10),
	gender		VARCHAR(225),
	PRIMARY KEY (gender_id)
);

CREATE TABLE Genders_Respondents(
	respondent_id		VARCHAR(10),
	gender_id	VARCHAR(10),
	PRIMARY KEY (respondent_id, gender_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (gender_id) REFERENCES Genders
);



CREATE TABLE Sexual_Orientations(
	sexual_orientation_id		VARCHAR(10),
	sexual_orientation		VARCHAR(225),
	PRIMARY KEY (sexual_orientation_id)
);

CREATE TABLE Sexual_Orientations_Respondents(
	respondent_id		VARCHAR(10),
	sexual_orientation_id	VARCHAR(10),
	PRIMARY KEY (respondent_id, sexual_orientation_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (sexual_orientation_id) REFERENCES Sexual_Orientations
);


CREATE TABLE Race_Ethnicities(
	race_ethnicity_id		VARCHAR(10),
	race_ethnicity		VARCHAR(225),
	PRIMARY KEY (race_ethnicity_id)
);

CREATE TABLE Race_Ethnicities_Respondents(
	respondent_id		VARCHAR(10),
	race_ethnicity_id		VARCHAR(10),
	PRIMARY KEY (respondent_id, race_ethnicity_id),
	FOREIGN KEY (respondent_id) REFERENCES Respondents_Info,
	FOREIGN KEY (race_ethnicity_id) REFERENCES Race_Ethnicities
);

"""

# Execute the statement to create tables
connection.execute(stmt)
```


```python
#import data: 
%cd ~/Documents/大萱的宝贝/百度云同步盘/Academic/Master/CU/Summer 2019/SQL/stack-overflow-2018-developer-survey
df = pd.read_csv("Developer_Survey_Subset.csv", low_memory=False)
df
```

    /Users/cathy/Documents/大萱的宝贝/百度云同步盘/Academic/Master/CU/Summer 2019/SQL/stack-overflow-2018-developer-survey
    




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Respondent</th>
      <th>Hobby</th>
      <th>OpenSource</th>
      <th>Country</th>
      <th>Student</th>
      <th>Employment</th>
      <th>FormalEducation</th>
      <th>UndergradMajor</th>
      <th>CompanySize</th>
      <th>DevType</th>
      <th>...</th>
      <th>Exercise</th>
      <th>Gender</th>
      <th>SexualOrientation</th>
      <th>EducationParents</th>
      <th>RaceEthnicity</th>
      <th>Age</th>
      <th>Dependents</th>
      <th>MilitaryUS</th>
      <th>SurveyTooLong</th>
      <th>SurveyEasy</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>Full-stack developer</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>1</th>
      <td>3</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>Database administrator;DevOps specialist;Full-...</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Associate degree</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>Engineering manager;Full-stack developer</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>5</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>Full-stack developer</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>4</th>
      <td>7</td>
      <td>Yes</td>
      <td>No</td>
      <td>South Africa</td>
      <td>Yes, part-time</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>Data or business analyst;Desktop or enterprise...</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>5</th>
      <td>8</td>
      <td>Yes</td>
      <td>No</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10 to 19 employees</td>
      <td>Back-end developer;Database administrator;Fron...</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Secondary school (e.g. American high school, G...</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>6</th>
      <td>9</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>Back-end developer;Front-end developer;Full-st...</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>7</th>
      <td>10</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Nigeria</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10 to 19 employees</td>
      <td>Designer;Front-end developer;QA or test developer</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>Female</td>
      <td>NaN</td>
      <td>Primary/elementary school</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Somewhat difficult</td>
    </tr>
    <tr>
      <th>8</th>
      <td>11</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Fine arts or performing arts (ex. graphic desi...</td>
      <td>100 to 499 employees</td>
      <td>Back-end developer;C-suite executive (CEO, CTO...</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>9</th>
      <td>16</td>
      <td>No</td>
      <td>Yes</td>
      <td>India</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>500 to 999 employees</td>
      <td>Designer</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>10</th>
      <td>17</td>
      <td>Yes</td>
      <td>No</td>
      <td>Spain</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Information systems, information technology, o...</td>
      <td>1,000 to 4,999 employees</td>
      <td>Back-end developer;Database administrator;Mobi...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>11</th>
      <td>18</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>India</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Another engineering discipline (ex. civil, ele...</td>
      <td>100 to 499 employees</td>
      <td>Back-end developer;Front-end developer;Full-st...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>12</th>
      <td>19</td>
      <td>Yes</td>
      <td>No</td>
      <td>Croatia</td>
      <td>NaN</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>Back-end developer;Front-end developer</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>13</th>
      <td>20</td>
      <td>No</td>
      <td>No</td>
      <td>India</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Another engineering discipline (ex. civil, ele...</td>
      <td>20 to 99 employees</td>
      <td>Back-end developer;Full-stack developer</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>14</th>
      <td>21</td>
      <td>No</td>
      <td>No</td>
      <td>Netherlands</td>
      <td>Yes, full-time</td>
      <td>Employed full-time</td>
      <td>Secondary school (e.g. American high school, G...</td>
      <td>NaN</td>
      <td>20 to 99 employees</td>
      <td>Back-end developer;Front-end developer;Student</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>NaN</td>
      <td>Associate degree</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Neither easy nor difficult</td>
    </tr>
    <tr>
      <th>15</th>
      <td>22</td>
      <td>Yes</td>
      <td>No</td>
      <td>Israel</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Fine arts or performing arts (ex. graphic desi...</td>
      <td>5,000 to 9,999 employees</td>
      <td>Full-stack developer</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>16</th>
      <td>26</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>Yes, full-time</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>1,000 to 4,999 employees</td>
      <td>Student</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>17</th>
      <td>27</td>
      <td>Yes</td>
      <td>No</td>
      <td>Sweden</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>A business discipline (ex. accounting, finance...</td>
      <td>10 to 19 employees</td>
      <td>Back-end developer</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>Male</td>
      <td>NaN</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Somewhat difficult</td>
    </tr>
    <tr>
      <th>18</th>
      <td>29</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>India</td>
      <td>Yes, full-time</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>NaN</td>
      <td>10,000 or more employees</td>
      <td>Data or business analyst;Data scientist or mac...</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Female</td>
      <td>NaN</td>
      <td>Some college/university study without earning ...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Very difficult</td>
    </tr>
    <tr>
      <th>19</th>
      <td>31</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Chile</td>
      <td>Yes, full-time</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A business discipline (ex. accounting, finance...</td>
      <td>Fewer than 10 employees</td>
      <td>Back-end developer;Front-end developer;Full-st...</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>20</th>
      <td>33</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Australia</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Another engineering discipline (ex. civil, ele...</td>
      <td>1,000 to 4,999 employees</td>
      <td>Database administrator;Full-stack developer;Mo...</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>NaN</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Neither easy nor difficult</td>
    </tr>
    <tr>
      <th>21</th>
      <td>34</td>
      <td>Yes</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>NaN</td>
      <td>500 to 999 employees</td>
      <td>Back-end developer;Desktop or enterprise appli...</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>45 - 54 years old</td>
      <td>Yes</td>
      <td>No</td>
      <td>The survey was too long</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>22</th>
      <td>37</td>
      <td>No</td>
      <td>No</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>Back-end developer;Database administrator;Desi...</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Neither easy nor difficult</td>
    </tr>
    <tr>
      <th>23</th>
      <td>38</td>
      <td>Yes</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>NaN</td>
      <td>10 to 19 employees</td>
      <td>Back-end developer;Database administrator;DevO...</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>Female;Male;Transgender;Non-binary, genderquee...</td>
      <td>NaN</td>
      <td>They never completed any formal education</td>
      <td>White or of European descent</td>
      <td>45 - 54 years old</td>
      <td>Yes</td>
      <td>No</td>
      <td>The survey was too long</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>24</th>
      <td>39</td>
      <td>Yes</td>
      <td>No</td>
      <td>India</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>Mobile developer</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Female;Male</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>25</th>
      <td>41</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Greece</td>
      <td>Yes, full-time</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>20 to 99 employees</td>
      <td>Full-stack developer</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>26</th>
      <td>43</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Sweden</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>1,000 to 4,999 employees</td>
      <td>Front-end developer;Full-stack developer</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Secondary school (e.g. American high school, G...</td>
      <td>Hispanic or Latino/Latina;White or of European...</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>27</th>
      <td>44</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A social science (ex. anthropology, psychology...</td>
      <td>100 to 499 employees</td>
      <td>Back-end developer;Full-stack developer</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was too long</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>28</th>
      <td>45</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>Back-end developer;Data scientist or machine l...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>29</th>
      <td>46</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Information systems, information technology, o...</td>
      <td>Fewer than 10 employees</td>
      <td>Back-end developer;Front-end developer;Full-st...</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Black or of African descent;East Asian;Hispani...</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Neither easy nor difficult</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>1970</th>
      <td>2757</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>5,000 to 9,999 employees</td>
      <td>Full-stack developer</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>1971</th>
      <td>2758</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Fine arts or performing arts (ex. graphic desi...</td>
      <td>1,000 to 4,999 employees</td>
      <td>Designer;Front-end developer;Marketing or sale...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1972</th>
      <td>2760</td>
      <td>Yes</td>
      <td>No</td>
      <td>Czech Republic</td>
      <td>Yes, full-time</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>Student</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1973</th>
      <td>2761</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Romania</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>500 to 999 employees</td>
      <td>Back-end developer;Desktop or enterprise appli...</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>1974</th>
      <td>2762</td>
      <td>Yes</td>
      <td>No</td>
      <td>Austria</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>I never declared a major</td>
      <td>1,000 to 4,999 employees</td>
      <td>Back-end developer</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>1975</th>
      <td>2763</td>
      <td>Yes</td>
      <td>No</td>
      <td>Philippines</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Mathematics or statistics</td>
      <td>10,000 or more employees</td>
      <td>Data or business analyst;Data scientist or mac...</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>NaN</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>1976</th>
      <td>2765</td>
      <td>Yes</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>I never declared a major</td>
      <td>10 to 19 employees</td>
      <td>Database administrator;Desktop or enterprise a...</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Associate degree</td>
      <td>White or of European descent</td>
      <td>45 - 54 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>1977</th>
      <td>2766</td>
      <td>Yes</td>
      <td>No</td>
      <td>Peru</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A business discipline (ex. accounting, finance...</td>
      <td>100 to 499 employees</td>
      <td>Back-end developer;Front-end developer</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1978</th>
      <td>2767</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>India</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>Data scientist or machine learning specialist</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1979</th>
      <td>2768</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Germany</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Other doctoral degree (Ph.D, Ed.D., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>Back-end developer;Database administrator;Full...</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Primary/elementary school</td>
      <td>White or of European descent</td>
      <td>45 - 54 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Somewhat difficult</td>
    </tr>
    <tr>
      <th>1980</th>
      <td>2771</td>
      <td>Yes</td>
      <td>No</td>
      <td>India</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>Fewer than 10 employees</td>
      <td>Back-end developer;Front-end developer;Full-st...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1981</th>
      <td>2772</td>
      <td>Yes</td>
      <td>No</td>
      <td>India</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>Back-end developer</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>South Asian</td>
      <td>18 - 24 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>1982</th>
      <td>2773</td>
      <td>Yes</td>
      <td>No</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Mathematics or statistics</td>
      <td>10,000 or more employees</td>
      <td>Back-end developer</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1983</th>
      <td>2775</td>
      <td>Yes</td>
      <td>No</td>
      <td>Romania</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Information systems, information technology, o...</td>
      <td>10,000 or more employees</td>
      <td>Back-end developer</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Neither easy nor difficult</td>
    </tr>
    <tr>
      <th>1984</th>
      <td>2777</td>
      <td>Yes</td>
      <td>No</td>
      <td>Brazil</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Information systems, information technology, o...</td>
      <td>500 to 999 employees</td>
      <td>Back-end developer;Front-end developer;Full-st...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1985</th>
      <td>2778</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>India</td>
      <td>Yes, full-time</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>Back-end developer;Data or business analyst;De...</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1986</th>
      <td>2779</td>
      <td>Yes</td>
      <td>No</td>
      <td>United Kingdom</td>
      <td>Yes, full-time</td>
      <td>Employed full-time</td>
      <td>Primary/elementary school</td>
      <td>NaN</td>
      <td>10 to 19 employees</td>
      <td>Back-end developer;Database administrator;Fron...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1987</th>
      <td>2780</td>
      <td>Yes</td>
      <td>No</td>
      <td>India</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>500 to 999 employees</td>
      <td>Back-end developer;Full-stack developer</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>South Asian</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Somewhat difficult</td>
    </tr>
    <tr>
      <th>1988</th>
      <td>2781</td>
      <td>No</td>
      <td>No</td>
      <td>France</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>1,000 to 4,999 employees</td>
      <td>Back-end developer;Desktop or enterprise appli...</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1989</th>
      <td>2782</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Other doctoral degree (Ph.D, Ed.D., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>1,000 to 4,999 employees</td>
      <td>Data scientist or machine learning specialist</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was too long</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>1990</th>
      <td>2783</td>
      <td>Yes</td>
      <td>No</td>
      <td>Madagascar</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Information systems, information technology, o...</td>
      <td>100 to 499 employees</td>
      <td>Back-end developer;Embedded applications or de...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1991</th>
      <td>2784</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>Data scientist or machine learning specialist;...</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Professional degree (JD, MD, etc.)</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>1992</th>
      <td>2785</td>
      <td>Yes</td>
      <td>No</td>
      <td>India</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Another engineering discipline (ex. civil, ele...</td>
      <td>1,000 to 4,999 employees</td>
      <td>Back-end developer;Designer;Full-stack developer</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>NaN</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>1993</th>
      <td>2786</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>1,000 to 4,999 employees</td>
      <td>Back-end developer;Front-end developer;Full-st...</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Associate degree</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>1994</th>
      <td>2787</td>
      <td>Yes</td>
      <td>No</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>Back-end developer;Front-end developer;Full-st...</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>1995</th>
      <td>2790</td>
      <td>Yes</td>
      <td>No</td>
      <td>Japan</td>
      <td>Yes, full-time</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Another engineering discipline (ex. civil, ele...</td>
      <td>Fewer than 10 employees</td>
      <td>Data scientist or machine learning specialist;...</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>The survey was too long</td>
      <td>Neither easy nor difficult</td>
    </tr>
    <tr>
      <th>1996</th>
      <td>2792</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Belgium</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Web development or web design</td>
      <td>1,000 to 4,999 employees</td>
      <td>Back-end developer;Designer;Front-end develope...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1997</th>
      <td>2793</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Germany</td>
      <td>Yes, full-time</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>Back-end developer;Data scientist or machine l...</td>
      <td>...</td>
      <td>1 - 2 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Associate degree</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>1998</th>
      <td>2794</td>
      <td>Yes</td>
      <td>No</td>
      <td>Sri Lanka</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Information systems, information technology, o...</td>
      <td>100 to 499 employees</td>
      <td>Back-end developer;Front-end developer;Mobile ...</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1999</th>
      <td>2795</td>
      <td>Yes</td>
      <td>No</td>
      <td>Switzerland</td>
      <td>Yes, full-time</td>
      <td>Employed full-time</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>DevOps specialist</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Master's degree (MA, MS, M.Eng., MBA, etc.)</td>
      <td>White or of European descent</td>
      <td>25 - 34 years old</td>
      <td>No</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Neither easy nor difficult</td>
    </tr>
  </tbody>
</table>
<p>2000 rows × 129 columns</p>
</div>




```python
df.insert(0, 'respondent_id', range(1, 1 + len(df)))
del df['Respondent']
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>Hobby</th>
      <th>OpenSource</th>
      <th>Country</th>
      <th>Student</th>
      <th>Employment</th>
      <th>FormalEducation</th>
      <th>UndergradMajor</th>
      <th>CompanySize</th>
      <th>DevType</th>
      <th>...</th>
      <th>Exercise</th>
      <th>Gender</th>
      <th>SexualOrientation</th>
      <th>EducationParents</th>
      <th>RaceEthnicity</th>
      <th>Age</th>
      <th>Dependents</th>
      <th>MilitaryUS</th>
      <th>SurveyTooLong</th>
      <th>SurveyEasy</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>Full-stack developer</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>Database administrator;DevOps specialist;Full-...</td>
      <td>...</td>
      <td>Daily or almost every day</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Associate degree</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>Engineering manager;Full-stack developer</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>Full-stack developer</td>
      <td>...</td>
      <td>I don't typically exercise</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Yes</td>
      <td>No</td>
      <td>South Africa</td>
      <td>Yes, part-time</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>Data or business analyst;Desktop or enterprise...</td>
      <td>...</td>
      <td>3 - 4 times per week</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 129 columns</p>
</div>




```python
##################### 1. "Respondents_Info" Table ###################################
```


```python
# create a "Respondents_Info" table
Respondents_Info=df[['respondent_id','OpenSource','Student','Country','Employment','FormalEducation','UndergradMajor','CompanySize',
                'YearsCoding','YearsCodingProf','JobSatisfaction','CareerSatisfaction','HopeFiveYears',
                'JobSearchStatus','LastNewJob','ConvertedSalary','EducationParents','Age','Dependents','MilitaryUS']]

# rename columns
Respondents_Info.columns = ['respondent_id','open_source','student_status','country','employment_status','formal_education','undergrad_major','company_size',
                'years_coding','years_coding_prof','job_satisfaction','career_satisfaction','hope_five_years',
                'job_search_status','last_new_job','converted_salary','education_parents','age','dependents','military_us']
Respondents_Info.head()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>open_source</th>
      <th>student_status</th>
      <th>country</th>
      <th>employment_status</th>
      <th>formal_education</th>
      <th>undergrad_major</th>
      <th>company_size</th>
      <th>years_coding</th>
      <th>years_coding_prof</th>
      <th>job_satisfaction</th>
      <th>career_satisfaction</th>
      <th>hope_five_years</th>
      <th>job_search_status</th>
      <th>last_new_job</th>
      <th>converted_salary</th>
      <th>education_parents</th>
      <th>age</th>
      <th>dependents</th>
      <th>military_us</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>No</td>
      <td>No</td>
      <td>Kenya</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>3-5 years</td>
      <td>Extremely satisfied</td>
      <td>Extremely satisfied</td>
      <td>Working as a founder or co-founder of my own c...</td>
      <td>I'm not actively looking, but I am open to new...</td>
      <td>Less than a year ago</td>
      <td>NaN</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>No</td>
      <td>United Kingdom</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>18-20 years</td>
      <td>Moderately dissatisfied</td>
      <td>Neither satisfied nor dissatisfied</td>
      <td>Working in a different or more specialized tec...</td>
      <td>I am actively looking for a job</td>
      <td>More than 4 years ago</td>
      <td>70841.0</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Yes</td>
      <td>No</td>
      <td>United States</td>
      <td>Employed full-time</td>
      <td>Associate degree</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>24-26 years</td>
      <td>6-8 years</td>
      <td>Moderately satisfied</td>
      <td>Moderately satisfied</td>
      <td>Working as a founder or co-founder of my own c...</td>
      <td>I'm not actively looking, but I am open to new...</td>
      <td>Less than a year ago</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>18-20 years</td>
      <td>12-14 years</td>
      <td>Neither satisfied nor dissatisfied</td>
      <td>Slightly dissatisfied</td>
      <td>Working as a founder or co-founder of my own c...</td>
      <td>I'm not actively looking, but I am open to new...</td>
      <td>Less than a year ago</td>
      <td>NaN</td>
      <td>Some college/university study without earning ...</td>
      <td>35 - 44 years old</td>
      <td>No</td>
      <td>No</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>No</td>
      <td>Yes, part-time</td>
      <td>South Africa</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>6-8 years</td>
      <td>0-2 years</td>
      <td>Slightly satisfied</td>
      <td>Moderately satisfied</td>
      <td>Working in a different or more specialized tec...</td>
      <td>I'm not actively looking, but I am open to new...</td>
      <td>Between 1 and 2 years ago</td>
      <td>21426.0</td>
      <td>Some college/university study without earning ...</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Respondents_Info.to_sql(name='respondents_info', con=engine, if_exists='append', index=False)
```


```python
##################### 2. "Respondents_Behaviours_Attitudes" Table ###################################
```


```python
Respondents_Behaviours_Attitudes=df[['respondent_id','OperatingSystem','NumberMonitors','CheckInCode','AdBlocker',
                                     'AdBlockerDisable','AdsAgreeDisagree1','AdsAgreeDisagree2','AdsAgreeDisagree3',
                                     'WakeTime','HoursComputer','HoursOutside',
                                     'SkipMeals','Exercise']]

# rename columns
Respondents_Behaviours_Attitudes.columns = ['respondent_id','operating_system','number_monitors','check_in_code',
                                            'adblocker','adblocker_disable','ads_valuable','ads_enjoy',
                                            'ads_dislike','wake_time','hours_computer','hours_outside',
                                            'skip_meals','exercise']
Respondents_Behaviours_Attitudes.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>operating_system</th>
      <th>number_monitors</th>
      <th>check_in_code</th>
      <th>adblocker</th>
      <th>adblocker_disable</th>
      <th>ads_valuable</th>
      <th>ads_enjoy</th>
      <th>ads_dislike</th>
      <th>wake_time</th>
      <th>hours_computer</th>
      <th>hours_outside</th>
      <th>skip_meals</th>
      <th>exercise</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Linux-based</td>
      <td>1</td>
      <td>Multiple times per day</td>
      <td>Yes</td>
      <td>No</td>
      <td>Strongly agree</td>
      <td>Strongly agree</td>
      <td>Strongly agree</td>
      <td>Between 5:00 - 6:00 AM</td>
      <td>9 - 12 hours</td>
      <td>1 - 2 hours</td>
      <td>Never</td>
      <td>3 - 4 times per week</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Linux-based</td>
      <td>2</td>
      <td>A few times per week</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Somewhat agree</td>
      <td>Neither agree nor disagree</td>
      <td>Neither agree nor disagree</td>
      <td>Between 6:01 - 7:00 AM</td>
      <td>5 - 8 hours</td>
      <td>30 - 59 minutes</td>
      <td>Never</td>
      <td>Daily or almost every day</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Windows</td>
      <td>2</td>
      <td>Multiple times per day</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>Neither agree nor disagree</td>
      <td>Somewhat agree</td>
      <td>Somewhat agree</td>
      <td>Between 6:01 - 7:00 AM</td>
      <td>9 - 12 hours</td>
      <td>Less than 30 minutes</td>
      <td>3 - 4 times per week</td>
      <td>I don't typically exercise</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Windows</td>
      <td>2</td>
      <td>Weekly or a few times per month</td>
      <td>No</td>
      <td>NaN</td>
      <td>Somewhat agree</td>
      <td>Somewhat agree</td>
      <td>Somewhat disagree</td>
      <td>Before 5:00 AM</td>
      <td>Over 12 hours</td>
      <td>1 - 2 hours</td>
      <td>Never</td>
      <td>3 - 4 times per week</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Respondents_Behaviours_Attitudes.to_sql(name='respondents_behaviours_attitudes', con=engine, if_exists='append', index=False)

```


```python
##################### 3. "Developer_Types" Table ###################################
```


```python
# Split Dev_Type and expand row-wise. Store in a temporary dataframe
temp_DevType_df = df.DevType.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_DevType_df.index = temp_DevType_df.index.droplevel(-1)
# Name of new column
temp_DevType_df.name = 'developer_type'
# Delete the original DevType columns, no longer necessary
del df['DevType']
# Join the original dataframe with the temporary dataframe 
df2 = df.join(temp_DevType_df)
df2.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>Hobby</th>
      <th>OpenSource</th>
      <th>Country</th>
      <th>Student</th>
      <th>Employment</th>
      <th>FormalEducation</th>
      <th>UndergradMajor</th>
      <th>CompanySize</th>
      <th>YearsCoding</th>
      <th>...</th>
      <th>Gender</th>
      <th>SexualOrientation</th>
      <th>EducationParents</th>
      <th>RaceEthnicity</th>
      <th>Age</th>
      <th>Dependents</th>
      <th>MilitaryUS</th>
      <th>SurveyTooLong</th>
      <th>SurveyEasy</th>
      <th>developer_type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Full-stack developer</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Database administrator</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>DevOps specialist</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Full-stack developer</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>System administrator</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Associate degree</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>24-26 years</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Engineering manager</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Associate degree</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>24-26 years</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Full-stack developer</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>18-20 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Full-stack developer</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Yes</td>
      <td>No</td>
      <td>South Africa</td>
      <td>Yes, part-time</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>6-8 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Data or business analyst</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Yes</td>
      <td>No</td>
      <td>South Africa</td>
      <td>Yes, part-time</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>6-8 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Desktop or enterprise applications developer</td>
    </tr>
  </tbody>
</table>
<p>10 rows × 129 columns</p>
</div>




```python
# replace missing values with string "No answer"
df2['developer_type'] = df2['developer_type'].fillna('No answer')
df2['developer_type'].isna().sum()
```




    0




```python
# Create a dataframe with unique developer_type
Developer_Types = pd.DataFrame(df2.developer_type.unique(), columns=['developer_type'])
# Add incrementing integers for developer_type_id
Developer_Types.insert(0, 'developer_type_id', range(1, 1 + len(Developer_Types)))
Developer_Types
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>developer_type_id</th>
      <th>developer_type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Full-stack developer</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Database administrator</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>DevOps specialist</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>System administrator</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Engineering manager</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Data or business analyst</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Desktop or enterprise applications developer</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Game or graphics developer</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>QA or test developer</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>Student</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>Back-end developer</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>Front-end developer</td>
    </tr>
    <tr>
      <th>12</th>
      <td>13</td>
      <td>Designer</td>
    </tr>
    <tr>
      <th>13</th>
      <td>14</td>
      <td>C-suite executive (CEO, CTO, etc.)</td>
    </tr>
    <tr>
      <th>14</th>
      <td>15</td>
      <td>Mobile developer</td>
    </tr>
    <tr>
      <th>15</th>
      <td>16</td>
      <td>Data scientist or machine learning specialist</td>
    </tr>
    <tr>
      <th>16</th>
      <td>17</td>
      <td>Marketing or sales professional</td>
    </tr>
    <tr>
      <th>17</th>
      <td>18</td>
      <td>Product manager</td>
    </tr>
    <tr>
      <th>18</th>
      <td>19</td>
      <td>Embedded applications or devices developer</td>
    </tr>
    <tr>
      <th>19</th>
      <td>20</td>
      <td>Educator or academic researcher</td>
    </tr>
    <tr>
      <th>20</th>
      <td>21</td>
      <td>No answer</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Developer_Types.to_sql(name='developer_types', con=engine, if_exists='append', index=False)
```


```python
##################### 4. "Developer_Types_Respondents" Table ###################################
```


```python
# Map developer_type_id
developer_type_id_list = [Developer_Types.developer_type_id[Developer_Types.developer_type == i].values[0] for i in df2.developer_type]

# Add developer_type_id to the main dataframe
df2.insert(128, 'developer_type_id', developer_type_id_list)
df2.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>Hobby</th>
      <th>OpenSource</th>
      <th>Country</th>
      <th>Student</th>
      <th>Employment</th>
      <th>FormalEducation</th>
      <th>UndergradMajor</th>
      <th>CompanySize</th>
      <th>YearsCoding</th>
      <th>...</th>
      <th>SexualOrientation</th>
      <th>EducationParents</th>
      <th>RaceEthnicity</th>
      <th>Age</th>
      <th>Dependents</th>
      <th>MilitaryUS</th>
      <th>SurveyTooLong</th>
      <th>SurveyEasy</th>
      <th>developer_type_id</th>
      <th>developer_type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>1</td>
      <td>Full-stack developer</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>2</td>
      <td>Database administrator</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>3</td>
      <td>DevOps specialist</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>1</td>
      <td>Full-stack developer</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>4</td>
      <td>System administrator</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 130 columns</p>
</div>




```python
# Create a dataframe with unique Respondent_id and developer_type_id
Developer_Types_Respondents=df2[['respondent_id', 'developer_type_id']]. drop_duplicates()
Developer_Types_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>developer_type_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>4</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Developer_Types_Respondents.to_sql(name='developer_types_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 5. "Education_Types" Table ###################################
```


```python
# Split Education_Types and expand row-wise. Store in a temporary dataframe
temp_Education_Types_df = df.EducationTypes.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_Education_Types_df.index = temp_Education_Types_df.index.droplevel(-1)
# Name of new column
temp_Education_Types_df.name = 'education_type'
# Delete the original EducationTypes columns, no longer necessary
del df['EducationTypes']
# Join the original dataframe with the temporary dataframe 
df3 = df.join(temp_Education_Types_df)
df3.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>Hobby</th>
      <th>OpenSource</th>
      <th>Country</th>
      <th>Student</th>
      <th>Employment</th>
      <th>FormalEducation</th>
      <th>UndergradMajor</th>
      <th>CompanySize</th>
      <th>YearsCoding</th>
      <th>...</th>
      <th>Gender</th>
      <th>SexualOrientation</th>
      <th>EducationParents</th>
      <th>RaceEthnicity</th>
      <th>Age</th>
      <th>Dependents</th>
      <th>MilitaryUS</th>
      <th>SurveyTooLong</th>
      <th>SurveyEasy</th>
      <th>education_type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Taught yourself a new language, framework, or ...</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Participated in a hackathon</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Taught yourself a new language, framework, or ...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Contributed to open source software</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Associate degree</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>24-26 years</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>18-20 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Completed an industry certification program (e...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>18-20 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Taught yourself a new language, framework, or ...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Yes</td>
      <td>No</td>
      <td>South Africa</td>
      <td>Yes, part-time</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>6-8 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Taken a part-time in-person course in programm...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Yes</td>
      <td>No</td>
      <td>South Africa</td>
      <td>Yes, part-time</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>6-8 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Received on-the-job training in software devel...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Yes</td>
      <td>No</td>
      <td>South Africa</td>
      <td>Yes, part-time</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>6-8 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Taught yourself a new language, framework, or ...</td>
    </tr>
  </tbody>
</table>
<p>10 rows × 128 columns</p>
</div>




```python
# replace missing values with string "No answer"
df3['education_type'] = df3['education_type'].fillna('No answer')
df3['education_type'].isna().sum()
```




    0




```python
# Create a dataframe with unique Education_Types
Education_Types = pd.DataFrame(df3.education_type.unique(), columns=['education_type'])
# Add incrementing integers for edu_type_id
Education_Types.insert(0, 'education_type_id', range(1, 1 + len(Education_Types)))
Education_Types
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>education_type_id</th>
      <th>education_type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Taught yourself a new language, framework, or ...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Participated in a hackathon</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Contributed to open source software</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Completed an industry certification program (e...</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Taken a part-time in-person course in programm...</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Received on-the-job training in software devel...</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Participated in online coding competitions (e....</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>Taken an online course in programming or softw...</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>Participated in a full-time developer training...</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Education_Types.to_sql(name='education_types', con=engine, if_exists='append', index=False)
```


```python
##################### 6. "Education_Respondents" Table ###################################
```


```python
# Map edu_type_id
edu_type_id_list = [Education_Types.education_type_id[Education_Types.education_type == i].values[0] for i in df3.education_type]

# Add edu_type_id to the main dataframe
df3.insert(128, 'education_type_id', edu_type_id_list)
df3.head()

# Create a dataframe with unique Respondent_id and dev_type_id
Education_Respondents=df3[['respondent_id', 'education_type_id']]. drop_duplicates()
Education_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>education_type_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>4</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Education_Respondents.to_sql(name='education_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 7. "Self_Taught_Types" Table ###################################
```


```python
# Split Self_Taught_Types and expand row-wise. Store in a temporary dataframe
temp_Self_Taught_Types_df = df.SelfTaughtTypes.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_Self_Taught_Types_df.index = temp_Self_Taught_Types_df.index.droplevel(-1)
# Name of new column
temp_Self_Taught_Types_df.name = 'self_taught_type'
# Delete the original SelfTaughtTypes columns, no longer necessary
del df['SelfTaughtTypes']
# Join the original dataframe with the temporary dataframe 
df4 = df.join(temp_Self_Taught_Types_df)
df4.head(10)

# replace missing values with string "No answer"
df4['self_taught_type'] = df4['self_taught_type'].fillna('No answer')
df4['self_taught_type'].isna().sum()

# Create a dataframe with unique Self_Taught_Types
Self_Taught_Types = pd.DataFrame(df4.self_taught_type.unique(), columns=['self_taught_type'])
# Add incrementing integers for self_taught_type_id
Self_Taught_Types.insert(0, 'self_taught_type_id', range(1, 1 + len(Self_Taught_Types)))
Self_Taught_Types
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>self_taught_type_id</th>
      <th>self_taught_type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>The official documentation and/or standards fo...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>A book or e-book from O+BH468Reilly, Apress, o...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Questions &amp; answers on Stack Overflow</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Online developer communities other than Stack ...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>A book or e-book from O'Reilly, Apress, or a s...</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>The technology's online help system</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>A college/university computer science or softw...</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>Tapping your network of friends, family, and p...</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>Pre-scheduled tutoring or mentoring sessions w...</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>Internal Wikis, chat rooms, or documentation s...</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Self_Taught_Types.to_sql(name='self_taught_types', con=engine, if_exists='append', index=False)
```


```python
##################### 8. "Self_Taught_Respondents" Table ###################################
```


```python
# Map self_taught_type_id
self_taught_type_id_list = [Self_Taught_Types.self_taught_type_id[Self_Taught_Types.self_taught_type == i].values[0] for i in df4.self_taught_type]

# Add self_taught_type_id to the main dataframe
df4.insert(127, 'self_taught_type_id', self_taught_type_id_list)
df4.head()

# Create a dataframe with unique respondent_id and self_taught_type_id
Self_Taught_Respondents=df4[['respondent_id', 'self_taught_type_id']]. drop_duplicates()
Self_Taught_Respondents.head()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>self_taught_type_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Self_Taught_Respondents.to_sql(name='self_taught_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 9. "Hackathon_Reasons" Table ###################################
```


```python
# Split HackathonReasons and expand row-wise. Store in a temporary dataframe
temp_Hackathon_Reasons_df = df.HackathonReasons.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_Hackathon_Reasons_df.index = temp_Hackathon_Reasons_df.index.droplevel(-1)
# Name of new column
temp_Hackathon_Reasons_df.name = 'hackathon_reason'
# Delete the original HackathonReasons columns, no longer necessary
del df['HackathonReasons']
# Join the original dataframe with the temporary dataframe 
df5 = df.join(temp_Hackathon_Reasons_df)
df5.head(10)

# replace missing values with string "No answer"
df5['hackathon_reason'] = df5['hackathon_reason'].fillna('No answer')
df5['hackathon_reason'].isna().sum()

# Create a dataframe with unique hackathon_reason
Hackathon_Reasons = pd.DataFrame(df5.hackathon_reason.unique(), columns=['hackathon_reason'])
# Add incrementing integers for hackathon_reason_id
Hackathon_Reasons.insert(0, 'hackathon_reason_id', range(1, 1 + len(Hackathon_Reasons)))
Hackathon_Reasons
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>hackathon_reason_id</th>
      <th>hackathon_reason</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>To build my professional network</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>To improve my general technical skills or prog...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>To improve my knowledge of a specific programm...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Because I find it enjoyable</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>To improve my ability to work on a team with o...</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>To help me find new job opportunities</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>To win prizes or cash awards</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Hackathon_Reasons.to_sql(name='hackathon_reasons', con=engine, if_exists='append', index=False)
```


```python
##################### 10. "Hackathon_Reasons_Respondents" Table ###################################
```


```python
# Map hackathon_reason_id
hackathon_reason_id_list = [Hackathon_Reasons.hackathon_reason_id[Hackathon_Reasons.hackathon_reason == i].values[0] for i in df5.hackathon_reason]

# Add hackathon_reason_id to the main dataframe
df5.insert(126, 'hackathon_reason_id', hackathon_reason_id_list)
df5.head()

# Create a dataframe with unique respondent_id and hackathon_reason_id
Hackathon_Reasons_Respondents=df5[['respondent_id', 'hackathon_reason_id']]. drop_duplicates()
Hackathon_Reasons_Respondents.head()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>hackathon_reason_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Hackathon_Reasons_Respondents.to_sql(name='hackathon_reasons_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 11. "Languages" Table ###################################
```


```python
# Split LanguageWorkedWith and expand row-wise. Store in a temporary dataframe
temp_Languages_df = df.LanguageWorkedWith.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_Languages_df.index = temp_Languages_df.index.droplevel(-1)
# Name of new column
temp_Languages_df.name = 'language'
# Delete the original LanguageWorkedWith columns, no longer necessary
del df['LanguageWorkedWith']
# Join the original dataframe with the temporary dataframe 
df6 = df.join(temp_Languages_df)
df6.head(10)

# replace missing values with string "No answer"
df6['language'] = df6['language'].fillna('No answer')
df6['language'].isna().sum()

# Create a dataframe with unique language
Languages = pd.DataFrame(df6.language.unique(), columns=['language'])
# Add incrementing integers for language_id
Languages.insert(0, 'language_id', range(1, 1 + len(Languages)))
Languages
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>language_id</th>
      <th>language</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>JavaScript</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Python</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>HTML</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>CSS</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Bash/Shell</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>C#</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>SQL</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>TypeScript</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>C</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>C++</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>Java</td>
    </tr>
    <tr>
      <th>12</th>
      <td>13</td>
      <td>Matlab</td>
    </tr>
    <tr>
      <th>13</th>
      <td>14</td>
      <td>R</td>
    </tr>
    <tr>
      <th>14</th>
      <td>15</td>
      <td>Assembly</td>
    </tr>
    <tr>
      <th>15</th>
      <td>16</td>
      <td>CoffeeScript</td>
    </tr>
    <tr>
      <th>16</th>
      <td>17</td>
      <td>Erlang</td>
    </tr>
    <tr>
      <th>17</th>
      <td>18</td>
      <td>Go</td>
    </tr>
    <tr>
      <th>18</th>
      <td>19</td>
      <td>Lua</td>
    </tr>
    <tr>
      <th>19</th>
      <td>20</td>
      <td>Ruby</td>
    </tr>
    <tr>
      <th>20</th>
      <td>21</td>
      <td>PHP</td>
    </tr>
    <tr>
      <th>21</th>
      <td>22</td>
      <td>VB.NET</td>
    </tr>
    <tr>
      <th>22</th>
      <td>23</td>
      <td>Swift</td>
    </tr>
    <tr>
      <th>23</th>
      <td>24</td>
      <td>Groovy</td>
    </tr>
    <tr>
      <th>24</th>
      <td>25</td>
      <td>Kotlin</td>
    </tr>
    <tr>
      <th>25</th>
      <td>26</td>
      <td>Objective-C</td>
    </tr>
    <tr>
      <th>26</th>
      <td>27</td>
      <td>Scala</td>
    </tr>
    <tr>
      <th>27</th>
      <td>28</td>
      <td>F#</td>
    </tr>
    <tr>
      <th>28</th>
      <td>29</td>
      <td>Haskell</td>
    </tr>
    <tr>
      <th>29</th>
      <td>30</td>
      <td>Rust</td>
    </tr>
    <tr>
      <th>30</th>
      <td>31</td>
      <td>Julia</td>
    </tr>
    <tr>
      <th>31</th>
      <td>32</td>
      <td>VBA</td>
    </tr>
    <tr>
      <th>32</th>
      <td>33</td>
      <td>Perl</td>
    </tr>
    <tr>
      <th>33</th>
      <td>34</td>
      <td>Cobol</td>
    </tr>
    <tr>
      <th>34</th>
      <td>35</td>
      <td>Visual Basic 6</td>
    </tr>
    <tr>
      <th>35</th>
      <td>36</td>
      <td>Delphi/Object Pascal</td>
    </tr>
    <tr>
      <th>36</th>
      <td>37</td>
      <td>Hack</td>
    </tr>
    <tr>
      <th>37</th>
      <td>38</td>
      <td>Clojure</td>
    </tr>
    <tr>
      <th>38</th>
      <td>39</td>
      <td>Ocaml</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Languages.to_sql(name='languages', con=engine, if_exists='append', index=False)
```


```python
##################### 12. "Languages_Worked_With_Respondents" Table ###################################
```


```python
# Map language_id
language_worked_with_id_list = [Languages.language_id[Languages.language == i].values[0] for i in df6.language]

# Add language_id to the main dataframe
df6.insert(125, 'language_id', language_worked_with_id_list)
df6.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>Hobby</th>
      <th>OpenSource</th>
      <th>Country</th>
      <th>Student</th>
      <th>Employment</th>
      <th>FormalEducation</th>
      <th>UndergradMajor</th>
      <th>CompanySize</th>
      <th>YearsCoding</th>
      <th>...</th>
      <th>SexualOrientation</th>
      <th>EducationParents</th>
      <th>RaceEthnicity</th>
      <th>Age</th>
      <th>Dependents</th>
      <th>MilitaryUS</th>
      <th>SurveyTooLong</th>
      <th>SurveyEasy</th>
      <th>language</th>
      <th>language_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>JavaScript</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Python</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>HTML</td>
      <td>3</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>CSS</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>JavaScript</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 126 columns</p>
</div>




```python
# Create a dataframe with unique respondent_id and language_id
Languages_Worked_With_Respondents=df6[['respondent_id', 'language_id']]. drop_duplicates()
Languages_Worked_With_Respondents.columns = ['respondent_id','language_id_worked_with']
Languages_Worked_With_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>language_id_worked_with</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Languages_Worked_With_Respondents.to_sql(name='languages_worked_with_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 13. "Languages_Desire_Next_Year_Respondents" Table ###################################
```


```python
# Split LanguageDesireNextYear and expand row-wise. Store in a temporary dataframe
temp_LanguageDesireNextYear_df = df.LanguageDesireNextYear.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_LanguageDesireNextYear_df.index = temp_LanguageDesireNextYear_df.index.droplevel(-1)
# Name of new column
temp_LanguageDesireNextYear_df.name = 'language'
# Delete the original LanguageDesireNextYear columns, no longer necessary
del df['LanguageDesireNextYear']
# Join the original dataframe with the temporary dataframe 
df7 = df.join(temp_LanguageDesireNextYear_df)
df7.head(10)

# replace missing values with string "No answer"
df7['language'] = df7['language'].fillna('No answer')
df7['language'].isna().sum()
```




    0




```python
# Because this is an survey, the types of languages included in the column "LanguageDesireNextYear" are 
# same as the types of languages included in the column "LanguageWorkedWith". We do not need to recreate a language table again, 
# but only need to use the "Languages" table created before.

# Map language_id
language_desire_list = [Languages.language_id[Languages.language == i].values[0] for i in df7.language]

# Add language_id to the main dataframe
df7.insert(124, 'language_id', language_desire_list)
df7.head()

# Create a dataframe with unique respondent_id and language_id
Languages_Desire_Next_Year_Respondents=df7[['respondent_id', 'language_id']]. drop_duplicates()
Languages_Desire_Next_Year_Respondents.columns = ['respondent_id','language_id_desire_next_year']
Languages_Desire_Next_Year_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>language_id_desire_next_year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>18</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Languages_Desire_Next_Year_Respondents.to_sql(name='languages_desire_next_year_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 14. "Databases" Table ###################################
```


```python
# Split DatabaseWorkedWith and expand row-wise. Store in a temporary dataframe
temp_Databases_df = df.DatabaseWorkedWith.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_Databases_df.index = temp_Databases_df.index.droplevel(-1)
# Name of new column
temp_Databases_df.name = 'database'
# Delete the original DatabaseWorkedWith columns, no longer necessary
del df['DatabaseWorkedWith']
# Join the original dataframe with the temporary dataframe 
df8 = df.join(temp_Databases_df)
df8.head(10)

# replace missing values with string "No answer"
df8['database'] = df8['database'].fillna('No answer')
df8['database'].isna().sum()

# Create a dataframe with unique database
Databases = pd.DataFrame(df8.database.unique(), columns=['database'])
# Add incrementing integers for database_id
Databases.insert(0, 'database_id', range(1, 1 + len(Databases)))
Databases
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>database_id</th>
      <th>database</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Redis</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>SQL Server</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>MySQL</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>PostgreSQL</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Amazon RDS/Aurora</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Microsoft Azure (Tables, CosmosDB, SQL, etc)</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Memcached</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>Oracle</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>IBM Db2</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>MongoDB</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>Google Cloud Storage</td>
    </tr>
    <tr>
      <th>12</th>
      <td>13</td>
      <td>Amazon DynamoDB</td>
    </tr>
    <tr>
      <th>13</th>
      <td>14</td>
      <td>Apache HBase</td>
    </tr>
    <tr>
      <th>14</th>
      <td>15</td>
      <td>Apache Hive</td>
    </tr>
    <tr>
      <th>15</th>
      <td>16</td>
      <td>Amazon Redshift</td>
    </tr>
    <tr>
      <th>16</th>
      <td>17</td>
      <td>Elasticsearch</td>
    </tr>
    <tr>
      <th>17</th>
      <td>18</td>
      <td>MariaDB</td>
    </tr>
    <tr>
      <th>18</th>
      <td>19</td>
      <td>SQLite</td>
    </tr>
    <tr>
      <th>19</th>
      <td>20</td>
      <td>Google BigQuery</td>
    </tr>
    <tr>
      <th>20</th>
      <td>21</td>
      <td>Cassandra</td>
    </tr>
    <tr>
      <th>21</th>
      <td>22</td>
      <td>Neo4j</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Databases.to_sql(name='databases', con=engine, if_exists='append', index=False)
```


```python
##################### 15. "Databases_Worked_With_Respondents" Table ###################################
```


```python
# Map database_id
database_worked_with_id_list = [Databases.database_id[Databases.database == i].values[0] for i in df8.database]

# Add database_id to the main dataframe
df8.insert(123, 'database_id', database_worked_with_id_list)
df8.head()

# Create a dataframe with unique respondent_id and database_id
Databases_Worked_With_Respondents=df8[['respondent_id', 'database_id']]. drop_duplicates()
Databases_Worked_With_Respondents.columns = ['respondent_id','database_id_worked_with']
Databases_Worked_With_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>database_id_worked_with</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Databases_Worked_With_Respondents.to_sql(name='databases_worked_with_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 16. "Databases_Desire_Next_Year_Respondents" Table ###################################
```


```python
# Split DatabaseDesireNextYear and expand row-wise. Store in a temporary dataframe
temp_DatabaseDesireNextYear_df = df.DatabaseDesireNextYear.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_DatabaseDesireNextYear_df.index = temp_DatabaseDesireNextYear_df.index.droplevel(-1)
# Name of new column
temp_DatabaseDesireNextYear_df.name = 'database'
# Delete the original DatabaseDesireNextYear columns, no longer necessary
del df['DatabaseDesireNextYear']
# Join the original dataframe with the temporary dataframe 
df9 = df.join(temp_DatabaseDesireNextYear_df)
df9.head(10)

# replace missing values with string "No answer"
df9['database'] = df9['database'].fillna('No answer')
df9['database'].isna().sum()

# Map database_id
Database_desire_list = [Databases.database_id[Databases.database == i].values[0] for i in df9.database]

# Add database_id to the main dataframe
df9.insert(122, 'database_id', Database_desire_list)
df9.head()

# Create a dataframe with unique respondent_id and database_id
Databases_Desire_Next_Year_Respondents=df9[['respondent_id', 'database_id']]. drop_duplicates()
Databases_Desire_Next_Year_Respondents.columns = ['respondent_id','database_id_desire_next_year']
Databases_Desire_Next_Year_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>database_id_desire_next_year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Databases_Desire_Next_Year_Respondents.to_sql(name='databases_desire_next_year_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 17. "Platforms" Table ###################################
```


```python
# Split PlatformWorkedWith and expand row-wise. Store in a temporary dataframe
temp_Platforms_df = df.PlatformWorkedWith.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_Platforms_df.index = temp_Platforms_df.index.droplevel(-1)
# Name of new column
temp_Platforms_df.name = 'platform'
# Delete the original PlatformWorkedWith columns, no longer necessary
del df['PlatformWorkedWith']
# Join the original dataframe with the temporary dataframe 
df10 = df.join(temp_Platforms_df)
df10.head(10)

# replace missing values with string "No answer"
df10['platform'] = df10['platform'].fillna('No answer')
df10['platform'].isna().sum()

# Create a dataframe with unique platform
Platforms = pd.DataFrame(df10.platform.unique(), columns=['platform'])
# Add incrementing integers for platform_id
Platforms.insert(0, 'platform_id', range(1, 1 + len(Platforms)))
Platforms
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>platform_id</th>
      <th>platform</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>AWS</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Azure</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Linux</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Firebase</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Arduino</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Windows Desktop or Server</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Heroku</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>Amazon Echo</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>iOS</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>Mac OS</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>Serverless</td>
    </tr>
    <tr>
      <th>12</th>
      <td>13</td>
      <td>Android</td>
    </tr>
    <tr>
      <th>13</th>
      <td>14</td>
      <td>WordPress</td>
    </tr>
    <tr>
      <th>14</th>
      <td>15</td>
      <td>Drupal</td>
    </tr>
    <tr>
      <th>15</th>
      <td>16</td>
      <td>Google Cloud Platform/App Engine</td>
    </tr>
    <tr>
      <th>16</th>
      <td>17</td>
      <td>Raspberry Pi</td>
    </tr>
    <tr>
      <th>17</th>
      <td>18</td>
      <td>SharePoint</td>
    </tr>
    <tr>
      <th>18</th>
      <td>19</td>
      <td>IBM Cloud or Watson</td>
    </tr>
    <tr>
      <th>19</th>
      <td>20</td>
      <td>Mainframe</td>
    </tr>
    <tr>
      <th>20</th>
      <td>21</td>
      <td>Apple Watch or Apple TV</td>
    </tr>
    <tr>
      <th>21</th>
      <td>22</td>
      <td>ESP8266</td>
    </tr>
    <tr>
      <th>22</th>
      <td>23</td>
      <td>Gaming console</td>
    </tr>
    <tr>
      <th>23</th>
      <td>24</td>
      <td>Predix</td>
    </tr>
    <tr>
      <th>24</th>
      <td>25</td>
      <td>Windows Phone</td>
    </tr>
    <tr>
      <th>25</th>
      <td>26</td>
      <td>Salesforce</td>
    </tr>
    <tr>
      <th>26</th>
      <td>27</td>
      <td>Google Home</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Platforms.to_sql(name='platforms', con=engine, if_exists='append', index=False)
```


```python
##################### 18. "Platforms_Worked_With_Respondents" Table ###################################
```


```python
# Map platform_id
platform_worked_with_id_list = [Platforms.platform_id[Platforms.platform == i].values[0] for i in df10.platform]

# Add platform_id to the main dataframe
df10.insert(121, 'platform_id', platform_worked_with_id_list)
df10.head()

# Create a dataframe with unique respondent_id and platform_id
Platforms_Worked_With_Respondents=df10[['respondent_id', 'platform_id']]. drop_duplicates()
Platforms_Worked_With_Respondents.columns = ['respondent_id','platform_id_worked_with']
Platforms_Worked_With_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>platform_id_worked_with</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Platforms_Worked_With_Respondents.to_sql(name='platforms_worked_with_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 19. "Platforms_Desire_Next_Year_Respondents" Table ###################################
```


```python
# Split PlatformDesireNextYear and expand row-wise. Store in a temporary dataframe
temp_PlatformDesireNextYear_df = df.PlatformDesireNextYear.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_PlatformDesireNextYear_df.index = temp_PlatformDesireNextYear_df.index.droplevel(-1)
# Name of new column
temp_PlatformDesireNextYear_df.name = 'platform'
# Delete the original PlatformDesireNextYear columns, no longer necessary
del df['PlatformDesireNextYear']
# Join the original dataframe with the temporary dataframe 
df11 = df.join(temp_PlatformDesireNextYear_df)
df11.head(10)

# replace missing values with string "No answer"
df11['platform'] = df11['platform'].fillna('No answer')
df11['platform'].isna().sum()

# Map platform_id
Platform_desire_list = [Platforms.platform_id[Platforms.platform == i].values[0] for i in df11.platform]

# Add database_id to the main dataframe
df11.insert(120, 'platform_id', Platform_desire_list)
df11.head()


# Create a dataframe with unique respondent_id and database_id
Platforms_Desire_Next_Year_Respondents=df11[['respondent_id', 'platform_id']]. drop_duplicates()
Platforms_Desire_Next_Year_Respondents.columns = ['respondent_id','platform_id_desire_next_year']
Platforms_Desire_Next_Year_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>platform_id_desire_next_year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Platforms_Desire_Next_Year_Respondents.to_sql(name='platforms_desire_next_year_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 20. "Frameworks" Table ###################################
```


```python
# Split FrameworkWorkedWith and expand row-wise. Store in a temporary dataframe
temp_Frameworks_df = df.FrameworkWorkedWith.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_Frameworks_df.index = temp_Frameworks_df.index.droplevel(-1)
# Name of new column
temp_Frameworks_df.name = 'framework'
# Delete the original FrameworkWorkedWith columns, no longer necessary
del df['FrameworkWorkedWith']
# Join the original dataframe with the temporary dataframe 
df12 = df.join(temp_Frameworks_df)
df12.head(10)

# replace missing values with string "No answer"
df12['framework'] = df12['framework'].fillna('No answer')
df12['framework'].isna().sum()

# Create a dataframe with unique framework
Frameworks = pd.DataFrame(df12.framework.unique(), columns=['framework'])
# Add incrementing integers for framework_id
Frameworks.insert(0, 'framework_id', range(1, 1 + len(Frameworks)))
Frameworks
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>framework_id</th>
      <th>framework</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Django</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>React</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Angular</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Node.js</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Hadoop</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Spark</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Spring</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>.NET Core</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>Cordova</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>Xamarin</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>TensorFlow</td>
    </tr>
    <tr>
      <th>12</th>
      <td>13</td>
      <td>Torch/PyTorch</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Frameworks.to_sql(name='frameworks', con=engine, if_exists='append', index=False)
```


```python
##################### 21. "Frameworks_Worked_With_Respondents" Table ###################################
```


```python
# Map framework_id
framework_worked_with_id_list = [Frameworks.framework_id[Frameworks.framework == i].values[0] for i in df12.framework]

# Add framework_id to the main dataframe
df12.insert(119, 'framework_id', framework_worked_with_id_list)
df12.head()

# Create a dataframe with unique respondent_id and framework_id
Frameworks_Worked_With_Respondents=df12[['respondent_id', 'framework_id']]. drop_duplicates()
Frameworks_Worked_With_Respondents.columns = ['respondent_id','framework_id_worked_with']
Frameworks_Worked_With_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>framework_id_worked_with</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Frameworks_Worked_With_Respondents.to_sql(name='frameworks_worked_with_respondents', con=engine, if_exists='append', index=False)

```


```python
##################### 22. "Frameworks_Desire_Next_Year_Respondents" Table ###################################
```


```python
# Split FrameworkDesireNextYear and expand row-wise. Store in a temporary dataframe
temp_FrameworkDesireNextYear_df = df.FrameworkDesireNextYear.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_FrameworkDesireNextYear_df.index = temp_FrameworkDesireNextYear_df.index.droplevel(-1)
# Name of new column
temp_FrameworkDesireNextYear_df.name = 'framework'
# Delete the original FrameworkDesireNextYear columns, no longer necessary
del df['FrameworkDesireNextYear']
# Join the original dataframe with the temporary dataframe 
df13 = df.join(temp_FrameworkDesireNextYear_df)
df13.head(10)

# replace missing values with string "No answer"
df13['framework'] = df13['framework'].fillna('No answer')
df13['framework'].isna().sum()

# Map framework_id
Framework_desire_list = [Frameworks.framework_id[Frameworks.framework == i].values[0] for i in df13.framework]

# Add framework_id to the main dataframe
df13.insert(118, 'framework_id', Framework_desire_list)
df13.head()

# Create a dataframe with unique respondent_id and framework_id
Frameworks_Desire_Next_Year_Respondents=df13[['respondent_id', 'framework_id']]. drop_duplicates()
Frameworks_Desire_Next_Year_Respondents.columns = ['respondent_id','framework_id_desire_next_year']
Frameworks_Desire_Next_Year_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>framework_id_desire_next_year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>4</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Frameworks_Desire_Next_Year_Respondents.to_sql(name='frameworks_desire_next_year_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 23. "IDE" Table ###################################
```


```python
# Split IDE_Types and expand row-wise. Store in a temporary dataframe
temp_IDETypes_df = df.IDE.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_IDETypes_df.index = temp_IDETypes_df.index.droplevel(-1)
# Name of new column
temp_IDETypes_df.name = 'ide'
# Delete the original IDE columns, no longer necessary
del df['IDE']
# Join the original dataframe with the temporary dataframe 
df21 = df.join(temp_IDETypes_df)
df21.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>Hobby</th>
      <th>OpenSource</th>
      <th>Country</th>
      <th>Student</th>
      <th>Employment</th>
      <th>FormalEducation</th>
      <th>UndergradMajor</th>
      <th>CompanySize</th>
      <th>YearsCoding</th>
      <th>...</th>
      <th>Gender</th>
      <th>SexualOrientation</th>
      <th>EducationParents</th>
      <th>RaceEthnicity</th>
      <th>Age</th>
      <th>Dependents</th>
      <th>MilitaryUS</th>
      <th>SurveyTooLong</th>
      <th>SurveyEasy</th>
      <th>IDE</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Komodo</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Vim</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Visual Studio Code</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>IPython / Jupyter</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Sublime Text</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Vim</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Associate degree</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>20 to 99 employees</td>
      <td>24-26 years</td>
      <td>...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>18-20 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Visual Studio</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>No</td>
      <td>No</td>
      <td>United States</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>100 to 499 employees</td>
      <td>18-20 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>No</td>
      <td>No</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Visual Studio Code</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Yes</td>
      <td>No</td>
      <td>South Africa</td>
      <td>Yes, part-time</td>
      <td>Employed full-time</td>
      <td>Some college/university study without earning ...</td>
      <td>Computer science, computer engineering, or sof...</td>
      <td>10,000 or more employees</td>
      <td>6-8 years</td>
      <td>...</td>
      <td>Male</td>
      <td>Straight or heterosexual</td>
      <td>Some college/university study without earning ...</td>
      <td>White or of European descent</td>
      <td>18 - 24 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Notepad++</td>
    </tr>
  </tbody>
</table>
<p>10 rows × 117 columns</p>
</div>




```python
# replace missing values in IDE_Types with string "No answer"
df21['ide'] = df21['ide'].fillna('No answer')
df21['ide'].isna().sum()
```




    0




```python
# Create a dataframe with unique IDE
IDE = pd.DataFrame(df21.ide.unique(), columns=['ide'])
# Add incrementing integers for IDE_id
IDE.insert(0, 'ide_id', range(1, 1 + len(IDE)))
IDE
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>IDE_id</th>
      <th>IDE</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Komodo</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Vim</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Visual Studio Code</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>IPython / Jupyter</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Sublime Text</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Visual Studio</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Notepad++</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>IntelliJ</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>PyCharm</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>Atom</td>
    </tr>
    <tr>
      <th>11</th>
      <td>12</td>
      <td>Eclipse</td>
    </tr>
    <tr>
      <th>12</th>
      <td>13</td>
      <td>NetBeans</td>
    </tr>
    <tr>
      <th>13</th>
      <td>14</td>
      <td>Android Studio</td>
    </tr>
    <tr>
      <th>14</th>
      <td>15</td>
      <td>Coda</td>
    </tr>
    <tr>
      <th>15</th>
      <td>16</td>
      <td>Xcode</td>
    </tr>
    <tr>
      <th>16</th>
      <td>17</td>
      <td>PHPStorm</td>
    </tr>
    <tr>
      <th>17</th>
      <td>18</td>
      <td>RStudio</td>
    </tr>
    <tr>
      <th>18</th>
      <td>19</td>
      <td>Emacs</td>
    </tr>
    <tr>
      <th>19</th>
      <td>20</td>
      <td>RubyMine</td>
    </tr>
    <tr>
      <th>20</th>
      <td>21</td>
      <td>Light Table</td>
    </tr>
    <tr>
      <th>21</th>
      <td>22</td>
      <td>Zend</td>
    </tr>
    <tr>
      <th>22</th>
      <td>23</td>
      <td>TextMate</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
IDE.to_sql(name='ide', con=engine, if_exists='append', index=False)
```


```python
##################### 24. "IDE_Respondents" Table ###################################
```


```python
# Map IDE_id
ide_id_list = [IDE.ide_id[IDE.ide == i].values[0] for i in df21.ide]

# Add IDE_id to the main dataframe
df21.insert(117, 'ide_id', ide_id_list)
df21.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>Hobby</th>
      <th>OpenSource</th>
      <th>Country</th>
      <th>Student</th>
      <th>Employment</th>
      <th>FormalEducation</th>
      <th>UndergradMajor</th>
      <th>CompanySize</th>
      <th>YearsCoding</th>
      <th>...</th>
      <th>SexualOrientation</th>
      <th>EducationParents</th>
      <th>RaceEthnicity</th>
      <th>Age</th>
      <th>Dependents</th>
      <th>MilitaryUS</th>
      <th>SurveyTooLong</th>
      <th>SurveyEasy</th>
      <th>IDE</th>
      <th>IDE_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Komodo</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Vim</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Yes</td>
      <td>No</td>
      <td>Kenya</td>
      <td>No</td>
      <td>Employed part-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Mathematics or statistics</td>
      <td>20 to 99 employees</td>
      <td>3-5 years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>Black or of African descent</td>
      <td>25 - 34 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Very easy</td>
      <td>Visual Studio Code</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>IPython / Jupyter</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>United Kingdom</td>
      <td>No</td>
      <td>Employed full-time</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>A natural science (ex. biology, chemistry, phy...</td>
      <td>10,000 or more employees</td>
      <td>30 or more years</td>
      <td>...</td>
      <td>Straight or heterosexual</td>
      <td>Bachelor's degree (BA, BS, B.Eng., etc.)</td>
      <td>White or of European descent</td>
      <td>35 - 44 years old</td>
      <td>Yes</td>
      <td>NaN</td>
      <td>The survey was an appropriate length</td>
      <td>Somewhat easy</td>
      <td>Sublime Text</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 118 columns</p>
</div>




```python
# Create a dataframe with unique Respondent_id and IDE_id
IDE_Respondents=df21[['respondent_id', 'ide_id']]. drop_duplicates()
IDE_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>IDE_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
IDE_Respondents.to_sql(name='ide_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 25. "Methodologies" Table ###################################
```


```python
# Split Methodology and expand row-wise. Store in a temporary dataframe
temp_Methodology_df = df.Methodology.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_Methodology_df.index = temp_Methodology_df.index.droplevel(-1)
# Name of new column
temp_Methodology_df.name = 'methodology'
# Delete the original Methodology columns, no longer necessary
del df['Methodology']
# Join the original dataframe with the temporary dataframe 
df23 = df.join(temp_Methodology_df)
df23.head(10)

# replace missing values in Methodology with string "No answer"
df23['methodology'] = df23['methodology'].fillna('No answer')
df23['methodology'].isna().sum()

# Create a dataframe with unique Methodology
Methodologies = pd.DataFrame(df23.methodology.unique(), columns=['methodology'])
# Add incrementing integers for Methodology_id
Methodologies.insert(0, 'methodology_id', range(1, 1 + len(Methodologies)))
Methodologies
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>methodology_id</th>
      <th>methodology</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Agile</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Scrum</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Kanban</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Evidence-based software engineering</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Formal standard such as ISO 9001 or IEEE 12207...</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Extreme programming (XP)</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>Lean</td>
    </tr>
    <tr>
      <th>8</th>
      <td>9</td>
      <td>Pair programming</td>
    </tr>
    <tr>
      <th>9</th>
      <td>10</td>
      <td>Mob programming</td>
    </tr>
    <tr>
      <th>10</th>
      <td>11</td>
      <td>PRINCE2</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Methodologies.to_sql(name='methodologies', con=engine, if_exists='append', index=False)
```


```python
##################### 26. "Methodologies_Respondents" Table ###################################
```


```python
# Map Methodology_id
methodology_id_list = [Methodologies.methodology_id[Methodologies.methodology == i].values[0] for i in df23.methodology]

# Add methodology_id to the main dataframe
df23.insert(116, 'methodology_id', methodology_id_list)
df23.head()

# Create a dataframe with unique Respondent_id and Methodology_id
Methodologies_Respondents=df23[['respondent_id', 'methodology_id']]. drop_duplicates()
Methodologies_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>methodology_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Methodologies_Respondents.to_sql(name='methodologies_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 27. "Version_Control" Table ###################################
```


```python
# Split VersionControl and expand row-wise. Store in a temporary dataframe
temp_VersionControl_df = df.VersionControl.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_VersionControl_df.index = temp_VersionControl_df.index.droplevel(-1)
# Name of new column
temp_VersionControl_df.name = 'version_control'
# Delete the original VersionControl, no longer necessary
del df['VersionControl']
# Join the original dataframe with the temporary dataframe 
df25 = df.join(temp_VersionControl_df)
df25.head(10)

# replace missing values in Methodology with string "No answer"
df25['version_control'] = df25['version_control'].fillna('No answer')
df25['version_control'].isna().sum()

# Create a dataframe with unique VersionControl
Version_Control = pd.DataFrame(df25.version_control.unique(), columns=['version_control'])
# Add incrementing integers for version_control_id
Version_Control.insert(0, 'version_control_id', range(1, 1 + len(Version_Control)))
Version_Control
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>version_control_id</th>
      <th>version_control</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Git</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Subversion</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Zip file back-ups</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Copying and pasting files to network shares</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Team Foundation Version Control</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Mercurial</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>I don't use version control</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Version_Control.to_sql(name='version_control', con=engine, if_exists='append', index=False)
```


```python
##################### 28. "Version_Control_Respondents" Table ###################################
```


```python
# Map Version_Control_id
version_control_id_list = [Version_Control.version_control_id[Version_Control.version_control == i].values[0] for i in df25.version_control]

# Add Version_Control_id to the main dataframe
df25.insert(115, 'version_control_id', version_control_id_list)
df25.head()

# Create a dataframe with unique Respondent_id and Version_Control_id
Version_Control_Respondents=df25[['respondent_id', 'version_control_id']]. drop_duplicates()
Version_Control_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>version_control_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Version_Control_Respondents.to_sql(name='version_control_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 29. "AdBlocker_Reasons" Table ###################################
```


```python
# Split AdBlockerReasons and expand row-wise. Store in a temporary dataframe
temp_AdBlockerReasonsTypes_df = df.AdBlockerReasons.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_AdBlockerReasonsTypes_df.index = temp_AdBlockerReasonsTypes_df.index.droplevel(-1)
# Name of new column
temp_AdBlockerReasonsTypes_df.name = 'adblocker_reason'
# Delete the original AdBlockerReasons columns, no longer necessary
del df['AdBlockerReasons']
# Join the original dataframe with the temporary AdBlockerReasons
df27 = df.join(temp_AdBlockerReasonsTypes_df)
df27.head(10)

# replace missing values in AdBlockerReasons with string "No answer"
df27['adblocker_reason'] = df27['adblocker_reason'].fillna('No answer')
df27['adblocker_reason'].isna().sum()

# Create a dataframe with unique adblocker_reason
AdBlocker_Reasons = pd.DataFrame(df27.adblocker_reason.unique(), columns=['adblocker_reason'])
# Add incrementing integers for adblocker_reason_id
AdBlocker_Reasons.insert(0, 'adblocker_reason_id', range(1, 1 + len(AdBlocker_Reasons)))
AdBlocker_Reasons
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>adblocker_reason_id</th>
      <th>adblocker_reason</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>The website I was visiting asked me to disable it</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>The ad-blocking software was causing display i...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>I wanted to support the website I was visiting...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>The website I was visiting forced me to disabl...</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>I wanted to view a specific advertisement</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>The website I was visiting has interesting ads</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
AdBlocker_Reasons.to_sql(name='adblocker_reasons', con=engine, if_exists='append', index=False)
```


```python
##################### 30. "AdBlocker_Reasons_Respondents" Table ###################################
```


```python
# Map AdBlockerReasons_id
AdBlockerReasons_id_list = [AdBlocker_Reasons.adblocker_reason_id[AdBlocker_Reasons.adblocker_reason == i].values[0] for i in df27.adblocker_reason]

# Add AdBlockerReasons_id to the main dataframe
df27.insert(114, 'adblocker_reason_id', AdBlockerReasons_id_list)
df27.head()

# Create a dataframe with unique Respondent_id and AdBlockerReasons_id
AdBlocker_Reasons_Respondents=df27[['respondent_id', 'adblocker_reason_id']]. drop_duplicates()
AdBlocker_Reasons_Respondents.head()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>adblocker_reason_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
AdBlocker_Reasons_Respondents.to_sql(name='adblocker_reasons_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 31. "Ads_Actions" Table ###################################
```


```python
# Split AdActions and expand row-wise. Store in a temporary dataframe
temp_AdsActionsTypes_df = df.AdsActions.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_AdsActionsTypes_df.index = temp_AdsActionsTypes_df.index.droplevel(-1)
# Name of new column
temp_AdsActionsTypes_df.name = 'ads_action'
# Delete the original AdsActions columns, no longer necessary
del df['AdsActions']
# Join the original dataframe with the temporary AdActions
df29 = df.join(temp_AdsActionsTypes_df)
df29.head(10)

# replace missing values in AdActions with string "No answer"
df29['ads_action'] = df29['ads_action'].fillna('No answer')
df29['ads_action'].isna().sum()

# Create a dataframe with unique AdActions
Ads_Actions = pd.DataFrame(df29.ads_action.unique(), columns=['ads_action'])
# Add incrementing integers for ads_action_id
Ads_Actions.insert(0, 'ads_action_id', range(1, 1 + len(Ads_Actions)))
Ads_Actions
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ads_action_id</th>
      <th>ads_action</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Saw an online advertisement and then researche...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Stopped going to a website because of their ad...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Clicked on an online advertisement</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Paid to access a website advertisement-free</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Ads_Actions.to_sql(name='ads_actions', con=engine, if_exists='append', index=False)
```


```python
##################### 32. "Ads_Actions_Respondents" Table ###################################
```


```python
# Map AdActions_id
AdActions_id_list = [Ads_Actions.ads_action_id[Ads_Actions.ads_action == i].values[0] for i in df29.ads_action]

# Add AdBlockerReasons_id to the main dataframe
df29.insert(113, 'ads_action_id', AdActions_id_list)
df29.head()


# Create a dataframe with unique Respondent_id and ads_action_id
Ads_Actions_Respondents=df29[['respondent_id', 'ads_action_id']]. drop_duplicates()
Ads_Actions_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>ads_action_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Ads_Actions_Respondents.to_sql(name='ads_actions_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 33. "Ergonomic_Devices" Table ###################################
```


```python
# Split ErgonomicDevices and expand row-wise. Store in a temporary dataframe
temp_ErgonomicDevicesTypes_df = df.ErgonomicDevices.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_ErgonomicDevicesTypes_df.index = temp_ErgonomicDevicesTypes_df.index.droplevel(-1)
# Name of new column
temp_ErgonomicDevicesTypes_df.name = 'ergonomic_device'
# Delete the original ErgonomicDevices columns, no longer necessary
del df['ErgonomicDevices']
# Join the original dataframe with the temporary ErgonomicDevices
df31 = df.join(temp_ErgonomicDevicesTypes_df)
df31.head(10)

# replace missing values in ErgonomicDevices with string "No answer"
df31['ergonomic_device'] = df31['ergonomic_device'].fillna('No answer')
df31['ergonomic_device'].isna().sum()

# Create a dataframe with unique ErgonomicDevices
Ergonomic_Devices = pd.DataFrame(df31.ergonomic_device.unique(), columns=['ergonomic_device'])
# Add incrementing integers for ergonomic_device_idIDE_id
Ergonomic_Devices.insert(0, 'ergonomic_device_id', range(1, 1 + len(Ergonomic_Devices)))
Ergonomic_Devices
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ergonomic_device_id</th>
      <th>ergonomic_device</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Standing desk</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>Ergonomic keyboard or mouse</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Fatigue-relieving floor mat</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Wrist/hand supports or braces</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Ergonomic_Devices.to_sql(name='ergonomic_devices', con=engine, if_exists='append', index=False)
```


```python
##################### 34. "Ergonomic_Devices_Respondents" Table ###################################
```


```python
# Map ErgonomicDevices_id
ErgonomicDevices_id_list = [Ergonomic_Devices.ergonomic_device_id[Ergonomic_Devices.ergonomic_device == i].values[0] for i in df31.ergonomic_device]

# Add AdBlockerReasons_id to the main dataframe
df31.insert(112, 'ergonomic_device_id', ErgonomicDevices_id_list)
df31.head()

# Create a dataframe with unique Respondent_id and ergonomic_device_id
Ergonomic_Devices_Respondents=df31[['respondent_id', 'ergonomic_device_id']]. drop_duplicates()
Ergonomic_Devices_Respondents.head()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>ergonomic_device_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Ergonomic_Devices_Respondents.to_sql(name='ergonomic_devices_respondents', con=engine, if_exists='append', index=False)


```


```python
##################### 35. "Genders" Table ###################################
```


```python
# Split Gender and expand row-wise. Store in a temporary dataframe
temp_GenderTypes_df = df.Gender.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_GenderTypes_df.index = temp_GenderTypes_df.index.droplevel(-1)
# Name of new column
temp_GenderTypes_df.name = 'gender'
# Delete the original Gender columns, no longer necessary
del df['Gender']
# Join the original dataframe with the temporary Gender
df33 = df.join(temp_GenderTypes_df)
df33.head(10)

# replace missing values in Gender with string "No answer"
df33['gender'] = df33['gender'].fillna('No answer')
df33['gender'].isna().sum()

# Create a dataframe with unique Gender
Genders = pd.DataFrame(df33.gender.unique(), columns=['gender'])
# Add incrementing integers for Gender_id
Genders.insert(0, 'gender_id', range(1, 1 + len(Genders)))
Genders
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>gender_id</th>
      <th>gender</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Male</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Female</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Transgender</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Non-binary, genderqueer, or gender non-conforming</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Genders.to_sql(name='genders', con=engine, if_exists='append', index=False)
```


```python
##################### 36. "Genders_Respondents" Table ###################################
```


```python
# Map Gender_id
Gender_id_list = [Genders.gender_id[Genders.gender == i].values[0] for i in df33.gender]

# Add AdBlockerReasons_id to the main dataframe
df33.insert(111, 'gender_id', Gender_id_list)
df33.head()

# Create a dataframe with unique Respondent_id and Gender_id
Genders_Respondents=df33[['respondent_id', 'gender_id']]. drop_duplicates()
Genders_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>gender_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Genders_Respondents.to_sql(name='genders_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 37. "Sexual_Orientations" Table ###################################
```


```python
# Split SexualOrientation and expand row-wise. Store in a temporary dataframe
temp_SexualOrientationTypes_df = df.SexualOrientation.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_SexualOrientationTypes_df.index = temp_SexualOrientationTypes_df.index.droplevel(-1)
# Name of new column
temp_SexualOrientationTypes_df.name = 'sexual_orientation'
# Delete the original ErgonomicDevices columns, no longer necessary
del df['SexualOrientation']
# Join the original dataframe with the temporary genres 
df35 = df.join(temp_SexualOrientationTypes_df)
df35.head(10)

# replace missing values in SexualOrientation with string "No answer"
df35['sexual_orientation'] = df35['sexual_orientation'].fillna('No answer')
df35['sexual_orientation'].isna().sum()

# Create a dataframe with unique SexualOrientation
Sexual_Orientations = pd.DataFrame(df35.sexual_orientation.unique(), columns=['sexual_orientation'])
# Add incrementing integers for SexualOrientation_id
Sexual_Orientations.insert(0, 'sexual_orientation_id', range(1, 1 + len(Sexual_Orientations)))
Sexual_Orientations
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sexual_orientation_id</th>
      <th>sexual_orientation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Straight or heterosexual</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>Bisexual or Queer</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Asexual</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>Gay or Lesbian</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Sexual_Orientations.to_sql(name='sexual_orientations', con=engine, if_exists='append', index=False)
```


```python
##################### 38. "Sexual_Orientations_Respondents" Table ###################################
```


```python
# Map SexualOrientation_id
SexualOrientation_id_list = [Sexual_Orientations.sexual_orientation_id[Sexual_Orientations.sexual_orientation == i].values[0] for i in df35.sexual_orientation]

# Add AdBlockerReasons_id to the main dataframe
df35.insert(110, 'sexual_orientation_id', SexualOrientation_id_list)
df35.head()

# Create a dataframe with unique Respondent_id and SexualOrientation_id
Sexual_Orientations_Respondents=df35[['respondent_id', 'sexual_orientation_id']]. drop_duplicates()
Sexual_Orientations_Respondents.head()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>sexual_orientation_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Sexual_Orientations_Respondents.to_sql(name='sexual_orientations_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 39. "Race_Ethnicities" Table ###################################
```


```python
# Split RaceEthnicity and expand row-wise. Store in a temporary dataframe
temp_RaceEthnicityTypes_df = df.RaceEthnicity.str.split(';').apply(pd.Series, 1).stack()
# Drop index level to match main dataframe
temp_RaceEthnicityTypes_df.index = temp_RaceEthnicityTypes_df.index.droplevel(-1)
# Name of new column
temp_RaceEthnicityTypes_df.name = 'race_ethnicity'
# Delete the original RaceEthnicity columns, no longer necessary
del df['RaceEthnicity']
# Join the original dataframe with the temporary genres 
df37 = df.join(temp_RaceEthnicityTypes_df)
df37.head(10)

# replace missing values in RaceEthnicity with string "No answer"
df37['race_ethnicity'] = df37['race_ethnicity'].fillna('No answer')
df37['race_ethnicity'].isna().sum()

# Create a dataframe with unique RaceEthnicity
Race_Ethnicities = pd.DataFrame(df37.race_ethnicity.unique(), columns=['race_ethnicity'])
# Add incrementing integers for RaceEthnicity_id
Race_Ethnicities.insert(0, 'race_ethnicity_id', range(1, 1 + len(Race_Ethnicities)))
Race_Ethnicities
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>race_ethnicity_id</th>
      <th>race_ethnicity</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Black or of African descent</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>White or of European descent</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>No answer</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>Hispanic or Latino/Latina</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>East Asian</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>Middle Eastern</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>Native American, Pacific Islander, or Indigeno...</td>
    </tr>
    <tr>
      <th>7</th>
      <td>8</td>
      <td>South Asian</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Race_Ethnicities.to_sql(name='race_ethnicities', con=engine, if_exists='append', index=False)
```


```python
##################### 40. "Race_Ethnicities_Respondents" Table ###################################
```


```python
# Map RaceEthnicity_id
RaceEthnicity_id_list = [Race_Ethnicities.race_ethnicity_id[Race_Ethnicities.race_ethnicity == i].values[0] for i in df37.race_ethnicity]

# Add AdBlockerReasons_id to the main dataframe
df37.insert(109, 'race_ethnicity_id', RaceEthnicity_id_list)
df37.head()

# Create a dataframe with unique Respondent_id and RaceEthnicity_id
Race_Ethnicities_Respondents=df37[['respondent_id', 'race_ethnicity_id']]. drop_duplicates()
Race_Ethnicities_Respondents.head()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>race_ethnicity_id</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  data to the database
Race_Ethnicities_Respondents.to_sql(name='race_ethnicities_respondents', con=engine, if_exists='append', index=False)
```


```python
##################### 41. "Ads_Attributes" Table and 42."Ads_Attributes_Rank_Respondents" ###################################
```


```python
# Split Adspriorities and expand row-wise. Store in a temporary dataframe
temp_AdsAttributes_df = df[["respondent_id", "AdsPriorities1", "AdsPriorities2", "AdsPriorities3", "AdsPriorities4", "AdsPriorities5", "AdsPriorities6", "AdsPriorities7"]]
temp_AdsAttributes_df.columns = ['respondent_id',"ads_relevance", "ads_honesty", "ads_useful_info", "ads_trustworthy", "ads_company_like", "ads_special_offers", "ads_clear_language"]
temp_AdsAttributes_df = temp_AdsAttributes_df.set_index("respondent_id").stack().reset_index()
#rename the column
temp_AdsAttributes_df = temp_AdsAttributes_df.rename(columns={"level_1": "ads_attribute",0:"rank" })

```


```python
# Create a dataframe with unique Ads_Attributes
Ads_Attributes = pd.DataFrame(temp_AdsAttributes_df.ads_attribute.unique(), columns=['ads_attribute'])
# Add incrementing integers for SexualOrientation_id
Ads_Attributes.insert(0, 'ads_attribute_id', range(1, 1 + len(Ads_Attributes)))
Ads_Attributes
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ads_attribute_id</th>
      <th>ads_attribute</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>ads_relevance</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>ads_honesty</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>ads_useful_info</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>ads_trustworthy</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>ads_company_like</td>
    </tr>
    <tr>
      <th>5</th>
      <td>6</td>
      <td>ads_special_offers</td>
    </tr>
    <tr>
      <th>6</th>
      <td>7</td>
      <td>ads_clear_language</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  Ads_Attributes table data to the database
Ads_Attributes.to_sql(name='ads_attributes', con=engine, if_exists='append', index=False)

```


```python
# Replace the "ads_attribute" column with "ads_attribute_id" column in "ads_attributes_rank_respondents" Table
ads_attributes_list = [Ads_Attributes.ads_attribute_id[Ads_Attributes.ads_attribute == i].values[0] for i in temp_AdsAttributes_df.ads_attribute]
Ads_Attributes_Rank_Respondents=temp_AdsAttributes_df.insert(1, 'ads_attribute_id', ads_attributes_list)
del Ads_Attributes_Rank_Respondents['ads_attribute']
Ads_Attributes_Rank_Respondents.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>respondent_id</th>
      <th>ads_attribute_id</th>
      <th>rank</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>2</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>3</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>4</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>5</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
# load  Ads_Priorities_Respondents table data to the database
Ads_Priorities_Respondents.to_sql(name='ads_priorities_respondents', con=engine, if_exists='append', index=False)
```
