class Auction < ActiveRecord::Base
   has_many :items
   has_many :bids, through: :items
   has_many :auctioneers
   has_many :users, through: :auctioneers 
   accepts_nested_attributes_for :items, :bids

has_attached_file :logo, 
:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
:url => "/system/:attachment/:id/:basename_:style.:extension",
:styles => {
  :thumb    => ['100x100#',  :jpg, :quality => 70],
  :preview  => ['480x480#',  :jpg, :quality => 70],
  :large    => ['600>',      :jpg, :quality => 70],
  :logo     => ['<600#',  :jpg, :quality => 70],
  :retina   => ['1200>',     :jpg, :quality => 30]
},
:convert_options => {
  :thumb    => '-set colorspace sRGB -strip',
  :preview  => '-set colorspace sRGB -strip',
  :large    => '-set colorspace sRGB -strip',
  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
}
validates_attachment :logo,
    :presence => true,
    :size => { :in => 0..20.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }


 def tally
   tally = 0
   @items = self.items.all
   @items.each do |i|
     if !i.bids.last.blank?
       if i.buyitnow
         i.bids.each do |b|
           tally += b.amount * b.qty
         end
       else
         tally += i.bids.last.amount
       end
     end
   end
   return tally
 end
end
