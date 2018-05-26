class AddCreatedAtToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :created_at, :datetime
  end
end
