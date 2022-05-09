source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

ruby "3.0.2"
gem "rails", "~> 7.0.2", ">= 7.0.2.4"
gem "sprockets-rails"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
gem "bootsnap", require: false

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
