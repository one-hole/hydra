source 'https://gems.ruby-china.com'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0'
gem 'mysql2'
gem 'puma', '~> 3.11'
gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers'
gem 'kaminari'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'aliyun-sdk'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print'
  gem 'mina', '~> 1.2', '>= 1.2.3'
  gem 'mina-puma', '~> 1.1', require: false

end
