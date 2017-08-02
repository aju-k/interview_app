class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string  :original_link
      t.string  :unique_code
      t.integer :visit_count, default: 0
      t.timestamps null: false
    end
    add_index :links, :unique_code
    add_index :links, :original_link
  end
end
