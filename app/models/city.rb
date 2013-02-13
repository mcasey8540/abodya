class City < ActiveRecord::Base
  attr_accessible :county_id, :modifier, :name
  belongs_to :county
end
