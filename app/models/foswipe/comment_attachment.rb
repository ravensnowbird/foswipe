class Foswipe::CommentAttachment < ActiveRecord::Base
  dragonfly_accessor :attachment
  belongs_to :comment
end
