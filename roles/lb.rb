name "lb"
description "Load balancing server [amongst other things, is up to you to decide ...]"
run_list "recipe[nginx::default]"

