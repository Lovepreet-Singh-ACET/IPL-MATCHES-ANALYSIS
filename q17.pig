--  Display the number of sixes scored by a player in his ipl career.

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

p = FILTER deliveries by EqualsIgnoreCase(batsman,'$name')  and batsman_runs==6;

g = group p by batsman;

x = foreach g generate group, 'SCORED', COUNT(p), 'Six in his IPL career';

dump x
