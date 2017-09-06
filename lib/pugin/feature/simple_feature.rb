module Pugin
	module Feature
		class SimpleFeature
			class << self
				attr_reader :enabled

				@enabled = false

				def enable
					@enabled = true
				end

				def disable
					@enabled = false
				end

				def enabled?
					@enabled
				end

				def disabled?
					!@enabled
				end
			end
		end
	end
end
