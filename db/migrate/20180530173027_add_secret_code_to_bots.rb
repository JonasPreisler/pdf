class AddSecretCodeToBots < ActiveRecord::Migration[5.2]
  def change
    add_column :bots, :secret_code, :string
  end
end
