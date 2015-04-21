json.array!(@menus) do |menu|
  json.extract! menu, :id, :authentication_id, :statu
  json.url menu_url(menu, format: :json)
end
