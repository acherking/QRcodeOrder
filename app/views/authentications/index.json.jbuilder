json.array!(@authentications) do |authentication|
  json.extract! authentication, :id, :authentication_str, :table_id, :statu
  json.url authentication_url(authentication, format: :json)
end
