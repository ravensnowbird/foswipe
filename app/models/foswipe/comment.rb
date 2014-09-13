module Foswipe
  class Comment < ActiveRecord::Base
    belongs_to :ticket
    #has_many :attachments
    belongs_to :commentable, :polymorphic => true

    has_many :comment_attachments, :dependent => :destroy
    accepts_nested_attributes_for :comment_attachments
  end

  class TicketComment < Comment
    belongs_to :Ticket
  end

  class TicketNote < Comment
    belongs_to :Ticket
  end
end

module Foswipe
  class TicketComment < Comment
    belongs_to :Ticket
  end

end

module Foswipe
  class TicketNote < Comment
    belongs_to :Ticket
  end
end