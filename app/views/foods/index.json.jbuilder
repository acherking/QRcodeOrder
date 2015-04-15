json.array!(@foods) do |food|
  json.extract! food, :id, :food_type_id, :name, :price
  json.url food_url(food, format: :json)
end
