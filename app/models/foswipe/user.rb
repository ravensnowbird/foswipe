class Foswipe::User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  #after_create :skip_confirmation
  has_many :tickets, :foreign_key => 'client_id', :class_name => "Ticket"
  has_many :support_tickets, :foreign_key => 'support_id', :class_name => "Ticket"
  has_many :slas, :as => :slas
  belongs_to :organization
  has_many :ticket_comments
  has_and_belongs_to_many :user_groups
  
  

  validate :first_name, :presence => true

  before_save :admin_becomes_agent

  #def active_for_authentication?
  #  super && approved?
  #end

  #def inactive_message
  #  if !approved?
  #    :not_approved
  #  else
  #    super # Use whatever other message
  #  end
  #end
  def customer?
    !(admin? || agent?)
  end

  def name
    first_name +  " " +(last_name || "")
  end

  def skip_confirmation
    update(:confirmed_at => Time.now.utc)
  end

  def self.customers
    Foswipe::User.where( :agent => nil , :admin => nil)
  end

  def self.agents
    Foswipe::User.where(:agent => true)
  end

  def self.admins
    Foswipe::User.where( :admin => true)
  end

  def admin_or_agent?
    admin? || agent?
  end

  def all_tickets
    if admin?
      Foswipe::Ticket.all
    elsif agent?
      support_tickets
    else
      tickets
    end
  end

  def admin_becomes_agent
    self.agent = true if self.admin == true
  end

  def self.find_or_create(from_email)
    return self.where(:email => from_email).first unless self.where(:email => from_email).blank?
    user = self.create(:email => from_email, :password => "00000000", :password_confirmation => "00000000")
    user.send_reset_password_instructions
    user   
  end
end

