class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
			t.integer :state_id
			t.integer :county_id
			t.integer :city_code
			t.string 	:property_location
			t.string  :property_class
			t.string 	:owner_name
			t.string 	:owner_mailing 
			t.string 	:city_state_zip
			t.integer :square_feet
			t.integer :year_built
			t.string  :building_class
			t.string  :updated
			t.float		:acreage
			t.float		:taxes_one
			t.float		:taxes_two
			t.float		:taxes_three
			t.float		:taxes_four
			t.string 	:sale_date
			t.float 	:sale_price
			t.float 	:assessed

      t.timestamps
    end
  end
end
