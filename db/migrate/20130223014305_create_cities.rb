class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :county_id
      t.string :name
      t.integer :city_code
      t.timestamps
    end
  end
end