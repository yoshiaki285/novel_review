class Book < ApplicationRecord
  self.primary_key = "isbn"
  
  has_many :reviews, dependent: :destroy
  
  
  def reviewed_by?(customer)
    reviews.exists?(customer_id: customer)
  end
  
  # 引数に渡されたものが、customerのものか
  def own?(object)
    id == object.customer_id
  end
  
  # 引数に渡されたbookがブックマーク済みか
  def bookmark?
    review_books.include?(book)
  end
  
  # ブックマークする
  def bookmark(book)
    # current_customerがブックマークしているbookの配列にbookを入れる
    review_books << book
  end
  
  # ブックマークを外す
  def unbookmark(book)
    review_books.destroy(book)
  end
end
