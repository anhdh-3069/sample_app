source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}
ruby "3.0.2"
gem "active_storage_validations", "0.8.2"
gem "bcrypt", "~> 3.1", ">= 3.1.12"
gem "bootsnap", require: false
gem "bootstrap-sass", "3.4.1"
gem "config"
gem "faker", "2.1.2"
gem "figaro"
gem "image_processing", "1.9.3"
gem "mini_magick", "4.9.5"
gem "mysql2", "~> 0.5"
gem "pagy"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.2", ">= 7.0.2.4"
gem "rails-i18n"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
gem "webpacker"

group :development, :test do
  gem "pry-rails", platforms: %i(mri mingw x64_mingw)
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :development, :test do
  gem "rubocop", "~> 1.26", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.14.0", require: false
end
