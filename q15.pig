-- Display the top 3 Venues on the basis of total number of matches held over there.

match = LOAD '/PigProject/matches_final.csv' using PigStorage(',') AS (id:int, season:int, city:chararray, date:chararray, team1:chararray, team2:chararray, toss_winner:chararray, toss_decision:chararray, result:chararray, dl_applied:int, winner:chararray, win_by_runs:int, win_by_wickets:int, player_of_match:chararray, venue:chararray, umpire1:chararray, umpire2:chararray, umpire3:chararray);

venues = group match by venue;

count_venues = foreach venues{
ven = match.venue;
generate group, COUNT(ven) as ven_count:long;
};

order_ven = order count_venues by ven_count desc;

top3 = LIMIT order_ven 3;

dump top3
