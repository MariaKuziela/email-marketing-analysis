--- Ile emaili zostało wysłanych w każdym typie kampanii?

SELECT Email_Campaign_Type type, count(Email_ID) as count_email_sent
FROM email_campaigns ec
group by Email_Campaign_Type;



--- Która pora wysyłki ma najwyższy udział emaili z pozytywnym wynikiem?
SELECT 
    Time_Email_sent_Category AS campaign_time,
    COUNT(Email_ID) AS total_emails,
    SUM(CASE WHEN Email_Status = 1 THEN 1 ELSE 0 END) AS positive_reactions,
    ROUND(SUM(CASE WHEN Email_Status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(Email_ID), 2) AS success_rate
FROM email_campaigns
WHERE Email_Status IN (0, 1)
GROUP BY Time_Email_sent_Category;


--- Czy długość emaila (Word_Count) ma związek z sukcesem? P

SELECT
    Email_Status, AVG(Word_count) AS "avg_word"
FROM email_campaigns
WHERE Email_Status IN (0, 1)
GROUP BY Email_Status;


--- Która lokalizacja klientów (Customer_Location) ma najwyższy success rate?
SELECT
    Customer_Location,
    COUNT(Email_ID) AS total_emails,
    SUM(CASE WHEN Email_Status = 1 THEN 1 ELSE 0 END) AS positive_reactions,
    ROUND(SUM(CASE WHEN Email_Status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(Email_ID), 2) AS success_rate
FROM email_campaigns
WHERE Email_Status IN (0, 1)
GROUP BY Customer_Location ;


--- Czy liczba linków w emailu (Total_Links) wpływa na success rate?


SELECT
    COUNT(Email_ID) AS total_emails
    SUM(CASE WHEN Email_Status = 1 THEN 1 ELSE 0 END) AS positive_reactions,
    CASE
        WHEN TOTAL_LINKS IS NULL OR TOTAL_LINKS = 0 OR TOTAL_LINKS = ' ' THEN "0_LINKS"
        WHEN TOTAL_LINKS >= 6 THEN ">6_LINKS"
        ELSE "1-5_LINKS"
    END AS "GROUPED_LINKS",
    ROUND(SUM(CASE WHEN Email_Status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(TOTAL_LINKS), 2) AS success_rate
FROM email_campaigns
WHERE Email_Status IN (0, 1)
GROUP BY GROUPED_LINKS;
