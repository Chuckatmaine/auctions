class User < ActiveRecord::Base
  has_many :bids
  has_many :auctioneers
  has_many :auctions, through: :auctioneers
  # Include default devise modules. Others available are:
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable #, :omniauth_providers => [:google]
 def items_won(auction)
   items = auction.items.all
   items_won = items.each.winbid
 end
 def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end
end
