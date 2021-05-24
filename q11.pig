-- In a season display the count of MAN OF MATCH award won by players in each team.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

match_year = FILTER match by season==$season;

grop_ = group match_year by winner;

count_ = foreach grop_ generate group, COUNT(match_year.player_of_match);

dump count_

