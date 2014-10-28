include_recipe "apt::default"
include_recipe "apache2"
include_recipe "java"
include_recipe "logstash::server"
include_recipe "elasticsearch"
include_recipe "elasticsearch::plugins"
include_recipe "kibana"
include_recipe "kibana::apache"

service "elasticsearch" do
  action [:restart]
end

