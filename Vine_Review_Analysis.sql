SELECT * INTO vine_table_gte_20_votes 
FROM vine_table
WHERE total_votes >= 20 


SELECT * INTO vine_helpful_gte_50pct
FROM vine_table_gte_20_votes
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT)>=0.5 

SELECT *  INTO vine_no_member
FROM vine_helpful_gte_50pct
WHERE vine = 'N'


SELECT *  INTO vine_member
FROM vine_helpful_gte_50pct
WHERE vine = 'Y'



SELECT  Count(*) AS member_total_reviews, 
		SUM(CASE WHEN star_rating = 5 THEN 1 ELSE 0 END)AS member_five_star_reviews, 
		CAST(SUM(CASE WHEN star_rating = 5 THEN 1 ELSE 0 END) AS FLOAT)/Count(*) AS member_pct_five_star
		FROM vine_member
			 


SELECT  Count(*) AS no_member_total_reviews, 
		SUM(CASE WHEN star_rating = 5 THEN 1 ELSE 0 END)AS no_member_five_star_reviews, 
		CAST(SUM(CASE WHEN star_rating = 5 THEN 1 ELSE 0 END) AS FLOAT)/Count(*) AS no_member_pct_five_star
		FROM vine_no_member
		
		