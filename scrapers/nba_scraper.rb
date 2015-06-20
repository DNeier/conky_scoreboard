require_relative 'scraper.rb'

module Scrapers
	class NbaScraper < Scraper

		private
	
		def formatted_url
			@formatted_url ||= "http://data.nba.com/jsonp/5s/json/cms/noseason/scoreboard/#{current_year}#{current_month}#{current_day}/games.json" 
		end

		def games
			@games ||= parsed_data['sports_content']['games']['game']
		end

		def get_abbreviation(game, is_home = false)
			game["#{key_type(is_home)}"]['abbreviation']
		end

		def get_city(game, is_home = false)
			game["#{key_type(is_home)}"]['city']
		end

		def get_game_state(game)
			game_state = ''
			game_status = game['period_time']['period_status']

			if game_status.downcase == 'final'
				game_state = 'F'
			elsif game['period_time']['period_value'].to_i > 0
				game_state = "#{game['period_time']['period_value']}Q"
			else
				game_state = game_status
			end

			game_state
		end

		def get_nickname(game, is_home = false)
			game["#{key_type(is_home)}"]['nickname']
		end

		def get_score(game, is_home = false)
			game["#{key_type(is_home)}"]['score']
		end
		
		def key_type(is_home = false)
			is_home ? 'home' : 'visitor'
		end

		def parsed_data
			return @parsed_data unless @parsed_data.nil?

			file = open(formatted_url)
			file_data = file.read

			@parsed_data = JSON.parse(file_data[16...-2])
		end
	end
end
