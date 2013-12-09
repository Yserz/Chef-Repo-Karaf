#
# Cookbook Name:: karaf
# Recipe:: default
#
# Copyright 2013, Michael Koppen
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'java'

## Creates Karaf Admin-Group
group node['karaf']['group'] do
end

## Creates Karaf Admin-User
user node['karaf']['user'] do
  comment 'Apache Karaf OSGi-Runtime'
  gid node['karaf']['group']
  home node['karaf']['base_dir']
  shell '/bin/bash'
  system true
end


## Download and unpack karaf binaries
package_url = node['karaf']['package_url']
base_package_filename = File.basename(package_url)
cached_package_filename = "#{Chef::Config[:file_cache_path]}/#{base_package_filename}"
# check if karaf is already installed
check_proc = Proc.new { ::File.exists?(node['karaf']['base_dir']) }

# Get Karaf-Binaries from package_url
remote_file cached_package_filename do
  not_if { check_proc.call }
  source package_url
  mode '0600'
  action :create_if_missing
end

## Unpack Karaf into base-dir and set rights to karaf-admin
bash 'unpack_karaf' do
  not_if { check_proc.call }
  code <<-EOF
  rm -rf /tmp/karaf
  mkdir /tmp/karaf
  cd /tmp/karaf
  tar -zxvf #{cached_package_filename}
  rm apache-karaf-*.tar.gz
  mkdir -p #{File.dirname(node['karaf']['base_dir'])}
  mv apache-karaf-3.0.0.RC1 #{node['karaf']['base_dir']}
  chown -R #{node['karaf']['user']} #{node['karaf']['base_dir']}
  chgrp -R #{node['karaf']['group']} #{node['karaf']['base_dir']}
  chmod -R 0770 #{node['karaf']['base_dir']}/bin/
  EOF
end