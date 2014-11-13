json.array!(@sharks) do |shark|
  json.extract! shark, :id, :tag_id, :species
  json.url shark_url(shark, format: :json)
end
