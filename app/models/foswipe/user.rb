class Foswipe::User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :tickets       
         
  after_create :skip_confirmation
  has_many :tickets, :foreign_key => 'client_id', :class_name => "Ticket"
  has_many :support_tickets, :foreign_key => 'support_id', :class_name => "Ticket"
  
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
    first_name + (last_name || "")
  end
  def skip_confirmation
    update(:confirmed_at => Time.now.utc)
  end
  def self.customers
    Foswipe::User.where( :agent => false , :admin => false)
  end
  def self.agents
    Foswipe::User.where( :agent => true)
  end
  def self.admins
    Foswipe::User.where( :admin => true)
  end
  
end

