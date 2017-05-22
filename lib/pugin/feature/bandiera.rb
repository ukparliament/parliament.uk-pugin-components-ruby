module Pugin
	module Feature
		module Bandiera
			class << self
				def dissolution?
					get_features

					@features.fetch('show-dissolution', false)
				end
				def register_to_vote?
					get_features

					@features.fetch('show-register', false)
				end

				# Reset cached features
				def reset
					@features = nil
				end

				private

				# Get features if not already cached
				def get_features
					@features ||= Pugin::BANDIERA_CLIENT.get_features_for_group('parliament')
				end
			end
		end
	end 
end