class Foswipe::TicketAttachment < ActiveRecord::Base
  dragonfly_accessor :attachment
  belongs_to :ticket
end
