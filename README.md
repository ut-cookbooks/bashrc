# Description

Installs a bash profile from http://github.com/fnichol/bashrc.

# Requirements

## Chef

Tested on 0.10.2 and 0.10.4 but newer and older version should work just fine.
File an [issue][issues] if this isn't the case.

## Platform

The following platforms have been tested with this cookbook, meaning that the
recipes run on these platforms without error:

* ubuntu
* debian
* mac_os_x

## Cookbooks

This cookbook depends on the following external cookbooks:

* [git][git_cb] (Opscode)

# Installation

Depending on the situation and use case there are several ways to install
this cookbook. All the methods listed below assume a tagged version release
is the target, but omit the tags to get the head of development. A valid
Chef repository structure like the [Opscode repo][chef_repo] is also assumed.

## Using Librarian

The [Librarian][librarian] gem aims to be Bundler for your Chef cookbooks.
Include a reference to the cookbook in a **Cheffile** and run
`librarian-chef install`. To install with Librarian:

    gem install librarian
    cd chef-repo
    librarian-chef init
    cat >> Cheffile <<END_OF_CHEFFILE
    cookbook 'user',
      :git => 'git://github.com/fnichol/chef-bashrc.git', :ref => 'v0.2.2'
    END_OF_CHEFFILE
    librarian-chef install

## Using knife-github-cookbooks

The [knife-github-cookbooks][kgc] gem is a plugin for *knife* that supports
installing cookbooks directly from a GitHub repository. To install with the
plugin:

    gem install knife-github-cookbooks
    cd chef-repo
    knife cookbook github install fnichol/chef-bashrc/v0.2.2

## As a Git Submodule

A common practice (which is getting dated) is to add cookbooks as Git
submodules. This is accomplishes like so:

    cd chef-repo
    git submodule add git://github.com/fnichol/chef-bashrc.git cookbooks/user
    git submodule init && git submodule update

**Note:** the head of development will be linked here, not a tagged release.

## As a Tarball

If the cookbook needs to downloaded temporarily just to be uploaded to a Chef
Server or Opscode Hosted Chef, then a tarball installation might fit the bill:

    cd chef-repo/cookbooks
    curl -Ls https://github.com/fnichol/chef-bashrc/tarball/v0.2.2 | tar xfz - && \
      mv fnichol-chef-bashrc-* bashrc

## From the Opscode Community Platform

This cookbook is not currently available on the site due to its limited use
to the community at large.

# Usage

## bashrc Installed System-Wide

If you want to install *bashrc* across the entire system, then include
`recipe[bashrc::system]` in your run\_list.

## bashrc Installed For A Specific User

If you want to install *bashrc* only for a specific user, then include
`recipe[bashrc::user]` in your run\_list and add a hash to the
`user_installs` attribute list. For example:

    node['bashrc']['user_installs'] = [
      { 'user'    => 'smithers',
        'update'  => true
      }
    ]

See below for more details.

# Recipes

## default

Installs the common package pre-requisites used by the *system* and *user*
recipes.

There is no reason to include this recipe.

## system

Installs the bashrc profile system-wide (that is, into `/etc/bash`). This
recipe includes *default*.

Use this recipe by itself if you want the bashrc profile available across all
users on the system.

## user

Installs the bashrc profile for a list of users (selected from the
`node['bashrc']['user_installs']` hash). This recipe includes *default*.

Use this recipe by itself if you want the bashrc profile available only
to specific users or if the user running Chef does not have root privileges.

# Attributes

## update

Whether or not to update *bashrc* system-wide on every Chef execution.

The default is `false`.

## user\_update

Whether or not to update *bashrc* for user installs by default on every
Chef execution. Each user can override this value by setting an `update`
attribute in their user hash.

## installer\_url

The URL containing the system-wide installer script.

The default is
`https://raw.github.com/fnichol/bashrc/master/contrib/install-system-wide`.

## user\_installer\_url

The URL containing the per-user installer script.

The default is
`https://raw.github.com/fnichol/bashrc/master/contrib/install-local`.

# Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every seperate change you make.

# License and Author

Author:: [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>)

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

[chef_repo]:      https://github.com/opscode/chef-repo
[git_cb]:         http://community.opscode.com/cookbooks/git
[kgc]:            https://github.com/websterclay/knife-github-cookbooks#readme
[librarian]:      https://github.com/applicationsonline/librarian#readme

[repo]:         https://github.com/fnichol/chef-bashrc
[issues]:       https://github.com/fnichol/chef-bashrc/issues
