class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  end
end
