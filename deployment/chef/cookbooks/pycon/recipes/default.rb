#
# Cookbook Name:: flourish
# Recipe:: default
#
include_recipe "python"
include_recipe "git"

# Make sure our user exists
user node[:pycon][:owner] do
  comment "Pycon user"
  system true
  shell "/bin/false"
end


group node[:pycon][:group] do
  action :create
end


directory node[:pycon][:dir] do
  owner node[:pycon][:owner]
  group node[:pycon][:group]
  mode "0755"
  action :create
end

python_virtualenv node[:pycon][:dir] do
  owner node[:pycon][:owner]
  group node[:pycon][:group]
  action :create
end

git "#{node[:pycon][:dir]}/pycon" do
  repository node[:pycon][:repo]
  reference node[:pycon][:branch]
  action :sync
end

execute "builddeps" do
  command "apt-get -y build-dep python-psycopg2"
  action :run
end

execute "requirments" do
  command "#{node[:pycon][:dir]}/bin/pip install -r #{node[:pycon][:dir]}/pycon/pycon_project/requirements/project.txt"
  user node[:pycon][:owner]
  environment ({'HOME' => ENV['HOME']}) 
  action :run
end
