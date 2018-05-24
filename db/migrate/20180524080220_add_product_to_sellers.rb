class AddProductToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :product, :integer
  end
end
