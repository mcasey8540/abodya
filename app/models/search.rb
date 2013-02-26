class Search < ActiveRecord::Base
  attr_accessible :state_id, :county_id, :city_code, :max_price, :max_taxes, :min_price, :min_sq_ft 
  validates :max_price, :min_price, :max_taxes, :min_sq_ft, presence: :true
  validates :max_price,:min_price,:min_sq_ft, :max_taxes, :numericality => {:only_integer => true}

 	def assessments
 		assessments = Assessment.where("state_id = ? AND county_id = ? AND city_code = ? AND assessed >= ? AND assessed <= ? AND square_feet >= ? AND taxes_one <= ?", 
     							state_id, county_id, city_code, min_price, max_price, min_sq_ft, max_taxes).order('assessed DESC, taxes_one DESC, square_feet DESC')
    assessments
 	end

	def county_name
 		County.where("id = ?", county_id).first.name 
 	end

 	def city_name
 		City.where("city_code = ?", city_code).first.name 
 	end		

end
