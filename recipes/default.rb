#
# Cookbook:: audit-patch
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# role
#  audit:
#fetcher:        chef-server
#inspec_version: 4.18.39
#reporter:       chef-server-automate
node.override['audit']['fetcher'] = 'chef-server'
node.override['audit']['reporter'] = 'chef-server-automate'


case node['os']
when 'linux'
  node.override['audit']['profiles']['linux-patch-baseline']['compliance'] = "delivery/linux-patch-baseline"
when 'windows'
  node.override['audit']['profiles']['windows-patch-baseline']['compliance'] = "delivery/windows-patch-baseline"
end

include_recipe 'audit'
