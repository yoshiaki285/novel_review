class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :book, null: false

      t.timestamps
      # customerとbookの組み合わせに一意性を付与する
      t.index [:customer_id, :book_id], unique: true
    end
    
    add_foreign_key :reviews, :books, column: :book_id, primary_key: :isbn
  end
end
