-- IN the month of May 2013 display the mathces that were played between " Chennai Super Kings " And " Mumbai Indians ".

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:datetime, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

p = filter match by GetYear(date)==2013 and GetMonth(date)==5 and ((LOWER(team1) == 'chennai super kings' and LOWER(team2)=='mumbai indians') or (LOWER(team2) == 'chennai super kings' and LOWER(team1)=='mumbai indians'));

t = foreach p generate id, team1, team2, date;
dump t
