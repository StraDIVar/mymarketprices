class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.belongs_to :place
      t.belongs_to :user
      t.belongs_to :good
      t.integer :value

      t.timestamps
    end

    add_index :prices, :place_id
    add_index :prices, :user_id
    add_index :prices, :good_id
  end
end
