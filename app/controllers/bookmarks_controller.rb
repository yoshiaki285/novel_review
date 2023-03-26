class BookmarksController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @bookmark = current_customer.bookmarks.new(book_id: book.id)
    @bookmark.save
    redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
  end

  def destroy
    @book = Book.find(params[:book_id])
    @bookmark = current_customer.bookmarks.find_by(book_id: book.id)
    @bookmark.destroy
    redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
  end
end
