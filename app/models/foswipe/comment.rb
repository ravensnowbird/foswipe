class Foswipe::Comment < ActiveRecord::Base
  belongs_to :ticket
  #has_many :attachments
  belongs_to :commentable, :polymorphic => true

  has_many :comment_attachments, :dependent => :destroy
  accepts_nested_attributes_for :comment_attachments
end


