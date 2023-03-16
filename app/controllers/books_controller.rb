class BooksController < ApplicationController
  
  def search
    # ここで空の配列を作成
    @books = []
    @title = params[:title]
    if @title.present?
      # ここでresultsに楽天APIから取得したデータを
      results = RakutenWebService::Books.search({
        title: @title
      })
      
  end
end
