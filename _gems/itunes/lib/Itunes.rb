require 'net/http'
require 'yajl'

class Itunes
  def self.search(title, type="movie")

    result = {}

    endpoint = "http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStoreServices.woa/wa/wsSearch"

    url = "#{endpoint}?term=#{URI::escape(title)}&media=#{type}"
    response = Net::HTTP.get_response(URI.parse(url))
    data = Yajl::Parser.parse(response.body)

    result['count'] = data['results'].length
    result['results'] = []

    data['results'].each_with_index do |r, index|
      result['results'] << {
        'name' => r['trackName'],
        'media_type' => type,
        'purchase_option' => 'rent', # change this
        'price' => r['trackPrice'],
        'artwork_url' => r['artworkUrl60'],
        'release_date' => r['releaseDate']
      }
    end

    result
  end
end