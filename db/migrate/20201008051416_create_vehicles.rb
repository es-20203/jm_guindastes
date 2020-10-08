class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :category
      t.string :board
      t.string :status

      t.timestamps
    end
  end
end
