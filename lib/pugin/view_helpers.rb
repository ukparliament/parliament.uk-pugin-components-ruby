module Pugin
  module ViewHelpers
    def navigation_link(route_symbol:, route_args:, letter:)
      url = send(route_symbol, *route_args, letter) unless route_args.empty?
      url = send(route_symbol, letter) unless url
      return link_to(letter, url, data: { 'atoz-see': 'true' })
    end

    def opengraph_image_standards
      { width: '400', height: '400', twitter_card: 'summary', url: "#{STATIC_ASSET_PUBLIC_LOCATION_URL}/opengraph-oblong.png" }
    end

    def opengraph_image
      image_hash = if @image && @image.respond_to?('graph_id')
                     {url: "#{ENV['IMAGE_SERVICE_URL']}/#{@image.graph_id}.jpeg?crop=CU_1:1&width=400&quality=100"}
                   elsif @person && @person.respond_to?('image_id') && @person.image_id != 'placeholder' && !@image
                     {url: "#{ENV['IMAGE_SERVICE_URL']}/#{@person.image_id}.jpeg?crop=CU_1:1&width=400&quality=100"}
                   else
                     {width: '1200', height: '630', twitter_card: 'summary_large_image' }
                   end

      opengraph_image_standards.merge(image_hash)
    end
  end
end
