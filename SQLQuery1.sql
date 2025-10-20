create database Larana_Basketball;
use Larana_Basketball;
-- Tables are called entities, Columns are called attributes
select*from game_info;
select*from player_stats;
select*from team_stats;
select player, team, MP, ast, pts from player_stats;
select top 5 player, team, MP, ast, pts from player_stats;

-- To get individual teamns in the NBA
select distinct team from player_stats;
select COUNT(game_id) Number_of_games from game_info;
select COUNT(distinct player) Number_of_Players from player_stats;

-- players from Dallas Mavs
select distinct player, team from player_stats where team = 'DAL';

select season, home_team, away_team, home_score, away_score
from game_info
where home_team like '%d_%';

select team,_3P,_3pa from team_stats
where _3pa >= 50
order by _3P desc;

-- ALl games where home team scored more than 20 points;
select home_team, home_score,away_team, away_score, result from game_info where home_score > 120;

select player, pts, team from player_stats where pts between 40 and 50 order by pts desc;

-- Get teams with turnovers between 15 and 25, ascending order.
select distinct team, tov from team_stats
where tov between 15 and 25
order by tov;

select home_team, home_score, away_team, away_score, home_score-away_score as win_loss_margin 
from game_info
where season = 2223;

--  Aggregation
select avg(pts) as Point_Average
from team_stats;

-- Group by and Having Clause
select home_team, sum(home_score) Total_home_points,sum(away_score) Total_away_point, season
from game_info
group by home_team, season
order by season, Total_home_points;

-- total points from each team
select team, ROUND(avg(pts), 0) Total_points
from team_stats
group by team
having avg(pts) >= 100
order by Total_points desc;

-- Games played for specific season (18/19)

select home_team, away_team, result
from game_info
where season = 1819
order by date;

--Find the team with the minimum field goal percentage (MIN(FGp)).
 select*from team_stats;
 select top 1 team, fgp
 from team_stats
where(FGp) > 0;

--Find all games played between 2018-01-01 and 2018-12-31.
select*from game_info
select date, home_team, away_team, result
from game_info
where date like '%2018_%'
order by date;

cast '1' and '0' as int
select sum(( as tots)
from game_info
group by home_team;

 
