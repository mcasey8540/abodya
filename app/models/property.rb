class Property < ActiveRecord::Base
  attr_accessible 	 :tax_year, :county, :state, :district, :last_updated, :owner_name, :owner_street, :owner_city_state, :owner_zip_code, :property_location, :acerage,:year_constructed ,:building_square_feet ,:land_value, :improvement_value, :net_taxable_value ,:prior_year_tax ,:curret_year_tax ,:sale_price_one ,:deed_date_one ,:sale_price_two ,:deed_date_two ,:sale_price_three,:deed_date_three ,:sale_price_four, :deed_date_four, :sale_price_five , :deed_date_five , :sale_price_six , :deed_date_six
end
