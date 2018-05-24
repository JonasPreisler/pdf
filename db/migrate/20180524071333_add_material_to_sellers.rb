class AddMaterialToSellers < ActiveRecord::Migration[5.2]
  def change
    add_reference :sellers, :material, foreign_key: true
  end
end
