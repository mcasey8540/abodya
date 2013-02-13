class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :county_id
      t.string :name
      t.integer :modifier

      t.timestamps
    end
  end
end
