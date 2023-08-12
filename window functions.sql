CREATE TABLE student_score (
  student_id int PRIMARY KEY,
  student_name VARCHAR(30),
  dep_name VARCHAR(40),
  score INT
);

INSERT INTO student_score VALUES (11, 'Ibrahim', 'Computer Science', 80);
INSERT INTO student_score VALUES (7, 'Taiwo', 'Microbiology', 76);
INSERT INTO student_score VALUES (9, 'Nurain', 'Biochemistry', 80);
INSERT INTO student_score VALUES (8, 'Joel', 'Computer Science', 90);
INSERT INTO student_score VALUES (10, 'Mustapha', 'Industrial Chemistry', 78);
INSERT INTO student_score VALUES (5, 'Muritadoh', 'Biochemistry', 85);
INSERT INTO student_score VALUES (2, 'Yusuf', 'Biochemistry', 70);
INSERT INTO student_score VALUES (3, 'Habeebah', 'Microbiology', 80);
INSERT INTO student_score VALUES (1, 'Tomiwa', 'Microbiology', 65);
INSERT INTO student_score VALUES (4, 'Gbadebo', 'Computer Science', 80);
INSERT INTO student_score VALUES (12, 'Tolu', 'Computer Science', 67);


select * from student_score;
SELECT *, MAX(SCORE) OVER (PARTITION BY DEP_NAME) AS MAX_SCORE,
ROUND(AVG(SCORE) OVER (PARTITION BY DEP_NAME),2) AS AVGD
FROM STUDENT_SCORE;

SELECT *, ROW_NUMBER() OVER (PARTITION BY DEP_NAME ORDER BY DEP_NAME) FROM student_score;

SELECT *, ROW_NUMBER() OVER (ORDER BY STUDENT_NAME) AS ROWSS FROM student_score;

SELECT *, RANK() OVER (PARTITION BY DEP_NAME ORDER BY SCORE ASC) AS RANKS FROM student_score;

SELECT *, DENSE_RANK() OVER (PARTITION BY DEP_NAME ORDER BY SCORE DESC) AS DENSE FROM student_score;
--LAG is used to return the offset row before the current row 
--within a window. By default it returns the previous row before the current row.
--You typically use LAG when you want to compare the value of a previous row 
--with the current row. It's commonly applied in time-series analysis. For example:

SELECT *, LAG(SCORE) OVER ( ORDER BY DEP_NAME) AS LAGS FROM student_score;

SELECT * , SUM(SCORE) OVER (PARTITION BY DEP_NAME ORDER BY DEP_NAME
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS SUMSS
--DENSE_RANK() OVER (PARTITION BY DEP_NAME ORDER BY SCORE)
 FROM student_score;

 select student_name,dep_name,
 SUM(score) over (partition by dep_name 
 order by dep_name asc
 rows between 2 preceding and current row)
 from student_score;

-- SELECT city, date, temperature,
--    ROUND(AVG(temperature) OVER (
--      PARTITION BY city
--      ORDER BY date DESC
--      ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING), 1) mov_avg_3d_city
--FROM weather
--ORDER BY city, date;

SELECT social_network, date, new_subscribers,
    FIRST_VALUE(new_subscribers) OVER(
      PARTITION BY social_network
      ORDER BY date) AS first_day,
    LAST_VALUE(new_subscribers) OVER(
      PARTITION BY social_network
      ORDER BY date
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_day
FROM subscribers
ORDER BY social_network, date;







