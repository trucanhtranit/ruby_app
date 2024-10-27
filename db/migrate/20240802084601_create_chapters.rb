class CreateChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :content
      t.string :url
      t.references :comic, null: false, foreign_key: true
      t.references :attachment, :polymorphic => {:default => 'Chapter'}

      t.timestamps
    end
  end
end
