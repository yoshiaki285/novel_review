class Book < ApplicationRecord
  self.primary_key = "isbn"
  
  belongs_to :customer
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  # 
  def bookmarked_by?(customer)
    bookmarks.exists?(customer_id: customer.id)
  end
end
