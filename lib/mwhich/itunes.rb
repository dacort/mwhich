module MWhich
  module Services
    class ITunes
      def initialize(options={})
        @endpoint = "http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStoreServices.woa/wa/wsSearch"
      end

      def search(title, media="movie")
        result = {}
        data = request(title, media)

        result['count'] = data['results'].length
        result['results'] = []

        data['results'].each_with_index do |r, index|
          result['results'] << {
            'name' => r['trackName'],
            'media_type' => media,
            'purchase_option' => 'rent', # change this
            'price' => r['trackPrice'],
            'artwork_url' => r['artworkUrl100'],
            'release_date' => r['releaseDate']
          }
        end

        result

      end

      protected

        def request(title, media="movie")
          # We'll do searches across both TV and movies and merge the results
          results = []

          url = "#{@endpoint}?term=#{URI::escape(title)}&media=#{media}"
          response = Net::HTTP.get_response(URI.parse(url))
          data = Yajl::Parser.parse(response.body)

          data
        end

    end
  end
end
