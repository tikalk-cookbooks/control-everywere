name "web"
description "web server [amongst other things, is up to you to decide ...]"
run_list "recipe[nodejs::default]", "recipe[git::default]", "recipe[control-everywere::web]"

