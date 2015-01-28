# The directory that we're deploying to on the remote host.
set :deploy_to, "/var/www/sites/prototype.livingwage.westarete.com"

# Tell capistrano to use the beta environment. This is key for running 
# the database migrations via "cap beta deploy:migrations".
set :rails_env, "prototype"

# The hosts that we're deploying to.
role :app, "livingwage.westarete.com"
role :web, "livingwage.westarete.com"
role :db,  "livingwage.westarete.com", :primary => true
