-- Display the matches which resulted in a TIE in IPL season 2013

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

matches_2011 = filter match by season==2013 and result=='tie';

data = foreach matches_2011 generate team1, team2, UPPER(result), date;

dump data

