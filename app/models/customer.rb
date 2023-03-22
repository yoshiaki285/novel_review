class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews_books, through: :reviews, source: :book
  
  has_one_attached :profile_image
         
  enum gender: { male: 0, female: 1, others: 2 }
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
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
