json.array!(@items) do |item|
  json.extract! item, :id, :title, :description, :start_bid, :bid_increment, :auction_id, :is_donation, :buyitnow, :value
  json.url item_url(item, format: :json)
end
