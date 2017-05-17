module Pugin
	module ViewHelpers
		def navigation_link(route_symbol:, letter:, primary_id: nil, secondary_id: nil)
			url = send(route_symbol, primary_id, secondary_id, letter) if primary_id && secondary_id
			url = send(route_symbol, primary_id, letter) if primary_id && secondary_id.nil?
			url = send(route_symbol, letter) unless url

			return link_to(letter, url, data: { 'atoz-see': 'true' })
		end
	end
	module Feature
		module Status_banner
			class << self
				def enable
				  true
				end
				def disable
					false
				end
			end
		end
		module Top_navigation
			class << self
				def enable
					true
				end
				def disable
					false
				end
			end
		end
		module Bandiera
			class << self
				def dissolution?
					get_features

					@features['show-dissolution']
				end
				def register_to_vote?
					get_features

					@features['show-register']
				end

				# Reset cached features
				def reset_features
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