class Assessment < ActiveRecord::Base
  attr_accessible :state, :county, :municipality, :property_location, :property_class, :owner_name, :owner_mailing , :city_state_zip, :square_feet,:year_built,:building_class,:updated,:acreage,:taxes_one,:taxes_two,:taxes_three,:taxes_four,:sale_date,:sale_price,:assessed
									
end
