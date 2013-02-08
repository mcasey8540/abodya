class PropertiesController < ApplicationController

	def index
		@districts = Property.all.uniq	
	end

end