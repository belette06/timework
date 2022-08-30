# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('./.ruby-version')

gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'pry', '~> 0.13.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails', '~> 1.1'
gem 'turbo-rails'
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
gem "mini_magick"
gem 'ransack', '~> 3.2', '>= 3.2.1'
gem 'bootstrap5-kaminari-views'
gem 'kaminari', '~> 1.2', '>= 1.2.2'
gem 'activeadmin'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'cancancan', '~> 3.4'
gem 'cssbundling-rails'
gem 'devise', '~> 4.8'
gem 'draper', '~> 4.0', '>= 4.0.2'
gem 'pundit', '~> 2.2'
gem 'sassc-rails'
gem 'simple_form', '~> 5.1'
gem 'simple_form_datetimepicker', '~> 0.0.9'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'image_processing', '~> 1.12', '>= 1.12.2'
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.22'

  gem 'rubocop', '~> 1.35'
 
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'annotate', '~> 3.2'
  gem 'web-console'
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'simplecov', '~> 0.21.2'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'rails_helper', '~> 2.2', '>= 2.2.2'
end
