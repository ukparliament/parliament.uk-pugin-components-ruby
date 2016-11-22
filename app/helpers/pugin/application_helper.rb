module Pugin
  module ApplicationHelper
    def render_if_exists(name, return_value = false)
        name.nil? || name == "" ? false
                                : return_value == true ? name : true
    end

    #def require_properties(*args)
    #    args.any? {|arg| arg.nil?} ? {file_name: File.basename(__FILE__),}
    #                               : true
    #end
  end
end
