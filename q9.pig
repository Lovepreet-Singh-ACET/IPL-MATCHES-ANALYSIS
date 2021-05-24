-- 4: Display the number times a team won the toss and choose to bat first in descending order.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

match_bat = FILTER match by toss_decision=='bat';

match_group = GROUP match_bat by toss_winner;

count_toss_winner = FOREACH match_group GENERATE group, COUNT(match_bat) as batting_count:long;

desc_order = order count_toss_winner by batting_count DESC;

dump desc_order
