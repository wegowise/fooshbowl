source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'

group :assets do
  gem "bootstrap-sass"
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem "debugger"
  gem "sqlite3"
end

group :test do
  gem "rspec"
  gem "rspec-rails"
  gem "forge-factories"
end

group :production do
  gem 'pg'
  gem "thin"
end
