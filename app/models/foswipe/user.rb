class Foswipe::User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  after_create :skip_confirmation
  
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
  
  
end

