



template "/etc/nginx/sites-available/#{node[:ce][:project_name]}" do  
  source "nginx-lb.erb"                            				
  owner "root"                                            		
  group "root"                                            		
  mode 0644                                             		
#  notifies :restart, "service[nginx]"                    		 
end

#nginx_site node[:ce][:project_name] do                           
 # enable :true
  #notifies :restart, "service[nginx]"
#end
