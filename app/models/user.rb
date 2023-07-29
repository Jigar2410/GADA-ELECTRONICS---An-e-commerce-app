class User < ApplicationRecord
  before_validation :downcase_username_email

  has_many :orders, dependent: :destroy
  validates :username, presence: true, length: { minimum: 5, maximum: 15 },
            uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: true
  has_secure_password

  private

  def downcase_username_email
    self.username = username.downcase if username.present?
    self.email = email.downcase if email.present?
  end
end
