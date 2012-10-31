default_run_options[:pty] = true
require "bundler/capistrano"
require "rvm/capistrano"
set :use_sudo, false #permission conflict resolve
set :rvm_type, :system
set :deploy_to, "/home/deploy/www/beta.revol-tech.com.np"


set :application, "gitlabhq"
set :repository,  "git@github.com:revol-tech/gitlabhq.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "www.revol-tech.com.np"                          # Your HTTP server, Apache/etc
role :app, "www.revol-tech.com.np"                          # This may be the same as your `Web` server
role :db,  "www.revol-tech.com.np", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"


ssh_options[:forward_agent] = true
ssh_options[:port] = 2020
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end