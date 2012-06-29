class SearchesController < ApplicationController

  def index
  end
  def show
    search = SimpleTwitter::Search.new
    @tweets = search.search(params[:q])
  end
end
