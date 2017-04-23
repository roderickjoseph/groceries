class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :list_id
      t.string :creator_name
      t.timestamps
    end
  end
end
