class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :order
      t.belongs_to :product
      t.integer :quantity

      t.timestamps
    end
  end
end
