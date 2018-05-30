class AddCreatedAtToBots < ActiveRecord::Migration[5.2]
  def change
    add_column :bots, :created_at, :datetime
  end
end
