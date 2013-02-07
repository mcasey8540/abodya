class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.integer	 :tax_year 
			t.string :county
			t.string :state
			t.string :district
			t.string :last_updated
			t.string :owner_name
			t.string :owner_street
			t.string :owner_city_state
			t.string :owner_zip_code
			t.string :property_location
			t.float  :acerage
			t.integer 	:year_constructed
			t.integer 	 :building_square_feet
			t.float  :land_value
			t.float  :improvement_value
			t.float  :net_taxable_value
			t.float  :prior_year_tax
			t.float  :curret_year_tax
			t.float  :sales_price_one
			t.string :deed_date_one
			t.float  :sale_price_two
			t.string :deed_date_two
			t.float  :sale_price_three
			t.string :deed_date_three
			t.float  :sale_price_four
			t.string :deed_date_four
			t.float  :sale_price_five
			t.string :deed_date_five
			t.float  :sale_price_six
			t.string :deed_date_six
      t.timestamps
    end
  end
end
