name "db"

description "database server"
run_list "recipe[mongodb::default]"

default_attributes "mongodb" => {"package_name" => "mongodb"} 

