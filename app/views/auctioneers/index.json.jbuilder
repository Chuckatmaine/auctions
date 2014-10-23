json.array!(@auctioneers) do |auctioneer|
  json.extract! auctioneer, :id, :user_id, :auction_id, :create, :destroy
  json.url auctioneer_url(auctioneer, format: :json)
end
