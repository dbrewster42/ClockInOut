class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.string :title
      t.integer :wage
      t.integer :increase

      t.timestamps
    end
  end
end
