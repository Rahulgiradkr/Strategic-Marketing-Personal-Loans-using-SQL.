create database Loan;
use loan;
select * from liability;

#Module 3
#Task 1: Quantifying Progress.
#In our quest for data-driven decisions, we embark on an assessment of our transformed dataset. By counting the number of records in 'liability,' we quantify the extent of our data transformation efforts. This task measures our success in streamlining and refining the data, providing an essential metric to gauge our progress. It is a vital step in ensuring the reliability and effectiveness of our data-driven decision-making journey.
select * from liability;

#Task 2: Seeking Average Income.
#In our data-driven journey, we are now focused on understanding the financial landscape. By executing the SQL query, we seek to calculate the average income of the customers from the 'liability' dataset. This task is pivotal as it provides a key metric for assessing the economic profiles of our customer base. The average income serves as a compass, guiding us in tailoring marketing strategies, personalized messaging, and financial product offerings. Ultimately, this data-driven decision aids in ensuring that our strategies resonate with the financial realities of our customers, driving success in personal loan conversion and revenue growth.
SELECT AVG(Income) AS AverageIncome 
FROM liability;

#Task 3: Identifying High-Potential Customers.
#In our relentless pursuit of data-driven excellence, we turn our focus to identifying high-potential customers. By executing this SQL query, we retrieve the top 10 customers with the highest income from the 'liability' dataset. This task is paramount because it allows us to pinpoint individuals with significant financial capacity. These customers represent a prime target for personalized marketing and personal loan conversion efforts. The insights gained from this analysis are instrumental in optimizing campaigns to attract and retain these high-value customers, ultimately driving revenue growth and banking success.
SELECT * FROM liability 
ORDER BY Income DESC
LIMIT 10;

#Task 4: Uncovering Educational Financial Trends.
#In our quest for data-driven insights, we now explore the intersection of education and income. By executing this SQL query, we calculate the average income for customers within different education levels using the 'liability' dataset. This task is of paramount importance as it reveals financial trends and disparities among various education categories. It equips us with crucial knowledge to fine-tune marketing strategies and personalized messaging that resonates with the unique financial needs of each group. This data-driven approach paves the way for enhanced personal loan conversion strategies, empowering the bank to cater effectively to diverse customer segments and drive revenue growth.
SELECT Education, AVG(Income) FROM liability
GROUP BY Education;

#Task 5: Top Income Earners by Education.
#In our data-driven quest, we delve into a deep exploration of financial excellence and education. Through this SQL query, we create a ranked dataset that identifies the top two income earners within each education level category from the 'liability' dataset. This task is of immense significance as it uncovers the brightest financial stars within distinct education groups. The insights extracted here are invaluable for crafting tailored marketing strategies and personalized messaging. By recognizing and nurturing these high-earning individuals, we empower the bank to foster customer loyalty, stimulate personal loan conversion, and drive remarkable revenue growth.
WITH RankedData AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY Education ORDER BY Income DESC) AS IncomeRank
    FROM liability
)
SELECT * FROM RankedData WHERE IncomeRank <= 2;

#Task 6: Profiling Customer Demographics.
#In our data-driven journey, we're shifting the spotlight to customer age demographics. Through this SQL query, we categorize customers into distinct age groups and count their representation within each group using the 'liability' dataset. This task is pivotal as it offers a granular view of the customer base, helping to craft personalized marketing strategies and pinpoint specific segments for personal loan conversion efforts. By understanding the unique characteristics of each age group, the bank can tailor its approach, ensuring that every customer, whether aged 18-30, 31-45, 46-60, or 61+, receives targeted and effective messaging. This data-driven approach promises to enhance customer engagement and drive revenue growth.
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN Age BETWEEN 31 AND 45 THEN '31-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '61+'
    END AS AgeGroup,
    COUNT(*) AS RecordCount
FROM
    liability
GROUP BY
    AgeGroup;

#Task 7: Analyzing Age vs. Credit Card Spending.
#In our relentless pursuit of data-driven insights, we are now exploring the relationship between age and credit card spending. Through this SQL query, we calculate the average age of customers whose credit card spending (CCAvg) exceeds the overall average CCAvg within the 'liability' dataset. This task is essential as it helps us identify and understand customers who are above-average spenders. The insights garnered here provide a deeper understanding of the demographics of these high-CCAvg individuals. By tailoring marketing efforts and personalized messaging to this specific group, the bank can further enhance personal loan conversion strategies and revenue growth.
SELECT
    AVG(Age) AS AverageAge
FROM
    liability
WHERE
    CCAvg > (SELECT AVG(CCAvg) FROM liability);
    
#Task 8: Unveiling High-Income Elite.
#In our quest for data-driven excellence, we aim to unveil the high-income elite among our customers. By executing this SQL query, we extract customer records with incomes exceeding 1.5 times the average income within the 'liability' dataset. This task is crucial as it identifies the financially well-endowed individuals within our customer base. These high-income customers present a prime opportunity for personal loan conversion, as their financial capacity opens doors for higher-value financial products. By tailoring marketing strategies and personalized messaging to this elite group, the bank stands to maximize its revenue growth and foster lasting customer relationships.

SELECT *
FROM liability
WHERE Income > 1.5 * (SELECT AVG(Income) FROM liability);

#Task 9: Family Dynamics Analysis.
#In our data-driven journey, we're now delving into family dynamics and age. Through this SQL query, we determine the youngest family member within each family category from the 'liability' dataset. This task holds significance as it allows us to understand the distribution of age within different family structures. The insights gleaned here provide a nuanced view of customer demographics, which can be instrumental in tailoring marketing strategies and personalized messaging. By recognizing the dynamics of each family type and the age of the youngest member, the bank can create targeted campaigns that resonate with the unique needs and aspirations of these distinct groups. This data-driven approach promises to enhance customer engagement and drive revenue growth.
SELECT
    Family,
    MIN(Age) AS YoungestAge
FROM
    liability
GROUP BY
    Family;
#Task 10: Mortgage Holders.
#In our quest for data-driven insights, we're directing our attention to customers who hold mortgages. Through this SQL query, we retrieve customer records from the 'liability' dataset where the mortgage amount is greater than zero. This task is pivotal as it identifies customers who are indebted through mortgages, offering a specific demographic segment for in-depth analysis. Understanding the characteristics of these mortgage holders is crucial for tailoring marketing strategies, personalized messaging, and personal loan conversion efforts. By focusing on this customer group, the bank can provide solutions and financial products that address their unique needs, ultimately driving revenue growth and customer satisfaction.
SELECT *
FROM liability
WHERE Mortgage > 0;

#Task 11: Understanding Customer Distribution
#In our data-driven journey, we're shifting the spotlight to customer educational backgrounds. Through this SQL query, we categorize customers by their education levels and count their representation within each group using the 'liability' dataset. This task is pivotal as it provides an in-depth view of the educational diversity among the customer base. These insights enable the bank to create targeted marketing campaigns and personalized messaging that resonate with the unique financial needs and aspirations of each education category. Understanding the characteristics of each group empowers the bank to foster customer engagement and drive revenue growth through informed decision-making and tailored strategies.
SELECT
    Education,
    COUNT(*) AS CustomerCount
FROM
    liability
GROUP BY
    Education;