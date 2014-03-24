module Artsy
  module Client
    module API
      module Artwork
        include Artsy::Client::API::Parse

        # Retrieves an artwork.
        #
        # @return [Artsy::Client::Domain::Artwork]
        def artwork(id)
          object_from_response(self, Artsy::Client::Domain::Artwork, :get, artwork_path(id), {})
        end

        # Retrieves an artwork in text format.
        #
        # @return [String]
        def artwork_txt(id, options = {})
          request(:get, "#{artwork_path(id)}.txt", options)
        end

        # Create an artwork.
        #
        # @return [Artsy::Client::Domain::Artwork]
        def create_artwork(params = {})
          object_from_response(self, Artsy::Client::Domain::Artwork, :post, "/api/v1/artwork", params)
        end

        # Update an artwork.
        #
        # @return [Artsy::Client::Domain::Artwork]
        def update_artwork(id, params = {})
          object_from_response(self, Artsy::Client::Domain::Artwork, :put, artwork_path(id), params)
        end

        # Creates an inventory object for an artwork.
        #
        # @return [Artsy::Client::Domain::Inventory]
        def update_artwork_inventory(id, params = {})
          object_from_response(self, Artsy::Client::Domain::Inventory, :put, "/api/v1/artwork/#{id}/inventory", params)
        end

        private

        def artwork_path(id)
          "/api/v1/artwork/#{id}"
        end
      end
    end
  end
end
