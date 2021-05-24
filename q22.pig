-- Display who is the best wicket keeper of all time in IPL along with the number of stumps.

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

a = filter deliveries by UPPER(dismissal_kind) == 'STUMPED';

b = group a by filder;

c = foreach b generate group, COUNT(a.dismissal_kind) as no_of_stumps:long;

d = order c by no_of_stumps DESC;

e = limit d 1;

dump e
