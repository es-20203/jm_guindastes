class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :cpf_cnpj
      t.string :name
      t.string :email
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
