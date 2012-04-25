class SearchController < ApplicationController
  def index
    
  end
  
  def results
    m = MWhich::Client.new(:services => [:itunes]) #Amazon won't work without credentials
    @results = m.search(params[:query])
  end
end
