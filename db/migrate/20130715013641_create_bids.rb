class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :comment
      t.boolean :active

      t.timestamps
    end
  end
end
