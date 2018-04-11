#
# Cookbook:: apache
# Recipe:: setup
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'vim-enhanced'
package 'tree'
package 'ntp'
package 'git'
package 'httpd'
template '/etc/motd' do
    source 'motd.erb'
    variables(
        :server_name => 'CENTOS_7_4_SERVER'
    )
    owner 'root'
    group 'root'
    action :create
end
cookbook_file '/var/www/html/index.html' do
    source 'index.html'
    mode '0644'
    owner 'root'
    group 'root'
    action :create
end
service 'ntpd' do
    action [:enable, :start]
end
service 'httpd' do
    action [:enable, :start]
end
