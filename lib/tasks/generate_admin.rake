require 'highline'

namespace :generate do
  desc 'Create an admin account'
  task :admin => :environment do
    h = HighLine.new
    username = h.ask 'Username: '
    email = h.ask 'E-mail: '
    password = h.ask('Password: ') { |q| q.echo = false }
    password_confirmation = h.ask('Confirm Password: ')  { |q| q.echo = false }
    User.create!(username: username, email: email, is_admin: true, password: password, password_confirmation: password_confirmation)
  end

end
