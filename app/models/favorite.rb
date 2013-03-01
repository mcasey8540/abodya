class Favorite < ActiveRecord::Base
  attr_accessible :assessment_id, :user_id
 	belongs_to :assessment
 	belongs_to :user

 	validates_uniqueness_of :user_id, :scope => :assessment_id

end
