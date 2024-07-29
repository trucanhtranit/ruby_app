class CreateComics < ActiveRecord::Migration[7.1]
  def change
    create_table :comics do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :author
      t.string :status
      t.boolean :available
      t.integer :views_count
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
