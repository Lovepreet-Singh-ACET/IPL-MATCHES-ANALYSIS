-- In April 2011 Display the date of matches and the name of opponent teams that were won by Rajasthan Royals.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:datetime, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

p = filter match by GetMonth(date)==4 and GetYear(date)==2011 and winner is not null and EqualsIgnoreCase(winner, 'rajasthan royals');

l = foreach p generate date, team1,team2,winner;

dump l
