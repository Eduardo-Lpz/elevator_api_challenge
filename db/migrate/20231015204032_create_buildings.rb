class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.integer :floors, null: false
      t.string :street
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
