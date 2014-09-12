class Foswipe::Ticket < ActiveRecord::Base
  
  belongs_to :customer , :class_name => :User,:foreign_key => "client_id"
  belongs_to :agent , :class_name => :User,:foreign_key => "support_id"
  belongs_to :client
  has_many :ticket_comments
  has_many :ticket_notes
  #belongs_to :support
  #dragonfly_accessor :attachment
 has_many :ticket_attachments, :dependent => :destroy
 accepts_nested_attributes_for :ticket_attachments
  def agent
    Foswipe::User.where(:id => self.support_id).first
  end
end
