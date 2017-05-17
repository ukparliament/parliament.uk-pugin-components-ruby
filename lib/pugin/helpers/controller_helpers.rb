module Pugin
	module Helpers
		# A set of controller methods that can be used to enable and disable Pugin features
		#
		# @since 0.7.0
		module ControllerHelpers
			def enable_status_banner
				Pugin::Feature.enable('StatusBanner')
			end

			def disable_status_banner
				Pugin::Feature.disable('StatusBanner')
			end

			def enable_top_navigation
				Pugin::Feature.enable('TopNavigation')
			end

			def disable_top_navigation
				Pugin::Feature.disable('TopNavigation')
			end

			# This will reset the built in Bandiera feature cache for Pugin.
			#
			# Use this when you want to get the latest flag values from Bandiera.
			#
			# If you don't reset the values will persist across page loads.
			def reset_bandiera_features
				Pugin::Feature::Bandiera.reset
			end
		end
	end
end
