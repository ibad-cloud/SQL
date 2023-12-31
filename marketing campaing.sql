--1. How many transactions were completed during each marketing campaign?
select * from marketing_campaigns;
select * from transactions;
select * from sustainable_clothing;
select count(transaction_id) from transactions where purchase_date between '2023-06-01' and '2023-06-30';
select count(transaction_id) from transactions where purchase_date between '2023-07-15' and '2023-08-15';
select count(transaction_id) from transactions where purchase_date between '2023-08-20' and '2023-09-15';
 SELECT
    mc.start_date,
    mc.end_date,
    COUNT(t.purchase_date) AS transactions_completed
FROM
    marketing_campaigns mc
JOIN
    transactions t
ON
    t.purchase_date BETWEEN mc.start_date AND mc.end_date
GROUP BY
    mc.start_date, mc.end_date
ORDER BY
    mc.start_date;

--2. Which product had the highest sales quantity?
select * from marketing_campaigns;
select * from transactions;
select * from sustainable_clothing;
select 
		product_id , 
		sum(quantity) as total_quantity_by_products
from 
		transactions 
group by 
		product_id 
order by 
		total_quantity_by_products asc;

--3. What is the total revenue generated from each marketing campaign?
 select * from marketing_campaigns;
 select * from transactions;
 select * from sustainable_clothing;
 with year_rev as(
 select product_id,
 quantity,month(purchase_date) as months
 from transactions
 where month(purchase_date)= 6)
 select sustainable_clothing.product_name,sum(sustainable_clothing.price * quantity) 
 from year_rev
 join sustainable_clothing on product_id=sustainable_clothing.product_id

WITH year_rev AS (
    SELECT product_id, quantity, MONTH(purchase_date) AS month
    FROM transactions
    WHERE MONTH(purchase_date) = 6
)
SELECT sustainable_clothing.product_name, 
       SUM(sustainable_clothing.price * year_rev.quantity) AS total_revenue
FROM year_rev
JOIN sustainable_clothing ON year_rev.product_id = sustainable_clothing.product_id
GROUP BY sustainable_clothing.product_name;




select 
	ROUND(sum(sustainable_clothing.price),2)
from 
	sustainable_clothing 
join 
	transactions on
transactions.product_id=sustainable_clothing.product_id ;
SELECT
	sum(sustainable_clothing.price),
    marketing_campaigns.start_date,
    marketing_campaigns.end_date,
    COUNT(transactions.purchase_date) AS transactions_completed
FROM
    marketing_campaigns 
JOIN
    transactions 
ON
    transactions.purchase_date BETWEEN marketing_campaigns.start_date AND marketing_campaigns.end_date
join
	sustainable_clothing
on
	sustainable_clothing.product_id=transactions.product_id
GROUP BY
    marketing_campaigns.start_date, marketing_campaigns.end_date
ORDER BY
    marketing_campaigns.start_date;


	select * from transactions;

--4. What is the top-selling product category based on the total revenue generated?
select * from transactions;
select * from sustainable_clothing;
select * from marketing_campaigns;
select sustainable_clothing.category,SUM(sustainable_clothing.price) as totals from sustainable_clothing 
join transactions on sustainable_clothing.product_id=transactions.product_id
group by 
sustainable_clothing.category
order by totals desc;




--5. Which products had a higher quantity sold compared to the average quantity sold?




--6. What is the average revenue generated per day during the marketing campaigns?
--7. What is the percentage contribution of each product to the total revenue?
--8. Compare the average quantity sold during marketing campaigns to outside the marketing campaigns
--9. Compare the revenue generated by products inside the marketing campaigns to outside the campaigns
--10. Rank the products by their average daily quantity sold




