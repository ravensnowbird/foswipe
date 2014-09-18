class Foswipe::Ticket < ActiveRecord::Base
  
  belongs_to :customer , :class_name => :User,:foreign_key => "client_id"
  belongs_to :agent , :class_name => :User,:foreign_key => "support_id"
  has_many :comments
  has_many :ticket_comments
  has_many :ticket_notes
  has_many :todos, :dependent => :destroy
  #belongs_to :support
  #dragonfly_accessor :attachment
 has_many :ticket_attachments, :dependent => :destroy
 accepts_nested_attributes_for :ticket_attachments
 accepts_nested_attributes_for :comments
 #accepts_nested_attributes_for :ticket_notes
end
