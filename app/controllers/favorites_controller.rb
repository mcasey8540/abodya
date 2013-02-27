class FavoritesController < ApplicationController

	respond_to :html, :js

	def new
		@favorite = Favorite.new
		puts params[:assessment_id]
	end

	def create
		@user = current_user
		@favorite = @user.favorites.create!(assessment_id: params[:assessment_id])
		respond_to do |format|
			format.html {redirect_to search_url}
			format.js
		end
	end

	def index
		@user = current_user
		@favorites = @user.favorites.order('created_at desc')
	end

end