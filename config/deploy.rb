# config valid only for current version of Capistrano
lock "3.4.0"

set :application, "annict"
set :repo_url, "git@github.com:annict/annict.git"

set :deploy_to, "/home/annict"

set :rails_env, "production"
set :assets_roles, [:app]

set :puma_conf, "#{shared_path}/config/puma.rb"

set :rbenv_type, :system
set :rbenv_ruby, File.read(".ruby-version").strip

set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }

linked_dirs = %w(
  log
  tmp/pids
  tmp/sockets
)
set :linked_dirs, linked_dirs

linked_files = %w(
  config/application.yml
  config/database.yml
  config/secrets.yml
)
set :linked_files, linked_files

namespace :deploy do
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "puma:restart"
    end
  end
end
