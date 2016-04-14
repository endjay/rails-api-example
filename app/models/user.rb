class User < ActiveRecord::Base
  require 'digest/sha1'
  attr_accessor :password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true , :uniqueness => true, :format => EMAIL_REGEX
  validates :password , presence:true, :confirmation => true
  validates_length_of :password, :in => 8..20, :on => create
  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.magic_word =  Digest::SHA1.hexdigest(password)
    end
  end


  def self.authenticate(username_or_email="", password="")
    if  EMAIL_REGEX.match(username_or_email)
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end
    if user && user.match_password(password)
      return user
    else
      return false
    end
  end
  
  def match_password(password="")
    magic_word == Digest::SHA1.hexdigest(password)
  end

end
