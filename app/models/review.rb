class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :book, primary_key: "isbn"
  has_many :comment, dependent: :destroy
  
  # customer_id と book_id の組み合わせを一意性があるものとしている
  validates :user_id, uniqueness: { scope: :book_id }
end
