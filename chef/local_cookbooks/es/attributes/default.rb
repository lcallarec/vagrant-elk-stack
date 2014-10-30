node.default['java']['install_flavor'] = "openjdk"
node.default['java']['jdk_version'] = 7
node.default['java']["openjdk_packages"] = ['openjdk-7-jdk']

node.default['elasticsearch']['version'] = "1.1.1"
node.default['elasticsearch']['cluster']['name'] = "elasticsearch-cluster"
node.default['elasticsearch']['node']['name'] = "elasticsearch-node-1"

node.default['elasticsearch']['plugins']['royrusso/elasticsearch-HQ'] = {}