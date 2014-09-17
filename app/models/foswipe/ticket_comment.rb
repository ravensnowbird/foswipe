class Foswipe::TicketComment < Foswipe::Comment
  belongs_to :ticket
  belongs_to :user
end
