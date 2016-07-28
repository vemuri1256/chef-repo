#
# Cookbook Name:: test_devops
# Recipe:: default
# All rights reserved - Do Not Redistribute
#


directory "/etc/nginx/ssl/cert/" do
  path "/etc/nginx/ssl/cert/"
  owner 'root'
  group 'root'
  mode "777" 
  recursive true
  action :create
  not_if { ::Dir.exist? "/etc/nginx/ssl/cert/"}
end

directory "/etc/nginx/ssl/private/" do
  path "/etc/nginx/ssl/private/"
  owner 'root'
  group 'root'
  mode "777" 
  recursive true
  action :create
  not_if { ::Dir.exist? "/etc/nginx/ssl/private/"}
end

cookbook_file "/etc/nginx/ssl/cert/vemuri-devops.com.crt" do
	source "vemuri-devops.com.crt"
	owner root
	group root
	mode "0755"
	action :create
	not_if { ::File.exist? "/etc/nginx/ssl/cert/vemuri-devops.com.crt"}
end

cookbook_file "/etc/nginx/ssl/private/vemuri-devops.com.key" do
	source "vemuri-devops.com.key"
	owner root
	group root
	mode "0755"
	action :create
	not_if { ::File.exist? "/etc/nginx/ssl/private/vemuri-devops.com.key"}
end

template '/etc/nginx/conf.d/default.conf' do
  source 'default.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  action :create
end 

cookbook_file "/usr/share/nginx/html/index.html" do
	source "index.html"
	owner 'root'
	group 'root'
	mode "0755"
	action :create
		notifies :restart, 'service[nginx]'
	not_if "cat /usr/share/nginx/html/index.html | grep Hello "
end

service 'nginx' do
  supports :status => true, :restart => true, :start => true, :stop => true
  action [ :enable, :nothing]
end
