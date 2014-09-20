module Foswipe
  class UserChat < ActiveRecord::Base
    belongs_to :customer, :foreign_key => "customer_id", :class_name => "User"
    belongs_to :agent, :foreign_key => "agent_id", :class_name => "User"
  end
end
