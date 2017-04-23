class AlterItemsAddRowOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :row_order, :integer
    add_index :items, :row_order
  end
end
