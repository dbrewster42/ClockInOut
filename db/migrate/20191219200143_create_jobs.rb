class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :description
      t.integer :estimate
      t.references :user, foreign_key: true
      t.integer :billed
      t.integer :paid
      t.boolean :completed

      t.timestamps
    end
  end
end
