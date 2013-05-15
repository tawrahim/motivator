class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :phone_number

  # You can only use has secure password if you have a field in your
  # model called password digest
  has_secure_password

  has_many :goals, dependent: :destroy

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+@\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :phone_number, presence: true, format: { with: /[0-9]{10}/ ,
   message:"must be only numbers" }, length: { is: 10}
  validates :terrms_of_service, acceptance: true

  def feed
    Goal.where("user_id = ?", id)     
  end

  def send_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64 
    self.password_reset_sent_at = Time.zone.now
    self.save!(validate: false)
    UserMailer.password_reset(self).deliver
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64 
    end
end
