class Foswipe::Ticket < ActiveRecord::Base
  belongs_to :client
  has_many :comments
  #belongs_to :support
  #dragonfly_accessor :attachment
 has_many :ticket_attachments, :dependent => :destroy
 accepts_nested_attributes_for :ticket_attachments
  def support
    Support.where(:id => self.support_id).first
  end
end
