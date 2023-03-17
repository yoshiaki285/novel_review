class BooksController < ApplicationController
  
  def search
    # ここで空の配列を作成
    @books = []
    @title = params[:title]
    if @title.present?
      # ここでresultsに楽天APIから取得したデータを格納
      # 書籍のタイトルを検索して、一致するデータを格納するように設定
      results = RakutenWebService::Books.search({
        title: @title
      })
      # この部分で楽天APIから取得したデータを@booksに格納していく
      # extract(result)についてはprivate配下に設定
      results.each do |result|
        book = Book.new(extract(result))
        @books << book
      end
    end 
    # @books内の各データをそれぞれ保存していく
    # 既に保存済みの本は除外するためにunlessの構文を採用
    @books.each do |book|
      unless Book.all.include?(book)
        book.save
      end
    end
  end
  
  private
  # 楽天APIのデータから必要なデータを絞り込み、対応するカラムにデータを格納する
  def extract(result)
    title = result["title"]
    author = result["author"]
    isbn = result["isbn"]
    item_caption = result["itemCaption"]
    publisher_name = result["publisherName"]
    sales_date = result["salesDate"]
    image_url = result["mediumImageUrl"]
    {
      title: title,
      author: author,
      isbn: isbn,
      item_caption: item_caption,
      publisher_name: publisher_name,
      sales_date: sales_date,
      image_url: image_url
    }
  end
end