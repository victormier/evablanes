source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Frontend
gem 'slim-rails'
gem 'jquery-rails'
gem 'simple_form'
gem 'best_in_place'
gem 'will_paginate'
gem 'quiet_assets'

# User management
gem 'sorcery'

# Routing and languages
gem 'rails-i18n'
gem 'i18n_routing'
gem 'armot'
gem 'interpret', ">= 1.1.1"
gem 'i18n-active_record', :git => "git://github.com/rogercampos/i18n-active_record.git", :require => 'i18n/active_record'

# Utils
gem 'roo'
# File management
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'

group :assets do
  # CSS and JS
  gem 'sass'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'less-rails', git: 'git://github.com/metaskills/less-rails.git'
  gem 'coffee-rails', '~> 3.2.1'

  # javascript runtime
  gem "therubyracer"

  # Assets precompiling
  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3'

  # backoffice style framework
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
end

# Development
group :development do
  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'rb-fsevent',       require: false
end
