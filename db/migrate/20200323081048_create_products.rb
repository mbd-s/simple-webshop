class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.decimal :price, null: false
      t.string :description
      t.string :name, null: false
      t.string :category

      t.timestamps
    end
  end
end
