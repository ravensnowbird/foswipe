class Foswipe::Organization < ActiveRecord::Base
  has_many :purchases
  has_many :clients
end
