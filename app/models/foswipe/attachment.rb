module Foswipe
  class Attachment < ActiveRecord::Base
    belongs_to :attachable, :polymorphic => true
    dragonfly_accessor :attachment
  end
end
