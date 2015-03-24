# coding: UTF-8
#
# Cookbook Name:: wget_test
# Recipe:: default
#

include_recipe 'ops_tcpdump_handler::default'

execute 'wget --spider https://beacon.nist.gov/rest/record/last'
