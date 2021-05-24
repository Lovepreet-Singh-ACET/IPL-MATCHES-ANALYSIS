match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

sh echo "\n\n\n\n"

describe match;

sh echo "\n\n\n"

describe deliveries;

sh echo "\n\n\n\n"
