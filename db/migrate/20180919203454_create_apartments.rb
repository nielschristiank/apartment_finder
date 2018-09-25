class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :postal_code
      t.string :state
      t.string :country
      t.string :building_manager_name
      t.string :building_manager_phone
      t.text :building_manager_hours

      t.timestamps
    end
  end
end
