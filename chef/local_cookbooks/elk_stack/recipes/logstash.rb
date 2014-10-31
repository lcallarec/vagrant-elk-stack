include_recipe 'logstash::agent'

ls_templates = {
  'input_syslog'         => 'config/logstash/input/file.conf.erb',
  'output_elasticsearch' => 'config/logstash/output/elasticsearch.conf.erb'
}

logstash_config 'agent' do
  action :create
  templates ls_templates
  templates_cookbook 'elk_stack'
  variables(
  	elasticsearch_cluster: node.default['elasticsearch']['cluster']['name'],
  	elasticsearch_ip: '127.0.0.1'
  )
  # don't need notifies since the LWRP does it
end