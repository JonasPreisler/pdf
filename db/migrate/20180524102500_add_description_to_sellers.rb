class AddDescriptionToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :description, :text
  end
end
