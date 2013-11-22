name "web"
description "Nodejs web server "
run_list "recipe[nodejs::default]", "recipe[git::default]"

