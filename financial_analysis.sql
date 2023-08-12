--1. What are the names of all the customers who live in New York?
select * from accounts;
select * from branches;
select * from customers;
select * from transactions;
select * from customers where city='new york';
--2. What is the total number of accounts in the Accounts table?
select * from accounts;
select * from branches;
select * from customers;
select * from transactions;
select COUNT(accounts.accountid) as total_accounts from accounts;
--3. What is the total balance of all checking accounts?
select * from accounts;
select * from branches;
select * from customers;
select * from transactions;
select accountid,SUM(balance) from accounts where accounttype='checking';


--4. What is the total balance of all accounts associated with customers who live in Los Angeles?

--5. Which branch has the highest average account balance?
--6. Which customer has the highest current balance in their accounts?
--7. Which customer has made the most transactions in the Transactions table?
--8.Which branch has the highest total balance across all of its accounts?
--9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
--10. Which branch has the highest number of transactions in the Transactions table?