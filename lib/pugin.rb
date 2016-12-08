Gem.loaded_specs['pugin'].dependencies.each do |d|
 require d.name
end

require "pugin/engine"

module Pugin
end
