class AddProfilePicUrlToBotUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :profile_pic_url, :string
  end
end
