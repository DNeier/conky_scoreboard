require_relative '../scrapers/nba_scraper.rb'
require_relative 'scoreboard.rb'

module Scoreboards
	class NbaScoreboard < Scoreboard
		
		private
		
		def output_filepath
			"#{ENV['HOME']}/.scoreboard_files/nba_scoreboard"
		end		

		def parser
			@parser ||= Scrapers::NbaScraper.new(@teams)
		end

		def single_game(game)
			home_team = game.home_team
			away_team = game.away_team

			" #{away_team.abbreviation} #{away_team.score} - #{home_team.score} #{home_team.abbreviation} #{game.game_state} "
		end

		def team_games
			return @team_games unless @team_games.nil?

			@team_games = parser.get_games_for_teams || {}
		end
	end
end
