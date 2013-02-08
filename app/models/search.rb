class Search < ActiveRecord::Base
  attr_accessible :district, :max_price, :max_taxes, :min_price, :min_sq_ft, :state
  validates :max_price, :min_price, :max_taxes, :min_sq_ft, presence: :true
  validates :max_price,:min_price,:min_sq_ft, :max_taxes, :numericality => {:only_integer => true}


  def properties
    properties = Property.where("state = ? AND district = ? AND net_taxable_value >= ? AND net_taxable_value <= ? AND building_square_feet >= ? AND curret_year_tax <= ?", 
    							state, district, min_price, max_price, min_sq_ft, max_taxes).order('net_taxable_value DESC, curret_year_tax DESC, building_square_feet DESC')
    properties
 	end


end
