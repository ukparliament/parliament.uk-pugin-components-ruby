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

				def election?
					get_features
					@features.fetch('show-election', false)
				end

				def post_election?
					get_features
					@features.fetch('show-post-election', false)
				end

				def show_list_images?
					get_features
					@features.fetch('show-list-images', false)
				end

				def show_committees?
					get_features
					@features.fetch('show-committees', false)
				end

				def show_government_roles?
					get_features
					@features.fetch('show-government-roles', false)
				end

				def show_opposition_roles?
					get_features
					@features.fetch('show-opposition-roles', false)
				end

				def show_activity_links?
					get_features
					@features.fetch('show-activity-links', false)
				end

				def show_lords_ineligibility_banner?
					get_features
					@features.fetch('show-lords-ineligibility-banner', false)
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
