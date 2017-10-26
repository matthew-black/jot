class User < ActiveRecord::Base
include BCrypt

  validates :full_name, :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validate :validate_password
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(plain_text_password)
    @raw_password = plain_text_password
    @password = Password.create(plain_text_password)
      #--@password.class => BCrypt::Password < String--#
    self.password_hash = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password #--This is truly magic--#
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end
end
