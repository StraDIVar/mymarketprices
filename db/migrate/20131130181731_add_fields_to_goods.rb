class AddFieldsToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :name, :string
    add_column :goods, :notes, :text
  end
end
