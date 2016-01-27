#! /usr/bin/env ruby

require 'score_scraper'

#mlb_teams = ['det','chc']

#mlb_scoreboard = ScoreScraper::Scoreboards::Mlb.new(Time.now.strftime('%Y-%m-%d'),mlb_teams)
#mlb_output_filepath = "/etc/conky_scoreboard.d/.scoreboard_files/mlb_scoreboard"

#File.open(mlb_output_filepath, 'w'){|file| file.write(mlb_scoreboard.games)}	

nba_scoreboard = ScoreScraper::Scoreboards::Nba.new
nba_output_filepath = "/etc/conky_scoreboard.d/.scoreboard_files/nba_scoreboard"

File.open(nba_output_filepath, 'w'){|file| file.write(nba_scoreboard.games)}	
