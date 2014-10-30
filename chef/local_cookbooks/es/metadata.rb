depends 'build-essential'
depends 'apt'
depends 'java'
depends 'elasticsearch'

%w{ debian ubuntu }.each do |os|
supports os
end