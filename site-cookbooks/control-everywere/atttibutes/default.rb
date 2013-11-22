


if !node['ec2']
	# for develomnet only
	default[:ce][:lb][:ip] = "192.168.56.103"
	default[:ce][:web][:ip] = "192.168.56.101"
	default[:ce][:db][:ip] = "192.168.56.102"
end

default[:ce][:nodejs][:port] = "3000"

default[:ce][:project_name] = "youtube-remote"
default[:ce][:repo_url] = "https://github.com/assafg/#{node[:ce][:project_name]}"
default[:ce][:runtime_dir] = "/opt/youtube-remote"
default[:ce][:ref] = "master"
default[:ce][:bower_version] = "1.2.7"
