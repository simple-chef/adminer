#
# Cookbook Name:: adminer
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# create the directories
directory "#{node['adminer']['dir_to_install']}/plugins" do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

versions = node['adminer']['versions_available']
file_to_download = versions[node['adminer']['version_to_install']]

# download adminer (should allow selection here)
remote_file "#{node['adminer']['dir_to_install']}/adminer.php" do
  source file_to_download
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  sensitive true
end

# download plugin for plugins
remote_file "#{node['adminer']['dir_to_install']}/plugin.php" do
  source 'https://raw.github.com/vrana/adminer/master/plugins/plugin.php'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  sensitive true
end

# download plugin
remote_file "#{node['adminer']['dir_to_install']}/plugins/tables-filter.php" do
  source 'https://raw.github.com/vrana/adminer/master/plugins/tables-filter.php'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  sensitive true
end

# prepare index with plugins
template "#{node['adminer']['dir_to_install']}/index.php" do
  source 'index.php.erb'
  owner 'root'
  group 'root'
  mode '0644'
  sensitive true
end



