# Fletcher Nichol's Bash Profile Chef Cookbook

[![Build Status](https://travis-ci.org/fnichol/chef-bashrc.svg?branch=master)](https://travis-ci.org/fnichol/chef-bashrc)

* Source Code: https://github.com/fnichol/chef-bashrc

A Chef cookbook to install a bash profile from http://github.com/fnichol/bashrc.

## Usage

### bashrc Installed System-Wide

If you want to install *bashrc* across the entire system, then include
`recipe[bashrc::system]` in your run\_list.

### bashrc Installed For A Specific User

If you want to install *bashrc* only for a specific user, then include
`recipe[bashrc::user]` in your run\_list and add a hash to the
`user_installs` attribute list. For example:

    node['bashrc']['user_installs'] = [
      { 'user'    => 'smithers',
        'update'  => true
      }
    ]

See below for more details.

## Requirements

* Chef 0.10.2 or higher

## Platform Support

This cookbook is tested on the following platforms with [Test Kitchen](http://kitchen.ci):

* CentOS 5.8 64-bit
* CentOS 6.3 64-bit
* Mac OS X 10.9
* Mac OS X 10.10
* Ubuntu 10.04 64-bit
* Ubuntu 12.04 64-bit

## Cookbook Dependencies

This cookbook depends on the following external cookbooks:

* [git](https://supermarket.chef.io/cookbooks/git)

## Recipes

### default

Installs the common package pre-requisites used by the *system* and *user*
recipes.

There is no reason to include this recipe.

### system

Installs the bashrc profile system-wide (that is, into `/etc/bash`). This
recipe includes *default*.

Use this recipe by itself if you want the bashrc profile available across all
users on the system.

### user

Installs the bashrc profile for a list of users (selected from the
`node['bashrc']['user_installs']` hash). This recipe includes *default*.

Use this recipe by itself if you want the bashrc profile available only
to specific users or if the user running Chef does not have root privileges.

## Attributes

### update

Whether or not to update *bashrc* system-wide on every Chef execution.

The default is `false`.

### user\_update

Whether or not to update *bashrc* for user installs by default on every
Chef execution. Each user can override this value by setting an `update`
attribute in their user hash.

### installer\_url

The URL containing the system-wide installer script.

The default is
`https://raw.github.com/fnichol/bashrc/master/contrib/install-system-wide`.

### user\_installer\_url

The URL containing the per-user installer script.

The default is
`https://raw.github.com/fnichol/bashrc/master/contrib/install-local`.

## Resources and Providers

There are **no** resources and providers.

## Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every seperate change you make.

## License and Author

Author:: [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>) [![endorse](http://api.coderwall.com/fnichol/endorsecount.png)](http://coderwall.com/fnichol)

Contributors:: https://github.com/fnichol/chef-bashrc/contributors

Copyright:: 2010, 2011, Fletcher Nichol

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[fnichol]:      https://github.com/fnichol
[repo]:         https://github.com/fnichol/chef-bashrc
[issues]:       https://github.com/fnichol/chef-bashrc/issues
