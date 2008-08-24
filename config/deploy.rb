set :application, "jazztoolbox"
set :repository, "git@github.com:railsgarden/jazztoolbox.git"

set :scm, :git
set :branch, 'master'
set :deploy_via, :remote_cache

set :ssh_options, {:forward_agent => true}

task :production do
	role :web, "jazztoolbox.com"
	role :app, "jazztoolbox.com"
	role :db,  "jazztoolbox.com", :primary => true
  
	set :rails_env, "production"
	set :deploy_to, "/var/www/jazztoolbox.com/app"
	set :user, "bhughes"
	set :use_sudo, false
end

namespace :deploy do
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy:update_code", :create_permissions
after "deploy:update_code", :create_shared_links
after "deploy:update_code", :recreate_database

task :create_permissions do
  run "find #{release_path}/public -type d -exec chmod 0755 {} \\;" 
  run "find #{release_path}/public -type f -exec chmod 0644 {} \\;" 
  run "chmod 0755 #{release_path}/public/dispatch.*" 
  run "chmod -R a+w #{release_path}/tmp" 
end

task :create_shared_links do
  run "cd #{release_path}/public/ && ln -nfs ../../../../public/rdoc rdoc"
  run "cd #{release_path}/public/ && ln -nfs ../../../../public/rcov rcov"
end

task :recreate_database do
	run "cd #{release_path} && rake db:drop RAILS_ENV=#{rails_env}"
	run "cd #{release_path} && rake db:create RAILS_ENV=#{rails_env}"
	run "cd #{release_path} && rake db:migrate RAILS_ENV=#{rails_env}"
end
