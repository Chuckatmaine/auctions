json.array!(@users) do |user|
  json.extract! user, :id, :id, :fname, :lname, :email, :city, :street, :state, :zip, :phone, :is_admin, :is_auctioneer
  json.url user_url(user, format: :json)
end
