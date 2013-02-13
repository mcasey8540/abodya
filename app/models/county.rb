class County < ActiveRecord::Base
  attr_accessible :name, :state_id
  belongs_to :state
  has_many :cities
end
