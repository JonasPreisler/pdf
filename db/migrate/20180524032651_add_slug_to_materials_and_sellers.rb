class AddSlugToMaterialsAndSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :slug, :string
    add_column :sellers, :slug, :string
  end
end
