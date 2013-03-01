class FavoritesController < ApplicationController

	def new
		@favorite = Favorite.new
		puts params[:assessment_id]
	end

	def create
		@user = current_user
		@favorite = @user.favorites.create!(assessment_id: params[:assessment_id])
	end

	def index
		@user = current_user
		@favorites = @user.favorites.order('created_at desc')
	end

	def destroy
		@favorite = Favorite.find(params[:id])
		Favorite.destroy(params[:id])
	end

end