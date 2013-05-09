class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :phone_number

  # You can only use has secure password if you have a field in your
  # model called password digest
  has_secure_password

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+@\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                                        uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :phone_number, presence: true

  private
    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64 
    end
end
