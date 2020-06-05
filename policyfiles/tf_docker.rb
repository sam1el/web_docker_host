name 'tf_docker'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'tf_docker'

cookbook 'tf_docker', path: '../cookbooks/tf_docker'
