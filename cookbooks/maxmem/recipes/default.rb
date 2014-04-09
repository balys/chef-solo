max_mem = node['memory']['total'].to_i * 0.8
execute 'echo max memory value into tmp file' do
  command "echo #{max_mem} > /tmp/max_mem; echo Good Job!"
end

http_request 'callback' do
  url node['maxmem']['callback']['url']
  only_if { node['maxmem']['callback']['enabled'] }
end
