class CreateMuniCodes < ActiveRecord::Migration
  def change
    create_table :muni_codes do |t|
      t.string :county
      t.string :city
      t.integer :muni_code

      t.timestamps
    end
  end
end
