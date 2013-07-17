class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :name, :null => false
      t.integer :unlock_level, :null => false
      t.timestamps
    end
  end
end
