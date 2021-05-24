import os
import subprocess as sp

menu = """
 1: Load matches dataset with a proper schema and dump it.
 2: Load deliveries dataset with the proper schema and dump it.
 3: Describe both datasets.
 4: Create a 10% sample of matches and store it in a Directory.
 5: Create a 1% sample of deliveries and store it into a Directory.
 6: Display all the participating teams in IPL Season-wise.
 7: Display the name of teams along with by how many runs they won in a match after losing the toss.
 8: List the names of winning teams in matches where the Duckworth 
    Lewis Rule was applied and also show the match date.
 9: Display the number times a team won the toss and choose to bat
    first in descending order.
10: Display the matches in which MS DHONI was titled " player of the match "
    and the toss decision was " fielding " and his team won that match.
11: In a season display the count of MAN OF MATCH award won by all 
    players in each team.
12: Rank the STRAIGHT UMPIRE(1st Umpire) according to the number of matches.
13: In April 2011 Display the date of matches and the name of opponent
    teams that were won by Rajasthan Royals.
14: In the month of May 2013 display the matches that were played between
    " Chennai Super Kings " And " Mumbai Indians ".
15: Display the top 3 Venues where most matches had been organized.
16: Display the matches which resulted in a TIE in IPL season 2013.
17: Display the number of sixes scored by a player in his IPL career.
18: Display top ‘?’ players with the most number of sixes scored.
    (  ‘?’  refers to the number of players you want to see )
19: Display the top  ‘?’  bowlers along with the number of wickets taken by them.
    ( ‘?’  refers to the number of bowlers you want to see)
20: Display the name of winning teams that have ensured win by more than 90 runs 
    and having 'ER' in their names along with the date of match and venue.
21: Display the name of bowlers along with the number of wide balls delivered by 
    them in the range of 50 to 100(excluding 100) in ascending order of wide balls.
22: Display who is the best wicket-keeper of all time in IPL along with 
    the number of stumps.
23: Rank top ‘?’ batsman according to total runs scored by them and also show their
    total runs, number of times they got out,  batting avg.
    (  ‘?’ refers to the number of records you want to see)
24: In IPL season 2015 display the top 5 bowlers who performed well in the death overs(16-20),
    show the number of runs they got hit by, wickets taken by them, and overs done by them. 
    (order should be based on most wickets taken).
25: Display the team names which played best in power-play over(i.e initial 6 overs) for all seasons.
26: Display top 10 players based on their total score and strike rate. 
    Display name, runs_scored, balls_faced, strike_rate.
27: Display the venues whose name starts with 'D'  and ends with 'M';
 0: EXIT
"""

sp.getoutput("start-dfs.sh")

while True:
    os.system("clear")
    print(menu)
    choice = input("ENTER YOUR CHOICE: ")
    if choice == "1":
        os.system("pig display_matches.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice == "2":
        os.system("pig display_deliveries.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice == "3":
        os.system("pig describe_data.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice == "4":
        d = input("\n\nEnter name for Directory to store sample data: ")
        os.system("pig -param dir={} sample_matches.pig".format(d))
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice == "5":
        d = input("\n\nEnter name for Directory to store sample data: ")
        os.system("pig -param dir={} sample_deliveries.pig".format(d))
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="6":
        os.system("pig q6.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="7":
        os.system("pig -param year=2012   q7.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="8":
        os.system("pig q8.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="9":
        os.system("pig q9.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="10":
        os.system("pig q10.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="11":
        season = int(input("Enter season:"))
        os.system("pig -param season={} q11.pig".format(season))
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="12":
        os.system("pig q12.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="13":
        os.system("pig q13.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="14":
        os.system("pig q14.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="15":
        os.system("pig q15.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="16":
        os.system("pig q16.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="17":
        n = input("Enter name:")
        os.system("pig -param name=\"\'{}\'\" q17.pig".format(n))
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="18":
        n = input("Enter how many records you want to see: ")
        os.system("pig -param n={} q18.pig".format(n))
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="19":
        n = input("Enter how many records you want to see: ")
        os.system("pig -param n={} q19.pig".format(n))
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="20":
        os.system("pig q20.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="21":
        os.system("pig q21.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="22":
        os.system("pig q22.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="23":
        n = input("Enter how many records you want to see: ")
        os.system("pig -param n={} q23.pig".format(n))
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="24":
        os.system("pig q24.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="25":
        os.system("pig q25.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="26":
        os.system("pig q26.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="27":
        os.system("pig q27.pig")
        input("\n\n\n\t\t\t\t\t\t\t\tPress Any Key to Continue.......")
        os.system("clear")
    elif choice=="0":
        input("Press any key to Exit.....")
        break
    else:
        input("Invalid Choice......")
