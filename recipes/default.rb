# coding: UTF-8
#
# Cookbook Name:: ops_tcpdump_handler
# Recipe:: default
#

package 'tcpdump'

include_recipe 'runit::default'

# Create runit service
runit_service 'tcpdump' do
  default_logger true
end

# Clear the contents of the current log
# For some reason, removing and replacing the file doesn't work
execute 'echo "" > /var/log/tcpdump/current' do
  only_if { File.exist?('/var/log/tcpdump/current') }
end
