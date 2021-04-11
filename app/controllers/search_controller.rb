class SearchController < ApplicationController
  def search
    @value = params[:value]
    @model = params[:model]
    @how = params[:how]
    if @model == "user"
      @datas = User.search_for(@how, @value)
    else
      @datas = Book.search_for(@how, @value)
    end
  end
end
