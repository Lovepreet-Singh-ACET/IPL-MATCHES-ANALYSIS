-- In IPL season 2015 display the top 5 bolwers who performed good in the death overs(16-20), show the number of runs they got hit by , wickets taken by them and overs done by them.(order should be based on most wickets taken)

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

match_2015 = FILTER match by season==2015;

deliveries_D_O = filter deliveries by over > 15;

joined_data = join match_2015 by id, deliveries_D_O by match_id;

required_data = foreach joined_data generate match_2015::season, match_2015::team1, match_2015::team2, deliveries_D_O::over, deliveries_D_O::bowler, deliveries_D_O::total_runs, deliveries_D_O::player_dismissed;

bowlers = group required_data by deliveries_D_O::bowler;

data = foreach bowlers generate group, SUM(required_data.deliveries_D_O::total_runs) as total_runs_given:long, COUNT(required_data.deliveries_D_O::player_dismissed) as wickets_taken:long, (COUNT(required_data.deliveries_D_O::over)/6) as overs:long;

order_data = order data by wickets_taken desc;

top_5 = limit  order_data 5;

dump top_5
