


default[:ce][:nodejs][:port] = "3000"

default[:ce][:project_name] =  "youtube-remote"
default[:ce][:repo_url] =      "https://github.com/assafg/#{node[:ce][:project_name]}"
default[:ce][:runtime_dir] =   "/opt/youtube-remote"
default[:ce][:ref] =           "master"
default[:ce][:bower_version] = "1.2.7"

#we default to dev env. must be override in non-vagrant env
default[:ce][:user] =      "vagrant"
default[:ce][:home_dir] =      "/home/vagrant"

#We should override this in the node (or Vagrantfile) 
default[:ce][:web][:ip] = "127.0.0.1"
default[:ce][:db][:ip] = "127.0.0.1"
default[:ce][:lb][:ip] = "127.0.0.1"
