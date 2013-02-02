class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password_digest, :session_token

  validates_presence_of :email,
                          message: "must be provided"

  validates_presence_of :name,
                          message: "must be provided"

  validates :name, length: { within: 1..30,
            message: "must between 1 to 30 characters" }

  validates :password, length: { minimum: 8,
            message: "must be a mimimum of 8 characters" },
            allow_blank: true

  validates_uniqueness_of :email,
                          message: "is already registered"

  validates_format_of :email,
                      with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      message: "Invalid email"

  has_many :secrets

  def reset_pwd
    temp = SecureRandom.hex[0..7]
    self.password = temp
    self.save
    return temp
  end

end
