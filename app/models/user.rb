class User < ApplicationRecord
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: true

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  has_many :goals
  has_many :comments, class_name: 'UserComment', primary_key: :id, foreign_key: :user_id

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end
end
