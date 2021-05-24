-- Display top ? players with most number of sixes scored.

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

p = FILTER deliveries by batsman_runs==6;

g = group p by batsman;

f = foreach g generate group, COUNT(p.batsman_runs) as No_of_sixes;

l = order f by No_of_sixes desc;

t = limit l $n;

dump t
