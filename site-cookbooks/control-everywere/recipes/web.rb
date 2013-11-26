#
# Cookbook Name:: control-everywere
# Recipe:: default
#
# Copyright 2013, Tikal Knowledge LTD
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# set system variables
magic_shell_environment 'MONGO_DB_CS' do
  value node[:ce][:db][:ip]
end

directory node[:ce][:runtime_dir] do
  owner "vagrant"
  group "vagrant"
  mode 00755
  action :create
end

git node[:ce][:runtime_dir] do
  repository node[:ce][:repo_url]
  reference node[:ce][:ref]
  user	"vagrant"
  action :sync
end

npm_package "install" do
  path 	 node[:ce][:runtime_dir]
  action :install_from_json
end

npm_package "bower" do
  version node[:ce][:bower_version]
  action :install
end 

bash "bower_install" do
	code	"bower install"
    environment	"HOME" => node[:ce][:home_dir]
	cwd	node[:ce][:runtime_dir]
	action	:run
	user	"vagrant"
end
