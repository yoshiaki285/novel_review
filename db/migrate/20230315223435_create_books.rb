class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: false do |t|
      t.bigint :isbn, null: false, primary_key: true
      t.string :title, null: false
      t.string :author, null: false
      t.string :item_caption, null: false
      t.string :publisher_name, null: false
      t.string :sales_date, null: false
      t.string :image_url, null: false
      t.timestamps
    end
  end
end
