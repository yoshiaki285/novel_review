class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :book, primary_key: "isbn"
  has_many :comment, dependent: :destroy
end
