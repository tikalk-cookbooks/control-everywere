name "web"

description "nodejs web server "
#run_list "recipe[nodejs::default]", "recipe[git::default]"
run_list "recipe[nodejs::default]", "recipe[git::default]", "recipe[control-everywere::web]"

