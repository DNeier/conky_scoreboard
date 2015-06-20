require 'open-uri'
require 'json'
require_relative '../games/game.rb'
require_relative '../teams/team.rb'

module Scrapers
	class Scraper
	  
		def initialize(teams = [])
			@teams = teams
		end
	
		def get_games_for_teams
			team_games = []
			(games || []).each do |game|
				if @teams.empty? || is_team_game?(game)
					team_games << Games::Game.new({
						home_team: get_home_team(game),
						away_team: get_away_team(game),
						game_state: get_game_state(game)
					})	
				end
			end
			
			team_games
		end

		def get_games
			games
		end

		private

		def current_date
	    @current_date ||= Time.now.strftime("%Y-%m-%d")
    end

    def current_day
      @current_day ||= current_date.split('-')[2]
    end

    def current_month
      @current_month ||= current_date.split('-')[1]
    end

		def current_year
      @current_year ||= current_date.split('-')[0]
    end

		def formatted_url
			raise 'Must be implemented in child class'
		end

		def games
			raise 'Must be implemented in child class'
		end

		def get_abbreviation(game, is_home = false)
			raise 'Must be implemented in child class'
		end

		def get_away_team(game)
			get_game(game)
		end
	
		def get_city(game, is_home = false)
			raise 'Must be implemented in child class'
		end

		def get_game(game, is_home = false)
			Teams::Team.new({
				city:get_city(game, is_home),
				nickname: get_nickname(game, is_home),
				abbreviation: get_abbreviation(game, is_home),
				score: get_score(game, is_home)
			})
		end

		def get_game_state(game)
			raise 'Must be implemented in child class'
		end

		def get_home_team(game)
			get_game(game, true)
		end

		def get_nickname(game, is_home = false)
			raise 'Must be implemented in child class'
		end

		def get_score(game, is_home = false)
			raise 'Must be implemented in child class'
		end

		def is_team_game?(game)
			@teams.include?(get_abbreviation(game, true).downcase) || @teams.include?(get_abbreviation(game).downcase)
		end

		def parsed_data
      return @parsed_data unless @parsed_data.nil?

      file = open(formatted_url)
      file_data = file.read

      @parsed_data = JSON.parse(file_data)
    end
	end
end
