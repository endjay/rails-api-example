require 'securerandom'

class Client < ActiveRecord::Base
  validates :app_name, :presence => true, :uniqueness => true, :length => { :in => 5..20 }
  before_save :generate_app_params

  def generate_app_params
    self.app_id = SecureRandom.hex(15)
    self.app_secret = SecureRandom.hex(20)
  end
end
