class AddGramAndPurityAndDiameterToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :gram, :decimal, precision: 15, scale: 2
    add_column :products, :purity, :decimal, precision: 15, scale: 2
    add_column :products, :diameter, :decimal, precision: 15, scale: 2
  end
end
