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
#  remember_token  :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  subject { FactoryGirl.create :user }

  should have_secure_password
  should validate_presence_of :email
  should validate_presence_of :username
  should validate_uniqueness_of :username
end
