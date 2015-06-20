require '/home/derrick/apps/scoreboard_app/scoreboards/mlb_scoreboard.rb'
require '/home/derrick/apps/scoreboard_app/scoreboards/nba_scoreboard.rb'

mlb_teams = ['det','chc']

mlb_scoreboard = Scoreboards::MlbScoreboard.new(mlb_teams)

mlb_scoreboard.output_for_conky

#nba_scoreboard = Scoreboards::NbaScoreboard.new([])

#nba_scoreboard.output_for_conky
