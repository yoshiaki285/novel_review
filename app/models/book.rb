class Book < ApplicationRecord
  self.primary_key = "isbn"
  
  has_many :reviews, dependent: :destroy
  
  
  def reviewed_by?(customer)
    reviews.exists?(customer_id: customer)
  end
end
