class PropertiesController < ApplicationController

	def index
		@property_count = Property.count
	end

end