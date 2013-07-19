class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :comment
      t.references :part
      t.references :plane
      t.references :user
      t.boolean :active

      t.timestamps
    end
  end
end
