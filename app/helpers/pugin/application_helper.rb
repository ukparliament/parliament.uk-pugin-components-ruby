module Pugin
  module ApplicationHelper
    def render_if_exists(name, return_value = false)
        name.nil? || name == "" ? false
                                : return_value == true ? name : true
    end

    def is_link?(description, link_address)
      return link_address.nil? ? content_tag("p", description) : content_tag("a", description, {target: "_blank", href: link_address})
    end
  end
end
