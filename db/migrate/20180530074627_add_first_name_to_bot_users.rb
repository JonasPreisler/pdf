class AddFirstNameToBotUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :'first name', :string
  end
end
