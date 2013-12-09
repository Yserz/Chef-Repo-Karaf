name             'karaf'
maintainer       'Michael Koppen'
maintainer_email 'michael.koppen@googlemail.com'
license          'All rights reserved'
description      'Installs/Configures Karaf'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'karaf::default', 'Installs the Karaf binaries.'

supports 'ubuntu'

depends 'java'

attribute 'karaf/user',
  :display_name => 'Karaf User',
  :description => 'The user that Karaf executes as',
  :type => 'string',
  :default => 'karaf'
  
attribute 'karaf/group',
  :display_name => 'Karaf Admin Group',
  :description => 'The group allowed to manage Karaf',
  :type => 'string',
  :default => 'karaf-admin'

attribute 'karaf/package_url',
  :display_name => 'URL for Karaf Package',
  :description => 'The URL to the Karaf install package',
  :type => 'string',
  :default => 'http://mirror.synyx.de/apache/karaf/3.0.0.RC1/apache-karaf-3.0.0.RC1.tar.gz'

attribute 'karaf/base_dir',
  :display_name => 'Karaf Base Directory',
  :description => 'The base directory of the Karaf install',
  :type => 'string',
  :default => '/usr/local/karaf'