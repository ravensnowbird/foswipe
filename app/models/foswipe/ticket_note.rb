class Foswipe::TicketNote < Foswipe::Comment
  belongs_to :ticket
  belongs_to :user
end
