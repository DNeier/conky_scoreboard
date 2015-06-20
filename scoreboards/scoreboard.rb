module Scoreboards
	class Scoreboard

		def initialize(teams)
			@teams = teams || []
		end

		def show_games
			game_array = []

			team_games.each do |game|
				game_array << single_game(game)
			end

			game_array.join('|')
		end

		def output_for_conky
			File.open(output_filepath, 'w'){|file| file.write(show_games)}	
		end

		private
	
		def output_filepath
			raise 'must be implemented by child class'
		end

		def parser
			raise 'must be implemented by child class'
		end

		def single_game(game)
			raise 'must be implemented by child class'
		end

		def team_games
			raise 'must be implemented by child class'
		end
	end
end
