module Pugin
	module PuginBandieraClient
		BANDIERA_CLIENT = ::Bandiera::Client.new(ENV['BANDIERA_URL'].dup)
	end
end