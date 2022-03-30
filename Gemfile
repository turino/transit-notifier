source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.6.5"

gem "pg", "~> 0.18"
gem "puma", "~> 4.3"
gem "rails", "~> 5.1.4"
gem "sass-rails", "~> 5.0"
gem "slack-notifier"
gem "uglifier", ">= 1.3.0"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem "dotenv-rails"
  gem "factory_bot"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
