class AddProfilePicToBotUsersAgain < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :'profile pic url', :string
  end
end
