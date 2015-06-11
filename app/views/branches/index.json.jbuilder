json.array!(@branches) do |branch|
  json.extract! branch, :id, :name
  json.url branch_url(branch, format: :json)
end
