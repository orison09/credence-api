source 'https://rubygems.org'
ruby '2.5.1'

# Web API
gem 'roda'
gem 'puma'
gem 'json'

# Configuration
gem 'econfig'
gem 'rake'

# Diagnostic
gem 'pry'

# Security
gem 'rbnacl-libsodium'

# Database
gem 'sequel'
gem 'hirb'

group :development, :test do
  gem 'sequel-seed'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end


# Testing
group :test do
  gem 'minitest'
  gem 'minitest-rg'
  gem 'rack-test'
end

# Development
group :development do
  gem 'rubocop'
end

group :development, :test do
  gem 'rerun'
end