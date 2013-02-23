class City < ActiveRecord::Base
  attr_accessible :county_id, :city_code, :name
  belongs_to :county
end
