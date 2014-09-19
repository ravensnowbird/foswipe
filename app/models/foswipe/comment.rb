class Foswipe::Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
  #has_many :attachments

  has_many :attachments, :dependent => :destroy, :as => :attachable
  accepts_nested_attributes_for :attachments

end

