set :application, "jazztoolbox"
set :repository, "http://svn.synenterprises.com/#{application}/trunk"

set :scm, :subversion

task :production do
	role :web, "cedar.synenterprises.com"
	role :app, "cedar.synenterprises.com"
	role :db,  "cedar.synenterprises.com", :primary => true

	set :rails_env, "production"
	set :deploy_to, "/var/www/jazztoolbox.com/app"
	set :user, "bhughes"
	set :use_sudo, false
end

namespace :deploy do
  task :restart do
	  restart_mongrel
	end
	
	task :start do
		start_mongrel
	end
	
	task :stop do
		stop_mongrel
	end
	
	task :restart_mongrel do
		stop_mongrel
		start_mongrel
	end
	
	task :start_mongrel do
		begin
			sudo "mongrel_rails cluster::start -C #{release_path}/config/mongrel_cluster.yml"
		rescue RuntimeError => e
			puts e
			puts "!! Mongrel appears to be up already."
		end
	end
	
	task :stop_mongrel do
		begin
			sudo "mongrel_rails cluster::stop -C #{release_path}/config/mongrel_cluster.yml"
		rescue RuntimeError => e
			puts e
			puts "!! Mongrel appears to be down already."
		end
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
