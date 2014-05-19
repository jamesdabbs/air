require 'capybara/rails'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.include Capybara::DSL

  helpers = Module.new do
    def log_in user
      visit new_user_session_path
      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
      click_on "Sign in"
    end
  end
  config.include helpers
end
