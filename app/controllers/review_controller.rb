class ReviewController < ApplicationController
  def create
    # Bookモデルからbook_idを探してくる
    @book = Book.find(params[:book_id])
    # ログイン中のユーザーと紐づけられたidを取ってくる。
    # この時、customer.rbに定義したメソッドを使用し、idの情報を保存する。
    current_customer.bookmark(@book)
  end

  def destroy
    @book = current_customer.bookmarks.find(params[:book_id]).book
    current_customer.unbookmark(@book)
    
  end
end
