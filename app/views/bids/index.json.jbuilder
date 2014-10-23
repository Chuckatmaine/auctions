json.array!(@bids) do |bid|
  json.extract! bid, :id, :user_id, :item_id, :amount
  json.url bid_url(bid, format: :json)
end
