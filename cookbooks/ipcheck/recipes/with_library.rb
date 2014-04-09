ip = '10.10.0.0/24'
mask = IPAddress.netmask(ip) #library method
Chef::Log.info("Netmask of #{ip}: #{mask}")
