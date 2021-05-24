-- Rank the STRAIGHT UMPIRE(1st Umpire) according to the number of matches.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

umpire_1 = group match by umpire1;

count_ump = foreach umpire_1 generate group,  COUNT(match.umpire1);

rank_ump = RANK count_ump by $1 desc DENSE;

dump rank_ump
