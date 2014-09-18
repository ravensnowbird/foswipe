module Foswipe
  class TicketMailer < ActionMailer::Base
    default from: "from@example.com"
    def recieve(email)
      require 'mail'
      binding.pry
      @email = Mail.new(email)
      ticket_or_comment.message_id = @email.message_id
      ticket_or_comment.content = (@email.text_part || @email.html_part || @email).body.decoded
      ticket_or_comment.title = @email.subject if ticket_or_comment.class == Foswipe::Ticket
      ticket_or_comment.save
      create_attachments if @email.has_attachments?
    end

    def ticket_or_comment
      @ticket_or_comment ||= find_comment || find_or_initialize_ticket
    end

    def find_comment
      Foswipe::Comment.find_by_message_id(@email.in_reply_to).ticket.comments.new(:user_id => find_user.id) unless Foswipe::Comment.find_by_message_id(@email.in_reply_to).blank?
    end

    def find_or_initialize_ticket
      Foswipe::Ticket.where(:message_id => @email.in_reply_to).first_or_initialize(:client_id => find_user.id)
    end

    def find_user
      @find_user ||= User.find_or_create(@email.from)
    end
    
    def create_attachments
      @email.attachments.each do |a|
	t = Dragonfly::TempObject.new(a.decoded)
	ta = ticket_or_comment.attachments.new
	ta.attachment = t
	ta.attachment.name = a.name
	ta.save
      end
    end
  end
end
