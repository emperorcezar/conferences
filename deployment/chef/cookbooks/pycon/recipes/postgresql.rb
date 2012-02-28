include_recipe "pycon"

# Setup Postgres
include_recipe "postgresql::server"

postgresql_connection = {:host => "127.0.0.1", :port => 5432, :username => 'postgres', :password => node['postgresql']['password']['postgres']}

# create a postgresql database
postgresql_database node[:pycon][:dbname] do
  connection 
  action :create
end


postgresql_database_user node[:pycon][:dbuser] do
  connection = postgresql_connection
  password node[:pycon][:dbpass]
  database_name node[:pycon][:dbname]
  action :grant
end
