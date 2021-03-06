class Item < ActiveRecord::Base
   has_many :bids
   belongs_to :auction
   accepts_nested_attributes_for :bids
   before_destroy :check_bids
#   validate :minbid
has_attached_file :picture, 

:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
:url => "/system/:attachment/:id/:basename_:style.:extension",
:styles => {
  :thumb    => ['100x100#',  :jpg, :quality => 70],
  :logo1    => ['200x100#',  :jpg, :quality => 70],
  :logo2    => ['150x100#',  :jpg, :quality => 70],
  :preview  => ['480x480#',  :jpg, :quality => 70],
  :large    => ['600x',      :jpg, :quality => 70],
  :auction1 => ['x700',      :jpg, :quality => 70],
  :larger   => ['x600',      :jpg, :quality => 70],
  :retina   => ['1200>',     :jpg, :quality => 30]
},
:convert_options => {
  :thumb    => '-set colorspace sRGB -strip',
  :logo1    => '-set colorspace sRGB -strip',
  :logo2    => '-set colorspace sRGB -strip',
  :preview  => '-set colorspace sRGB -strip',
  :large    => '-set colorspace sRGB -strip',
  :auction1    => '-set colorspace sRGB -strip',
  :larger   => '-set colorspace sRGB -strip',
  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
}
validates_attachment :picture,
    :presence => true,
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

    def highbidder
     if self.bids.count > 0 
       highbidder = self.bids.order('amount DESC').first.user 
     end
    end
  def winbid
    winbid = self.bids.maximum(:amount)
  end
  private
    def check_bids
      unless self.bids.count == 0
        self.errors[:base] << "Cannot destroy items that already have bids!"
        return false	
      end
    end
    def minbid
        if !self.buyitnow then
         if bids = self.bids
           minbid = bids.maximum("amount") + self.bid_increment
           message = "(Please bid at least as high as the minimum bid:)$, #{minbid}"
           errors.add(:amount, message) unless self.amount >= minbid
         end
        end
    end
end
