json.array!(@little_menus) do |little_menu|
  json.extract! little_menu, :id, :menu_id, :food_id, :number, :remark
  json.url little_menu_url(little_menu, format: :json)
end
