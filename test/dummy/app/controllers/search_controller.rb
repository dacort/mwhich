class SearchController < ApplicationController
  def index
    
  end
  
  def results
    m = MWhich::Client.new(:services => [:amazon, :itunes], :ecs_credentials => ECS_CREDENTIALS) #Amazon won't work without credentials. See ECS initializer.
    @results = m.search(params[:query])
  end
end
