-- Display top 10 players based on their strike rate. Display name, runs_scored, balls_faced, strike_rate.

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

batsman_group = group deliveries by batsman;

data = foreach batsman_group generate group, SUM(deliveries.batsman_runs) as runs_scored:long, COUNT(deliveries.ball) as balls_faced:long, ((float)SUM(deliveries.batsman_runs)/COUNT(deliveries.ball))*100 as strike_rate:float;

order_data = order data by runs_scored desc, strike_rate desc;

l = limit order_data 10;
rank_ = rank l by runs_scored desc, strike_rate desc DENSE;
dump rank_
