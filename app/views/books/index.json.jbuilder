json.array!(@books) do |book|
  json.extract! book, :id, :title, :auther_id, :publisher_id, :published, :price, :isbn, :p_date, :p_price, :read
  json.url book_url(book, format: :json)
end
