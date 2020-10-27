package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    :server_name => 'THE GREATEST WEB SERVER',
    :hostname => node['hostname'],
    :ipaddress => node['ipaddress']
  )
  action :create
  owner 'root'
end

service 'httpd' do
  action [:enable, :start]
end
