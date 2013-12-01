# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  username        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean
#

class User < ActiveRecord::Base
  before_create :create_remember_token

  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
