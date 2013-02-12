class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :county
      t.string :state
      t.string :district
      t.integer :min_price
      t.integer :max_price
      t.integer :min_sq_ft
      t.integer :max_taxes

      t.timestamps
    end
  end
end
