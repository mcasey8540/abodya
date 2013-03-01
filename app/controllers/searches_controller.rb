class SearchesController < ApplicationController

  before_filter :authenticate_user! #, except: [:index, :show]

  respond_to :html, :js

	def new
  	@search = Search.new
  end

  def create
    @user = current_user
    @search = @user.searches.create!(params[:search])
    if @search.save
      redirect_to(@search)
    end
  end

  def show
    @search = Search.find(params[:id])
  end

  def index
    @user = current_user
    @user_searches = @user.searches.order('created_at DESC')
  end

end
