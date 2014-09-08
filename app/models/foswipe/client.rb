class Foswipe::Client < Foswipe::User
  has_many :tickets
  belongs_to :organization
end
