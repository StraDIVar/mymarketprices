class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.belongs_to :user
      t.string :name
      t.text :note

      t.timestamps
    end
    add_index :places, :user_id
  end
end
