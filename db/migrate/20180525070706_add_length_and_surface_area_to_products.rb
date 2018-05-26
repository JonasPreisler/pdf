class AddLengthAndSurfaceAreaToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :length, :decimal, precision: 15, scale: 2
    add_column :products, :surface_area, :decimal, precision: 15, scale: 2
  end
end
