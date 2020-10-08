class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :neighborhood
      t.string :zipcode
      t.string :number
      t.string :city
      t.references :client, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
