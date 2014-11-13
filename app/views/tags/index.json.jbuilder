json.array!(@tags) do |tag|
  json.extract! tag, :id, :shark_id, :date, :latitude, :longitude, :offshore, :gt5miles, :angler_id, :tagger_id, :comments, :number
  json.url tag_url(tag, format: :json)
end
