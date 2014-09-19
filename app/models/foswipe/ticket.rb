class Foswipe::Ticket < ActiveRecord::Base
  include Foswipe::Concerns::Filterable

  belongs_to :customer , :class_name => :User,:foreign_key => "client_id"
  belongs_to :agent , :class_name => :User,:foreign_key => "support_id"
  has_many :comments
  belongs_to :user_group
  has_many :todos, :dependent => :destroy

  accepts_nested_attributes_for :comments
  has_many :attachments, :dependent => :destroy, :as => :attachable

  accepts_nested_attributes_for :attachments

  scope :agents, -> support { where(:support_id =>  support) }
  scope :groups, -> group { where(:user_group_id =>  group) }
  scope :status, -> status { where(:status =>  status) }
  scope :ticket_type, -> ticket_type { where(:user_group_id =>  ticket_type) }
  scope :source, -> source { where(:user_group_id =>  source) }
  scope :priority, -> priority {where(:priority => priority)}
  scope :search, -> search {where("content LIKE ? OR title LIKE ? ", "%#{search}%", "%#{search}%")}

  scope :priorities, -> { ["LOW","MEDIUM","HIGH","URGENT"] }
  scope :statuses, -> { ["Open","Pending","Resolved","Closed","Waiting on Customer","Waiting on Third Party"] }

  scope :created_at, -> created_at do
    where(:created_at => eval(created_at)) if eval(created_at).class == Range
  end
  def ticket_attachments
    attachments
  end

end

