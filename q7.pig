-- 2: Display the name of teams along with by how many runs they won in a match after loosing the toss.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

matchWinner_notToss = FILTER match BY winner!=toss_winner and season==$year;

winner_with_winningRuns = FOREACH matchWinner_notToss GENERATE winner, ' WON BY ', win_by_runs,' RUNS FROM ', toss_winner; 

dump winner_with_winningRuns
