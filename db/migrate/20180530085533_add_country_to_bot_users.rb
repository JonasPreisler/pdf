class AddCountryToBotUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :country, :string
  end
end
