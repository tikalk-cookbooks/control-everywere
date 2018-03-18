name "db"

description "database server"
run_list "recipe[sc-mongodb::default]"

default_attributes "mongodb" => {"install_method" => "none"} 

