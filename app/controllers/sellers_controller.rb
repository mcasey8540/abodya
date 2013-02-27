class SellersController < ApplicationController

	def new
		@states = State.all.map(&:name)
		respond_to do |format|
			format.json
			format.html
		end
	end

end