module Foswipe
  class Sla < ActiveRecord::Base
    belongs_to :slas, :polymorphic => true
  end
end
