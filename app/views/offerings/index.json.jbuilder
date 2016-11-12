json.array!(@offerings) do |offering|
  json.extract! offering, :id, :produto_id
  json.url offering_url(offering, format: :json)
end
