class AddCreatedAtDescToBotUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :created_at_desc, :datetime
  end
end
