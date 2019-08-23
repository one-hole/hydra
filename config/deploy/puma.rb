#!/usr/bin/env puma

environment 'production'
daemonize true

threads 8, 64
workers 4

app_name = 'hydra'
app_path = '/home/ubuntu/rails/hydra'
directory "#{app_path}/current"
share_dir = "#{app_path}/shared"

bind "unix://#{share_dir}/tmp/sockets/puma.sock"
activate_control_app "unix://#{share_dir}/tmp/sockets/pumactl.sock"
pidfile "#{share_dir}/tmp/pids/puma.pid"
state_path "#{share_dir}/tmp/sockets/puma.state"
stdout_redirect "#{share_dir}/log/puma.stdout.log", "#{share_dir}/log/puma.stderr.log"

on_restart do
  puts '- * - On restart - * -'
  puts 'pidfile: '
  puts @options[:pidfile]
  puts 'binds: '
  puts @options[:binds]
  puts 'control_url: '
  puts @options[:control_url]
  puts '- * - * - * -'
end

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end