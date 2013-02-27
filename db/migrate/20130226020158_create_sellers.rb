class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.integer :state_id
      t.integer :county_id
      t.integer :city_id
      t.string :property_location
      t.date :move_date
      t.string :owner_name

      t.timestamps
    end
  end
end
