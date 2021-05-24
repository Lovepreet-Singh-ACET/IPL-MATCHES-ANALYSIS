-- Display the name of bowlers along with the number of wide balls deliverd by them in the range of 50 to 100(excluding 100) in ascending order of wide balls.

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

a = filter deliveries by wide_runs!=0;

b = group a by bowler;

c = foreach b generate group, COUNT(a.wide_runs) as wide_balls:long;

d = filter c by wide_balls >= 50 and wide_balls < 100;

e = order d by wide_balls ASC;

dump e
