


default[:ce][:nodejs][:port] = "3000"

default[:ce][:project_name] =  "youtube-remote"
default[:ce][:repo_url] =      "https://github.com/assafg/#{node[:ce][:project_name]}"
default[:ce][:runtime_dir] =   "/opt/youtube-remote"
default[:ce][:home_dir] =      "/home/vagrant"
default[:ce][:ref] =           "master"
default[:ce][:bower_version] = "1.2.7"
