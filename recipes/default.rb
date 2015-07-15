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

# download adminer (should allow selection here)
remote_file "#{node['adminer']['dir_to_install']}/adminer.php" do
  source 'http://downloads.sourceforge.net/adminer/adminer-4.2.1-mysql-en.php'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

# download plugin for plugins
remote_file "#{node['adminer']['dir_to_install']}/plugin.php" do
  source 'https://raw.github.com/vrana/adminer/master/plugins/plugin.php'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

# download plugin
remote_file "#{node['adminer']['dir_to_install']}/plugins/tables-filter.php" do
  source 'https://raw.github.com/vrana/adminer/master/plugins/tables-filter.php'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

# prepare index with plugins
template "#{node['adminer']['dir_to_install']}/index.php" do
  source 'index.php.erb'
  owner 'root'
  group 'root'
  mode '0644'
end



