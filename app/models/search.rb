class Search < ActiveRecord::Base
  attr_accessible :district, :max_price, :max_taxes, :min_price, :min_sq_ft, :state

  def properties
 	  properties = Property.where("state = ?", state ) if state.present?
    properties = Property.where("district = ?", district ) if district.present?
    properties = Property.where("net_taxable_value >= ?", min_price) if min_price.present?
    properties = Property.where("net_taxable_value <= ?", max_price) if max_price.present?
    properties = Property.where("building_square_feet >= ?", min_sq_ft) if min_sq_ft.present?
    properties = Property.where("curret_year_tax <= ?", max_taxes) if max_taxes.present?
    properties
 	end


end
