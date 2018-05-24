class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :material, foreign_key: true
      t.references :seller, foreign_key: true
      t.string :name
      t.string :slug
    end
  end
end
