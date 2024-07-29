class CreateAdminUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_users do |t|
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.string :first_name
      t.string :last_name
      t.boolean :super_admin

      t.timestamps
    end
    add_index :admin_users, :email
  end
end
