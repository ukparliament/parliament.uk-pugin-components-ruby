require 'pugin/feature/simple_feature'
require 'pugin/feature/status_banner'
require 'pugin/feature/top_navigation'
require 'pugin/feature/pingdom_feature'
require 'pugin/feature/bandiera'

module Pugin
	module Feature
		def self.enable(feature)
			get_feature(feature)&.enable
		end

		def self.disable(feature)
			get_feature(feature)&.disable
		end

		private

		def self.get_feature(feature)
			# Does the feature passed exist?
			raise ArgumentError, "Feature #{feature} does not exist in Pugin. Please check your spelling and try again." unless constants.include?(feature.to_sym)

			Object.const_get("Pugin::Feature::#{feature}")
		end
	end
end
