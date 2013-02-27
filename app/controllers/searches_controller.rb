class SearchesController < ApplicationController

  before_filter :authenticate_user! #, except: [:index, :show]

  respond_to :html, :js

	def new
  	@search = Search.new
  end

  def create
    @search = Search.create!(params[:search])
    redirect_to(@search)
  end

  def show
    @search = Search.find(params[:id])
  end

  def index
    
  end

end
