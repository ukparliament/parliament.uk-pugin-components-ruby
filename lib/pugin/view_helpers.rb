module Pugin
	module ViewHelpers
		def navigation_link(route_symbol:, letter:, primary_id: nil, secondary_id: nil)
			url = send(route_symbol, primary_id, secondary_id, letter) if primary_id && secondary_id
			url = send(route_symbol, primary_id, letter) if primary_id && secondary_id.nil?
			url = send(route_symbol, letter) unless url

			return link_to(letter, url, data: { 'atoz-see': 'true' })
		end
	end
end