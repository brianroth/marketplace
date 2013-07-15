class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false
      t.string :encrypted_password, :null => false
      t.string :name, :null => false

      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end
end
