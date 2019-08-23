puts '------> Use Production'
puts '--------> DomainIP 54.223.120.55'

set :domain, '193.112.247.22'
set :port, '22'
set :user, 'ubuntu'
set :rails_env, 'production'
set :branch, 'master'
set :keep_releases, 1
set :deploy_to, '/home/ubuntu/rails/hydra'