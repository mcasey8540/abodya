class PropertiesController < ApplicationController

	def index
		@assessment_count = Assessment.count
		@search = Search.new
	end

end