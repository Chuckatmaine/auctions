json.array!(@auctions) do |auction|
  json.extract! auction, :id, :auctioneer, :title, :description, :start_date, :end_date, :display, :winner_message
  json.url auction_url(auction, format: :json)
end
