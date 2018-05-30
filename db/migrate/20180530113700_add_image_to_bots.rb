class AddImageToBots < ActiveRecord::Migration[5.2]
  def change
    add_column :bots, :image, :string
  end
end
