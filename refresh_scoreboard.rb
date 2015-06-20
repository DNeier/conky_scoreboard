require_relative 'scoreboards/mlb_scoreboard.rb'
require_relative 'scoreboards/nba_scoreboard.rb'

mlb_teams = ['det','chc']

mlb_scoreboard = Scoreboards::MlbScoreboard.new(mlb_teams)

mlb_scoreboard.output_for_conky

#nba_scoreboard = Scoreboards::NbaScoreboard.new([])

#nba_scoreboard.output_for_conky
