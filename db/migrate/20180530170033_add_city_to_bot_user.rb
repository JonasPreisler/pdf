class AddCityToBotUser < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :city, :string
  end
end
