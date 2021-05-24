-- Display the venues whose name startswith 'D'  and endswith 'M';

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

f = filter match by STARTSWITH(UPPER(venue), 'D') and ENDSWITH(UPPER(venue), 'M');

g = foreach f generate venue, city;

d = distinct g;

dump d
