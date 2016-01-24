# coding: UTF-8

name             'ops_tcpdump_handler'
maintainer       'Operations Infrastructure Team - Cerner Innovation, Inc.'
maintainer_email 'OpsInfraTeam@cerner.com'
license          'Apache 2.0'
description      'Installs/Configures ops_tcpdump_handler'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

supports 'ubuntu'
supports 'centos'
supports 'redhat'

depends 'runit', '~> 1.5.0'
