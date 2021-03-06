class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :password_digest
      t.boolean :admin
      t.integer :wages

      t.timestamps
    end
  end
end
