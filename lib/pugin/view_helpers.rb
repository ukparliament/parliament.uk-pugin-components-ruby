module Pugin
	module ViewHelpers
		def navigation_link(route_symbol:, route_args:, letter:)
			url = send(route_symbol, *route_args, letter) unless route_args.empty?
			url = send(route_symbol, letter) unless url

			return link_to(letter, url, data: { 'atoz-see': 'true' })
		end
	end
end
