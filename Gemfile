source 'https://rubygems.org'

gem 'rails', '3.2.12'
#gem 'bootstrap-sass', '2.1'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'jquery-rails', '2.0.2'
gem 'figaro'
gem "omniauth"
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'twilio-ruby'
gem 'jammit', :require => nil
gem 'rack-webconsole-pry', :require => 'rack-webconsole'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'  
  gem 'spork', '0.9.2'
  gem 'pry-rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '4.1.0'
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'database_cleaner', '0.7.0'
end

group :production do
  gem 'pg', '0.12.2'
end
