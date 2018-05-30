class AddWebsiteToBots < ActiveRecord::Migration[5.2]
  def change
    add_column :bots, :website, :string
  end
end
