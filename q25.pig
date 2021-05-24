-- Display the name of team which played best in power play over(i.e initial 6 overs) for all seasons.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

deliveries = LOAD '/PigProject/deliveries.csv' using PigStorage(',') as (match_id:int, inning:int, batting_team:chararray, bowling_team:chararray, over:int, ball:int, batsman:chararray, non_striker:chararray, bowler:chararray, is_super_over:int, wide_runs:int, bye_runs:int, legbye_runs:int, no_ball_runs:int, penalty_runs:int, batsman_runs:int, extra_runs:int, total_runs:int, player_dismissed:chararray, dismissal_kind:chararray, filder:chararray);

data_powerplay_overs = filter deliveries by over < 7;

joined_data = join match by id,  data_powerplay_overs by match_id;

required_data = foreach joined_data generate match::season, data_powerplay_overs::batting_team, data_powerplay_overs::total_runs;

season_group = group required_data  by (match::season, data_powerplay_overs::batting_team);

data = foreach season_group generate FLATTEN(group), SUM(required_data.data_powerplay_overs::total_runs) as total_runs:long;

split data into s1 if group::match::season==2008, s2 if group::match::season==2009, s3 if group::match::season==2010, s4 if group::match::season==2011, s5 if group::match::season==2012, s6 if group::match::season==2013, s7 if group::match::season==2014, s8 if group::match::season==2015, s9 if group::match::season==2016, s10 otherwise;

o1 = order s1 by total_runs DESC;
o2 = order s2 by total_runs DESC;
o3 = order s3 by total_runs DESC;
o4 = order s4 by total_runs DESC;
o5 = order s5 by total_runs DESC;
o6 = order s6 by total_runs DESC;
o7 = order s7 by total_runs DESC;
o8 = order s8 by total_runs DESC;
o9 = order s9 by total_runs DESC;


l1 = limit o1 1;
l2 = limit o2 1;
l3 = limit o3 1;
l4 = limit o4 1;
l5 = limit o5 1;
l6 = limit o6 1;
l7 = limit o7 1;
l8 = limit o8 1;
l9 = limit o9 1;

final_data = UNION l1, l2, l3, l4, l5, l6, l7, l8, l9;

final_order = order final_data by group::match::season;

dump final_order;
