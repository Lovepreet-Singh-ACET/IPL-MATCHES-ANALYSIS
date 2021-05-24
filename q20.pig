-- Display the name of winning teams which have ensured win by more than 90 runs and having 'ER' in their names along with date of match and venue.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

p = filter match by win_by_runs > 90 and UPPER(winner) matches '.*ER.*';

t = foreach p generate winner, win_by_runs, venue, city,date;

dump t
