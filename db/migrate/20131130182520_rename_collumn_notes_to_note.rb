class RenameCollumnNotesToNote < ActiveRecord::Migration
  def up
    rename_column :goods, :notes, :note
  end

  def down
    rename_column :goods, :note, :notes
  end
end
