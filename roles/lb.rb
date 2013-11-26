name "lb"

description "Load balancing server"
#run_list "recipe[nginx::default]", "recipe[control-everywere::lb]"
run_list "recipe[control-everywere::lb]"

