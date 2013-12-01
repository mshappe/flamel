ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
MiniTest::Reporters.use! #[MiniTest::Reporters::ProgressReporter.new]

class ActiveSupport::TestCase
  include SessionsHelper

  setup do
    sign_in FactoryGirl.create :user if @controller
  end

end
