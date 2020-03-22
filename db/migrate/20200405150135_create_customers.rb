class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :telephone

      t.timestamps
    end
  end
end
