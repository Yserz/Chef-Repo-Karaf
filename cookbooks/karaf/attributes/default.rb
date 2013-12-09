default['karaf']['user'] = 'karaf'
default['karaf']['group'] = 'karaf-admin'

version = "3.0.0.RC1"
default['karaf']['package_url'] = "http://mirror.synyx.de/apache/karaf/#{version}/apache-karaf-#{version}.tar.gz"
default['karaf']['base_dir'] = '/usr/local/karaf'