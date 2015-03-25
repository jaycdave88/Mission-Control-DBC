class User < ActiveRecord::Base
	has_secure_password

  has_many :stickies
  has_many :helps

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_presence_of :password_digest

end
