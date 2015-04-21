json.array!(@tables) do |table|
  json.extract! table, :id, :name, :statu
  json.url table_url(table, format: :json)
end
