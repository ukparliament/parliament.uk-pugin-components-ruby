module Pugin
  module Helpers
    # A set of controller methods that can be used to enable and disable Pugin features
    #
    # @since 0.7.0
    module ControllerHelpers
      def enable_status_banner
        Pugin::Feature.enable('StatusBanner')
      end

      def disable_status_banner
        Pugin::Feature.disable('StatusBanner')
      end

      def enable_global_search
        Pugin::Feature.enable('GlobalSearch')
      end

      def disable_global_search
        Pugin::Feature.disable('GlobalSearch')
      end

      def enable_asset_overrides
        Pugin::Feature.enable('AssetOverrides')
      end

      def disable_asset_overrides
        Pugin::Feature.disable('AssetOverrides')
      end

      def enable_pingdom
        Pugin::Feature.enable('Pingdom')
      end

      def disable_pingdom
        Pugin::Feature.disable('Pingdom')
      end

      # This will reset the built in Bandiera feature cache for Pugin.
      #
      # Use this when you want to get the latest flag values from Bandiera.
      #
      # If you don't reset the values will persist across page loads.
      def reset_bandiera_features
        Pugin::Feature::Bandiera.reset
      end
    end
  end
end
