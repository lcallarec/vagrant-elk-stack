depends "apache2"
depends 'java'
depends "apt"
depends "git"
depends "build-essential"
depends 'logstash'
depends 'elasticsearch'
depends 'kibana'

%w{ debian ubuntu }.each do |os|
supports os
end