class Seller < ActiveRecord::Base
  attr_accessible :city_id, :county_id, :move_date, :owner_name, :property_location, :state_id
end
