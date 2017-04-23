class AlterListsAddRowOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :row_order, :integer
    add_index :lists, :row_order
  end
end
