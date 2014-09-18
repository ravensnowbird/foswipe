module Foswipe
  class UserGroup < ActiveRecord::Base
    has_and_belongs_to_many :users
    accepts_nested_attributes_for :users
    has_many :tickets
  end
end
