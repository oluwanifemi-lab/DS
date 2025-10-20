use Larana_Basketball
select*from game_info;
select*from player_stats;
select*from team_stats;

--Inner Join "Join" = Innerr Join
select gi.*, ts.*
from game_info gi
join team_stats ts
on gi.game_id=ts.game_id;

--Left and Right Join
select pl.*,tm.*
from player_stats pl 
left join team_stats tm
on pl.game_id = tm.game_id;

-- Outer Join 
select pl.*,tm.*
from player_stats pl 
full outer join team_stats tm
on pl.game_id = tm.game_id;

-- Player name, Team and Season for all games participated 
select pl.player, pl.team, gi.season
from player_stats pl
join game_info gi
on pl.game_id = gi.game_id
where gi.season = 2223;

-- Top 10, player names, season, sum points
select Top 10 pl.player, sum(pl.pts) as Total_points
from player_stats pl
join game_info gi
on pl.game_id = gi.game_id
where gi.season = 2122
group by pl.player
order by Total_points desc;

select*from game_info;
select*from player_stats;
select*from team_stats;


-- Get the top 5 teams with the highest number of 3 points in the 16/17 season
select Top 5 ts.team, sum(ts._3P) as Three_point_number
from team_stats ts
join game_info gi
on ts.game_id = gi.game_id
where gi.season = 1617
group by ts.team
order by Three_point_number desc;

-- highest three points per season
select gi.season, ts.team, sum(ts._3P) as Three_point_number
from team_stats ts
join game_info gi
on ts.game_id = gi.game_id
group by ts.team, season
order by season, Three_point_number desc;

-- Three table Joins
select gi.season, pl.player, ts.team
from game_info gi
join player_stats pl
on gi.game_id=pl.game_id
join team_stats ts
on pl.game_id=ts.game_id;

-- String Functions
select top 5 upper(player) from player_stats;

select top 5 left(player, 6) from player_stats;

select top 5 right(player, 6) from player_stats;

select top 5 lower(player) from player_stats;

select*from game_info;
select*from player_stats;
select*from team_stats;

-- Concatenation
select concat(player, team) from player_stats;
select concat(player,' (', team, ')') from player_stats;
select concat(home_team, ' VS ', away_team) Games,concat (home_score, '-', away_score) Scores, season Season, date Date
from game_info

--Show the number of points made by each team and attach the number of three points made in 22/23 season
select ts.team, concat(sum(home_score), ' | ', sum(_3p)) Three_Point_Comparison
from team_stats ts
join game_info gi
on ts.game_id=gi.game_id
where season = 2223
group by ts.team
order by sum(home_score) desc;

-- Date Function
select GETDATE();

-- Datename 
select DATENAME(month, DATEADD(year,2,date))
from game_info

-- DateAdd
select DATEADD(year,2,date), date
from game_info

-- DateDiff
select DATEDIFF(MONTH,2005-05-16, GETDATE())
from game_info;

select*from game_info;
select*from player_stats;
select*from team_stats;

select team, player 
from player_stats;


select CONCAT(home_team, ' V ', away_team)Game, home_team Home, away_team Away,
CONCAT(DATENAME(month, DATEADD(day,7,date)),' ', DATENAME(day, DATEADD(day,7,date)), ', ', 
DATENAME(year, DATEADD(day,7,date))
) Next_Game_Review_Date
from game_info
where season = 2223;

select CONCAT(home_team, ' V ', away_team)Game, date
from game_info
where season =2223;

--  TSS Class Query
--select team, sum(pts) Total_point
--from team_info tm join game g
--on tm.game_id = g.game_id
--where season = 2122 and team in 
--(select top 5 pl.team
--from Player_stats pl 
--join game g on pl.game_id = g.game_id
--where season = 2122
--group by pl.player, pl.team
--having sum(pl.pts) > 300
--order by sum(pl.pts) desc)
--group by team
--order by Total_point desc;

--Categorize players based on total points
 --scored in a game as:
 --“Star Player” if ? 30 points
 --“Contributor” if between 10 and 29 points
 --“Bench” if < 10 points

 select  player,team, CONCAT(home_team, ' V ', away_team)Game, pts Total_Points,    
 case
 when pts >=  30
 then 'Star Player'
 when pts between 10 and 29
 then 'Contributor'
 else 'Bench'
 end as Performance
 from player_stats p
 join game_info g
 on p.game_id = g.game_id;

 
select*from game_info;
select*from player_stats;
select*from team_stats;
