-- 3: List the names of winning teams in matches where Duckworth Lewis Rule was applied and also show the match date.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

dl_rule = FILTER match BY dl_applied==1;

team_date = FOREACH dl_rule GENERATE winner, '--', date;

dump team_date
