# Overview of HAB_COMPLIANCE for inc

***This repo contains the Habitat plans to build the inc/inc_compliance package***

Currently this package consumes 2 cookbooks.

+ The [inc_hardening](https://github.inc.net/incchef/cb_hardening) cookbook for inc security `sets` on `RHEL` and `Windows 2k8r2-2016` on systems enrolled in AR

+ The [cb_habloader](https://github.inc.net/incchef/cb_habloader)  cookbook which can manage apckage installs, service loading and unloading, installs from a chef-client on a server that doesn't have habitat installed.

+ The [cb_iam](https://github.inc.net/incchef/cb_iam) cookbook for SOX compliance on relevant machines.

This package can be built in 2 ways.

+ Any changes to these cookbooks will trigger an automatic build of this habitat package in the pipeline and, change the version number. It will then publish the package to the test channel on the inc builder site.
  + This package will need to be promoted manually in either builder or hab cli after verification it is functioning as expected.

+ If a change is made to the code of just this package directly, you will then push your change to the git repo, that will be tested in the pipeline and wait for a pull request to be put in github.
  + You will need to manuall run the package on master manually and prvide a new package number that is +1 higher than the version in builder in the 3 octet (0.0.1)

+ You can manually build master with no changes to the code. You will need to provide a version for this as well.

## Adding new cookbooks

When adding a new cookbook, you only need to add it's info in the [effortless policyfile](../blob/master/policyfiles/effortless.rb) **EXAMPLE BELOW**

```#!/bin/ruby
name 'inc_compliance'

# Where to find external cookbooks:
default_source :artifactory, 'http://yourartifactory.com/artifactory/api/chef/chef' do |s|
  s.preferred_for 'inc_hardening', 'cb_habloader', 'cb_iam', 'new_cookbook'
end

# run_list: chef-client will run these recipes in the order specified.
run_list 'inc_hardening', 'cb_habloader' , 'cb_iam', 'new_cookbook'

cookbook 'line', path: '../cookbooks/line'
cookbook 'ohai', path: '../cookbooks/ohai'
```

***For more information reference these links***

+ [About Policyfile](https://docs.chef.io/policyfile/)

+ [Policfile Syntax](https://docs.chef.io/config_rb_policyfile)

+ [Effortless Infra](https://learn.chef.io/modules/effortless-config/#/infrastructure-automation) Training module

+ [Getting started with Policyfiles](https://learn.chef.io/modules/getting-started-with-policyfiles/#/infrastructure-automation)
