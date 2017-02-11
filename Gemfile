source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
gem 'active_model_serializers', '~> 0.9.6'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt', '~> 1.5', '>= 1.5.4'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'rack-cors'

group :development, :test do
  gem 'factory_girl_rails', '~> 4.8'
  gem 'pry-byebug', '~> 3.4', '>= 3.4.2'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do 
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'climate_control', '~> 0.0.3'
end
