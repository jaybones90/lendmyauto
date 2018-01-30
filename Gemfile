source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
# user registration
gem 'devise'
# Facebook authentication
gem 'omniauth-facebook'
# image uploads
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# gem for background jobs processor
gem 'delayed_job_active_record'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# gem for add form functionality
gem 'simple_form'
# gem that provides html select with list of countries
gem 'country_select'
# ENV variable gem
gem 'dotenv-rails'
# Have access to the attibute method when using ActiveModel
gem 'active_model_attributes'
# gem to handle currency
gem 'money-rails', '~>1'
# payment processing
gem 'stripe'
# add factorybot and faker gem to production so there is seed data on heroku
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'factory_bot_rails'
# gem for admin dashboard
gem 'rails_admin', '~> 1.2'
# bootstrap datepicker
gem 'bootstrap-datepicker-rails', :require => 'bootstrap-datepicker-rails',
                                  :git => 'git://github.com/Nerian/bootstrap-datepicker-rails.git'
# required for daterangepicker
gem 'momentjs-rails'
# webpacker
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'launchy'
  gem 'pry'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
