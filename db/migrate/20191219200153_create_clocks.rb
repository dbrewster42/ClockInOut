class CreateClocks < ActiveRecord::Migration[5.0]
  def change
    create_table :clocks do |t|
      t.integer :time
      t.references :job, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
