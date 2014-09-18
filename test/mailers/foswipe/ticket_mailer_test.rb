require 'test_helper'

module Foswipe
  class TicketMailerTest < ActionMailer::TestCase
    test "recieve" do
      mail = TicketMailer.recieve
      assert_equal "Recieve", mail.subject
      assert_equal ["to@example.org"], mail.to
      assert_equal ["from@example.com"], mail.from
      assert_match "Hi", mail.body.encoded
    end

  end
end
