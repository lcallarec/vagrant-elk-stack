node.default['java']['install_flavor'] = "openjdk"
node.default['java']['jdk_version'] = 7
node.default['java']["openjdk_packages"] = ['openjdk-7-jdk']

node.default['apache']['listen_ports'] = %w(80 81)

node.default['elasticsearch']['version'] = "1.1.1"
node.default['elasticsearch']['cluster']['name'] = "elasticsearch-cluster"
node.default['elasticsearch']['node']['name'] = "elasticsearch-node-1"

node.default['elasticsearch']['plugins']['royrusso/elasticsearch-HQ'] = {}

node.override['logstash']['instance']['agent'] = ''
node.override['logstash']['instance']['server'] = ''

node.default['logstash']['instance']['agent']['templates'] = {
	'input_syslog'] =>'config/logstash/input/file.conf.erb']
}

node.default['kibana']['version'] = '3'
node.default['kibana']['kibana3_version'] = '3.1.1'
node.default['kibana']['apache']['interface'] = '*'
node.default['kibana']['apache']['port'] = 81