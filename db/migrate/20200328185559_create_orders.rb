class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status, default: 'submitted'
      t.string :delivery_method
      t.text :note
      t.belongs_to :customer

      t.timestamps
    end
  end
end
