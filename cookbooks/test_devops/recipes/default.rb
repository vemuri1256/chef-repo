#
# Cookbook Name:: test_devops
# Recipe:: default
# All rights reserved - Do Not Redistribute
#


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
