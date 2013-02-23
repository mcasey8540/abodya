class SearchesController < ApplicationController

	def new
  	@search = Search.new
    puts params
  end

  def create

    @search = Search.create(params[:search])

  	if @search.save
      redirect_to @search
    else 
      flash[:notice] = @search.errors.empty? ? "Error" : @search.errors.full_messages.to_sentence
      redirect_to new_search_path
    end
  end

  def show
    @search = Search.find(params[:id])
  end


end
