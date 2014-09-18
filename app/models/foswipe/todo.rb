module Foswipe
  class Todo < ActiveRecord::Base
    belongs_to :ticket
  end
end
