class AddAttachmentLogoToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :auctions, :logo
  end
end
