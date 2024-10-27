class CreateAuthorizationGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :authorization_groups do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
