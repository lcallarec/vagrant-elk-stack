include_recipe 'logstash::agent'

my_templates = {
  'input_syslog'         => 'config/input_file.conf.erb',
  'output_elasticsearch' => 'config/output_elasticsearch.conf.erb'
}

logstash_config 'agent' do
  action 'create'
  templates my_templates
  templates_cookbook 'ls'
  variables(
  	elasticsearch_cluster: 'elasticsearch-cluster',
  	elasticsearch_ip: '127.0.0.1'
  )
  # don't need notifies since the LWRP does it
end