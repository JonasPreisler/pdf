class AddUserIdToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :user_id, :integer
  end
end
