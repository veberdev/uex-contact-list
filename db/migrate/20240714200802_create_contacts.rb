class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :cpf
      t.string :phone
      t.string :address
      t.string :complement
      t.string :zip_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :contacts, :cpf, unique: true
  end
end
