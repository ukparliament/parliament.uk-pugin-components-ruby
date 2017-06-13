module Pugin
    module ViewHelpers
        def navigation_link(route_symbol:, route_args:, letter:)
            url = send(route_symbol, *route_args, letter) unless route_args.empty?
            url = send(route_symbol, letter) unless url

            return link_to(letter, url, data: { 'atoz-see': 'true' })
        end

        def get_image
            if Pugin::Feature::Bandiera.show_list_images?
                if @image
                    return image_tag("#{@image.image_id}")
                else
                    return image_tag("https://s3-eu-west-1.amazonaws.com/web1devci.pugin-website/images/uk_parliament_placeholder_list_image.png")
                end
            end
        end
    end
end
