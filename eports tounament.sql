CREATE TABLE Teams (
team_id INT PRIMARY KEY,
team_name VARCHAR(50) NOT NULL,
country VARCHAR(50),
captain_id INT
);
CREATE TABLE Players (
player_id INT PRIMARY KEY,
player_name VARCHAR(50) NOT NULL,
team_id INT,
role VARCHAR(50),
salary INT,
FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
CREATE TABLE Matches (
match_id INT PRIMARY KEY,
team1_id INT,
team2_id INT,
match_date DATE,
winner_id INT,
score_team1 INT,
score_team2 INT,
FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
FOREIGN KEY (team2_id) REFERENCES Teams(team_id),
FOREIGN KEY (winner_id) REFERENCES Teams(team_id)
);

--1. What are the names of the players whose salary is greater than 100,000?
select * from matches;
select * from players;
select * from teams;
select player_name,salary from players where salary>=100000;
--Q 2 What is the team name of the player with player_id = 3?
select * from matches;
select * from players;
select * from teams;
select teams.team_name from Teams join Players 
on players.team_id=teams.team_id where players.player_id=3;
-- 3. What is the total number of players in each team?
select * from matches;
select * from players;
select * from teams;
select distinct COUNT(player_id) from Players ;
select distinct COUNT(player_id),team_id from Players group by team_id;
--4. What is the team name and captain name of the team with team_id = 2?
select * from matches;
select * from players;
select * from teams;
select team_name,captain_id,country from teams where team_id=2;
--5. What are the player names and their roles in the team with team_id = 1?
select * from matches;
select * from players;
select * from teams;
select players.player_name,Players.role from players join Teams on Players.team_id=teams.team_id
where teams.team_id=1;
--6 What are the team names and the number of matches they have won?
select * from matches;
select * from teams;
select * from players;
select teams.team_name,count(matches.winner_id) from matches join teams on 
teams.team_id=matches.winner_id
group by teams.team_name;

--7. What is the average salary of players in the teams with country 'USA'?
select * from matches;
select * from teams;
select * from players;
select AVG(players.salary) as salary from Players join teams on players.team_id=teams.team_id
and teams.country='usa';

--8. Which team won the most matches?
select * from matches;
select * from teams;
select * from players;
select teams.team_name,COUNT(Matches.winner_id) as total_wins from teams join Matches on 
Teams.team_id=Matches.winner_id
group by teams.team_name
order by total_wins desc;

--9. What are the team names and the number of players in 
--each team whose salary is greater than 100,000?
select * from matches;
select * from teams;
select * from players;
select * from teams where exists(select teams.team_name from 
teams where players.team_id=teams.team_id)

select * from players where players.role not in ('mid laner','rifler');
select players.player_name,players.salary
from players 
where players.team_id in (select teams.team_id from Teams ) 
and players.salary>'100000';


--10. What is the date and the score of the match with match_id = 3?
select * from matches;
select * from teams;
select * from players;





