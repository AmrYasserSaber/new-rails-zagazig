class User < ApplicationRecord
  before_validation :downcase_email

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  def downcase_email
    self.email = email.to_s.downcase
  end
end
