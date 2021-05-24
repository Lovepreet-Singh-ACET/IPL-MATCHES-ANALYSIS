-- Display the top ? bowlers along with the number of wickets taken by them.

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

p = FILTER deliveries by dismissal_kind is not null and EqualsIgnoreCase(dismissal_kind,'bowled');

g = group p by bowler;

f = foreach g generate group, COUNT(p.dismissal_kind) as No_of_wickets;

l = order f by No_of_wickets desc;

t = limit l $n;

dump t
