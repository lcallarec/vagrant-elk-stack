include_recipe 'logstash::agent'

logstash_config 'agent' do
  action :create
  templates node['logstash']['instance']['agent']['templates']
  templates_cookbook 'elk_stack'
  variables(
  	elasticsearch_cluster: node['elasticsearch']['cluster']['name'],
  	elasticsearch_ip: '127.0.0.1'
  )
  # don't need notifies since the LWRP does it
end