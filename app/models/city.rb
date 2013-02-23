class City < ActiveRecord::Base
  attr_accessible :county_id, :name
  belongs_to :county
end
