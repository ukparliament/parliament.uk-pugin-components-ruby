module Pugin
  module ApplicationHelper
    def render_if_exists(name, return_value = false)
        name.nil? || name == "" ? false
                                : return_value == true ? name : true
    end

    def is_link?(description, link_address)
      return link_address.nil? ? '<p>' + description + '</p>' : '<a href="' + link_address + '" target="_blank">' + description + "</a>"
    end
  end
end
