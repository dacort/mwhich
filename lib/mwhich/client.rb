module MWhich
  class Client
    
    VALID_SERVICES = [:amazon,:hulu,:itunes,:netflix]
    SERVICE_MAP = {
      :amazon => MWhich::Services::Amazon,
      :hulu => MWhich::Services::Hulu,
      :itunes => MWhich::Services::ITunes,
      :netflix => MWhich::Services::Netflix
    }
    
    attr_accessor :services
    
    # Arguments (all are optional):
    # - :services        - One or more of :amazon, :netflix, :hulu, or :itunes. Default is :all
    def initialize(options={})
      self.services = options[:services] || VALID_SERVICES
    end
    
    # Search for a movie/tv show by title
    def search(title)
      results = {}
      self.services.each do |service|
        s = SERVICE_MAP[service].new
        results[service] = s.search(title)
      end
      
      results
    end
  end
end