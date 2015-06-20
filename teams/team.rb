module Teams
	class Team
		attr_reader :name, :abbreviation, :score

		def initialize(attrs)
			@city					= attrs[:city] || ''
			@nickname 		= attrs[:nickname] || ''
			@abbreviation = attrs[:abbreviation] || 'NIL'
			@score 				= attrs[:score] || 0
		end
	end
end
