name "db"
description "database server"
run_list "recipe[mongodb::default]"

default_atributes "mongodb" => {"package_name" => "mongodb"} 
