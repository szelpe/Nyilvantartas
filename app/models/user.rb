class User < ActiveRecord::Base
  
  before_save :encrypt_password

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_length_of :username, :within => 4..20
  validates_confirmation_of :password, :if => :password_required?
  
  def self.encrypt(pass,salt)
    Digest::SHA1.hexdigest(salt+pass)
  end

  def encrypt_password
    return if self.password.blank?
    if new_record?
      self.salt = Digest::SHA1.hexdigest(Time.now.to_s+email+"--"+username)
    end
    self.password=User.encrypt(password,salt)
  end

  def self.authenticate(username,password)
    user = User.find_by_username username
    user && user.authenticated?(password) ? user : nil
  end

  def authenticated?(password)
    self.password == User.encrypt(password, salt)
  end

  def password_required?
    self.password.blank? || !self.password.blank?
  end
end
