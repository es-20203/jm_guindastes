class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :status
      t.decimal :price
      t.timestamp :data
      t.references :address, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
