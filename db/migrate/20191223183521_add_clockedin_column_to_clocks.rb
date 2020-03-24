class AddClockedinColumnToClocks < ActiveRecord::Migration[5.0]
  def change
    add_column :clocks, :clockedin, :boolean
  end
end
