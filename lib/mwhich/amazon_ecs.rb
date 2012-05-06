module MWhich
  module Services
    class AmazonEcs
      def initialize(options={})
        Amazon::Ecs.options = {
          :associate_tag => options[:ecs_credentials][:associate_tag],
          :AWS_access_key_id => options[:ecs_credentials][:AWS_access_key_id],       
          :AWS_secret_key => options[:ecs_credentials][:AWS_secret_key]
        }
      end

      def search(title, media="DVD")        
        result = {}
        data = request(title, media)

        result['count'] = data.items.size
        result['results'] = []

        data.items.each do |item|
          result['results'] << {
            'name' => item.get('ItemAttributes/Title'),
            'media_type' => item.get('ItemAttributes/Binding'),
            'purchase_option' => 'buy', # change this
            'price' => item.get('ItemAttributes/ListPrice/FormattedPrice'),
            'artwork_url' => item.get('MediumImage/URL'),
            'release_date' => item.get('ItemAttributes/ReleaseDate'),
            'url' => item.get('DetailPageURL')
          }
        end

        result
      end

      protected

        def request(title, media="DVD")
          return Amazon::Ecs.item_search(title, { :response_group => 'Medium', :sort => 'relevancerank', :search_index => media })
        end
    end
  end
end