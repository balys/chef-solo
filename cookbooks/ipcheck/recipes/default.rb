
chef_gem 'ipaddress'
require 'ipaddress'
ip = IPAddress("192.168.0.1/24");
Chef::Log.info("Netmask of #{ip}: #{ip.netmask}")
