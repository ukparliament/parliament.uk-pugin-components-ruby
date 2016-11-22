module Pugin
  module ApplicationHelper
    def render_if_exists(name, return_value = false)
        name.nil? || name == "" ? false
                                : return_value == true ? name : true
    end
  end
end
