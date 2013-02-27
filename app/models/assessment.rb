class Assessment < ActiveRecord::Base
  attr_accessible :state_id, :county_id, :city_code, :property_location, :property_class, :owner_name, :owner_mailing , :city_state_zip, :square_feet,:year_built,:building_class,:updated,:acreage,:taxes_one,:taxes_two,:taxes_three,:taxes_four,:sale_date,:sale_price,:assessed

  has_many :favorites

	def state_name
 		State.where("id = ?", state_id).first.name 
 	end
	
	def county_name
 		County.where("id = ?", county_id).first.name 
 	end

 	def city_name
 		City.where("city_code = ?", city_code).first.name 
 	end				

end
