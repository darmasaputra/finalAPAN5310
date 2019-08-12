------------- JavaScript Course Target Customers' attitudes towards Online Ads ---------------------------------------
---------------------------------------------------------------------------------------------------------------------
--- ads_valuable ----
SELECT foo.ads_valuable,COUNT(foo.ads_valuable)
FROM (SELECT ri.respondent_id, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
       FROM respondents_info ri
       NATURAL JOIN respondents_behaviours_attitudes rba
       NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.ads_valuable IS NOT NULL
GROUP BY foo.ads_valuable;

--- age v.s. ads_valuable ----
SELECT foo.age, foo.ads_valuable,COUNT(foo.ads_valuable)
FROM (SELECT ri.respondent_id, ri.age, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
       FROM respondents_info ri
       NATURAL JOIN respondents_behaviours_attitudes rba
       NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.age IS NOT NULL
AND foo.ads_valuable IS NOT NULL
GROUP BY foo.age, foo.ads_valuable;

--- ads_enjoy ----
SELECT foo.ads_enjoy,COUNT(foo.ads_enjoy)
FROM (SELECT ri.respondent_id, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
       FROM respondents_info ri
       NATURAL JOIN respondents_behaviours_attitudes rba
       NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.ads_enjoy IS NOT NULL
GROUP BY foo.ads_enjoy;

--- age v.s. ads_enjoy ----
SELECT foo.age, foo.ads_enjoy,COUNT(foo.ads_enjoy)
FROM (SELECT ri.respondent_id, ri.age, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
FROM respondents_info ri
NATURAL JOIN respondents_behaviours_attitudes rba
NATURAL JOIN languages_desire_next_year_respondents ld) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.age IS NOT NULL
AND foo.ads_enjoy IS NOT NULL
GROUP BY foo.age, foo.ads_enjoy;

--- ads_dislike ----
SELECT foo.ads_dislike,COUNT(foo.ads_dislike)
FROM (SELECT ri.respondent_id, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
       FROM respondents_info ri
       NATURAL JOIN respondents_behaviours_attitudes rba
       NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.ads_dislike IS NOT NULL
GROUP BY foo.ads_dislike;

--- age v.s. ads_dislike ----
SELECT foo.age, foo.ads_dislike, COUNT(foo.ads_dislike)
FROM (SELECT ri.respondent_id, ri.age, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
FROM respondents_info ri
NATURAL JOIN respondents_behaviours_attitudes rba
NATURAL JOIN languages_desire_next_year_respondents ld) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.age IS NOT NULL
AND foo.ads_dislike IS NOT NULL
GROUP BY foo.age, foo.ads_dislike;

------------- JavaScript Course Target Customers' Ad Blocking Behaviors and Reasons ---------------------------------------
---------------------------------------------------------------------------------------------------------------------
--- adblocker ----
SELECT foo.adblocker, COUNT(foo.adblocker)
FROM (SELECT ri.respondent_id, ri.age, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
FROM respondents_info ri
NATURAL JOIN respondents_behaviours_attitudes rba
NATURAL JOIN languages_desire_next_year_respondents ld) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.adblocker IS NOT NULL
GROUP BY foo.adblocker;

--- Will the result vary for different age groups? -------
--- age v.s. adblocker ----
SELECT foo.age, foo.adblocker, COUNT(foo.adblocker)
FROM (SELECT ri.respondent_id, ri.age, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
FROM respondents_info ri
NATURAL JOIN respondents_behaviours_attitudes rba
NATURAL JOIN languages_desire_next_year_respondents ld) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.age IS NOT NULL
AND foo.adblocker IS NOT NULL
GROUP BY foo.age, foo.adblocker;

--- adblocker_disable ----
SELECT foo.adblocker_disable, COUNT(foo.adblocker_disable)
FROM (SELECT ri.respondent_id, ri.age, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
FROM respondents_info ri
NATURAL JOIN respondents_behaviours_attitudes rba
NATURAL JOIN languages_desire_next_year_respondents ld) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.adblocker_disable IS NOT NULL
GROUP BY foo.adblocker_disable;

--- Will the result vary for different age groups? -------
--- age v.s. adblocker_disable ----
SELECT foo.age, foo.adblocker_disable, COUNT(foo.adblocker_disable)
FROM (SELECT ri.respondent_id, ri.age, rba.adblocker,rba.adblocker_disable,rba.ads_valuable,rba.ads_enjoy,rba.ads_dislike,
rba.wake_time, rba.hours_computer,rba.hours_outside,rba.skip_meals,rba.exercise, ld.language_id_desire_next_year
       FROM respondents_info ri
       NATURAL JOIN respondents_behaviours_attitudes rba
       NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l
ON l.language_id = foo.language_id_desire_next_year
WHERE l.language = 'JavaScript'
AND foo.age IS NOT NULL
AND foo.adblocker_disable IS NOT NULL
GROUP BY foo.age, foo.adblocker_disable;


--- join "respondents_info", "languages_desire_next_year_respondents", "languages", "adblocker_reasons_respondents","adblocker_reasons"
--- and only keep variables related to age, adblocker_reason, languages
--- and then keep whose who desired to learn JavaScript
--- exclude those have no answers for age or adblocker_reason
--- adblocker_reason 
SELECT ar.adblocker_reason,COUNT(ar.adblocker_reason)
FROM (SELECT ri.respondent_id, ri.age, ld.language_id_desire_next_year
        FROM respondents_info ri
        NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l ON l.language_id = foo.language_id_desire_next_year
NATURAL JOIN adblocker_reasons_respondents arr
NATURAL JOIN adblocker_reasons ar
WHERE l.language = 'JavaScript'
AND ar.adblocker_reason !~ 'No answer'
GROUP BY ar.adblocker_reason;

--- Will the result vary for different age groups? -------
--- age v.s. adblocker_reason
SELECT foo.age, ar.adblocker_reason,COUNT(ar.adblocker_reason)
FROM (SELECT ri.respondent_id, ri.age, ld.language_id_desire_next_year
        FROM respondents_info ri
        NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l ON l.language_id = foo.language_id_desire_next_year
NATURAL JOIN adblocker_reasons_respondents arr
NATURAL JOIN adblocker_reasons ar
WHERE l.language = 'JavaScript'
AND foo.age IS NOT NULL
AND ar.adblocker_reason !~ 'No answer'
GROUP BY foo.age, ar.adblocker_reason;

------------- JavaScript Course Target Customers' ads_actions ---------------------------------------
---------------------------------------------------------------------------------------------------------------------
--- For “JavaScript” course target customers, what are their recent actions on online Ads? -------
--- join "respondents_info", "languages_desire_next_year_respondents", "languages", "ads_actions_respondents","ads_actions"
--- and only keep variables related to age, ads_actions, languages
--- and then keep whose who desired to learn JavaScript
--- exclude those have no answers for age or ads_actions
--- ads_action

SELECT aa.ads_action, COUNT(aa.ads_action)
FROM (SELECT ri.respondent_id, ri.age, ld.language_id_desire_next_year
        FROM respondents_info ri
        NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l ON l.language_id = foo.language_id_desire_next_year
NATURAL JOIN ads_actions_respondents aar
NATURAL JOIN ads_actions aa
WHERE l.language = 'JavaScript'
AND aa.ads_action !~ 'No answer'
GROUP BY aa.ads_action;

--- Will the result vary for different age groups? -------
--- age v.s. ads_action
SELECT foo.age, aa.ads_action,COUNT(aa.ads_action)
FROM (SELECT ri.respondent_id, ri.age, ld.language_id_desire_next_year
        FROM respondents_info ri
        NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l ON l.language_id = foo.language_id_desire_next_year
NATURAL JOIN ads_actions_respondents aar
NATURAL JOIN ads_actions aa
WHERE l.language = 'JavaScript'
AND foo.age IS NOT NULL
AND aa.ads_action !~ 'No answer'
GROUP BY foo.age, aa.ads_action;

------------- JavaScript Course Target Customers' ads_priorities ---------------------------------------
---------------------------------------------------------------------------------------------------------------------
--- For “JavaScript” course target customers, how different ads attributes matter for them? -------
--- join "respondents_info", "languages_desire_next_year_respondents", "languages", "ads_priorities"
--- and only keep variables related to age, ads_priorities, languages
--- and then keep whose who desired to learn JavaScript
--- exclude those have no answers for age or ads_priorities
SELECT ap.ads_priority, AVG(ap.rank) AS avg_rank
FROM (SELECT ri.respondent_id, ri.age, ld.language_id_desire_next_year
        FROM respondents_info ri
        NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l ON l.language_id = foo.language_id_desire_next_year
NATURAL JOIN ads_priorities ap
WHERE l.language = 'JavaScript'
GROUP BY ap.ads_priority;

--- Will the result vary for different age groups? -------
--- age v.s. ads_priorities
SELECT foo.age, ap.ads_priority, AVG(ap.rank) AS avg_rank
FROM (SELECT ri.respondent_id, ri.age, ld.language_id_desire_next_year
        FROM respondents_info ri
        NATURAL JOIN languages_desire_next_year_respondents ld
	 ) AS foo 
JOIN languages l ON l.language_id = foo.language_id_desire_next_year
NATURAL JOIN ads_priorities ap
WHERE l.language = 'JavaScript'
AND foo.age IS NOT NULL
GROUP BY foo.age, ap.ads_priority;


