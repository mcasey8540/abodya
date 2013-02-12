class PropertiesController < ApplicationController

	def index
		@assessment_count = Assessment.count
	end

end