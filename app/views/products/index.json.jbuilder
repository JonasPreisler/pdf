json.array!(@products) do |product|
  json.extract! product, :id, :name, :image, :purity, :diameter, :length, :gram, :price
  json.url product_url(product, format: :json)
end
