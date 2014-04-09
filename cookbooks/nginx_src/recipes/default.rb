bash "get_regexp_support_dependency_nginx" do
  cwd Chef::Config['file_cache_path']
  code <<-EOH  
    yum -y install pcre pcre-devel zlib zlib-devel
  EOH
end 

version =  node['nginx_src']['version']

bash "install nginx from source" do
  cwd Chef::Config['file_cache_path']
  code <<-EOH
    wget http://nginx.org/download/nginx-#{version}.tar.gz
    tar xzf nginx-#{version}.tar.gz &&
    cd nginx-#{version} &&
    ./configure && make && make install
  EOH
  not_if "test -f /usr/local/nginx/sbin/nginx"
end

bash "setting nginx port to :81" do
  code <<-EOH
    sed -i "s/listen       80;/listen       81;/g" /usr/local/nginx/conf/nginx.conf
  EOH
end


template "nginx" do
  path "/etc/init.d/nginx"
  source "nginx.erb"
  owner "root"
  group "root"
  mode "0755"
end


service "nginx" do
  supports :restart => true, :start => true, :stop => true, :reload => true   
  action :restart
end
