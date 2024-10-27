class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.text :content
      t.string :url
      t.references :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
