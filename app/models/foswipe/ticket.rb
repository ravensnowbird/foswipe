class Foswipe::Ticket < ActiveRecord::Base
  include Foswipe::Concerns::Filterable

  belongs_to :customer , :class_name => :User,:foreign_key => "client_id"
  belongs_to :agent , :class_name => :User,:foreign_key => "support_id"
  belongs_to :user_group
  has_many :ticket_comments
  has_many :ticket_notes
  #belongs_to :support
  #dragonfly_accessor :attachment
  has_many :ticket_attachments, :dependent => :destroy
  accepts_nested_attributes_for :ticket_attachments
  accepts_nested_attributes_for :ticket_comments
  accepts_nested_attributes_for :ticket_notes

  scope :agents, -> support { where(:support_id =>  support) }
  scope :groups, -> group { where(:user_group_id =>  group) }
  scope :status, -> status { where(:status =>  status) }
  scope :ticket_type, -> ticket_type { where(:user_group_id =>  ticket_type) }
  scope :source, -> source { where(:user_group_id =>  source) }
  scope :priority, -> priority {where(:priority => priority)}
  scope :search, -> search {where("description LIKE ? OR title LIKE ? ", "%#{search}%", "%#{search}%")}

  scope :priorities, -> { ["LOW","MEDIUM","HIGH","URGENT"] }
  scope :statuses, -> { ["Open","Pending","Resolved","Closed","Waiting on Customer","Waiting on Third Party"] }

  scope :created_at, -> created_at do
    where(:created_at => eval(created_at)) if eval(created_at).class == Range
  end

end

