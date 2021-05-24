-- Rank top ? batsman according to total runs scored by them and also show their total runs, number of times they got out,  batting avg.

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

a = group deliveries by batsman;

b = foreach a generate group, SUM(deliveries.batsman_runs) as total_runs;

c = filter deliveries by player_dismissed is not null;

d = group c by player_dismissed;

e = foreach d generate group, COUNT(c.player_dismissed) as no_of_time_dismissed;

joined_data = join b by group, e by group;

f = foreach joined_data generate b::group,b::total_runs, e::no_of_time_dismissed, (float)b::total_runs/e::no_of_time_dismissed as batting_avg;

g = order f by total_runs desc;

h = limit g $n;

i = rank h by total_runs desc DENSE;

dump i
