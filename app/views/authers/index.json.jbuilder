json.array!(@authers) do |auther|
  json.extract! auther, :id, :name
  json.url auther_url(auther, format: :json)
end
