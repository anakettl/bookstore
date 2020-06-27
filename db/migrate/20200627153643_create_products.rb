class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :author
      t.text :description
      t.decimal :price
      t.integer :amount

      t.timestamps
    end
  end
end
