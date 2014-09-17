class Foswipe::Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
  #has_many :attachments

  has_many :comment_attachments, :dependent => :destroy
  accepts_nested_attributes_for :comment_attachments
end


