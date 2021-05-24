-- Display the  matches in which MS DHONI was titled " player of the match " and the toss decison was " fielding " and his team won that match.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

t = FILTER match by LOWER(player_of_match)=='ms dhoni' and LOWER(toss_winner)=='chennai super kings' and LOWER(toss_decision)=='field' and LOWER(winner)=='chennai super kings';

p = FOREACH t GENERATE id, date, UPPER(winner), UPPER(player_of_match), UCFIRST(toss_decision);

dump p
