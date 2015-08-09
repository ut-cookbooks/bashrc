# Fletcher Nichol's Bash Profile Chef Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/ut_base.svg)](https://supermarket.chef.io/cookbooks/bashrc)
[![Build Status](https://travis-ci.org/ut-cookbooks/bashrc.svg?branch=master)](https://travis-ci.org/ut-cookbooks/bashrc)

* Supermarket: https://supermarket.chef.io/cookbooks/bashrc
* Source Code: https://github.com/ut-cookbooks/bashrc

A Chef cookbook containing a resource to install a bash profile from http://github.com/fnichol/bashrc.

## Usage

Place a dependency on the bashrc cookbook in your cookbook's metadata.rb

```ruby
depends "bashrc", "~> 2.0"
```

Then, to install systemwide, put the following in a recipe:

```ruby
bashrc "root"
```

Or for a particular user:

```ruby
bashrc "jdoe"
```

For a more complete example, checkout the provided [example cookbook][example_cb].

## Scope

As of version 2.0.0, this cookbook is a library-style or resource-only cookbook. In other words, there are no recipes, attributes, etc. and you use the provded resource in your own cookbook. This helps keep dependencies and maintenance as low as possible.

## Requirements

* Chef 0.10.2 or higher

## Platform Support

This cookbook is tested on the following platforms with [Test Kitchen](http://kitchen.ci):

* CentOS 7.1 64-bit
* Debian 8.1 64-bit
* Mac OS X 10.9
* Mac OS X 10.10
* Ubuntu 12.04 64-bit
* Ubuntu 14.04 64-bit
* Ubuntu 15.04 64-bit

## Cookbook Dependencies

This cookbook has **no** external cookbook dependencies.

## Recipes

This cookbook has **no** recipes.

## Attributes

This cookbook has **no** attributes.

## Resources and Providers

### bashrc

The `bashrc` resource manages the installation of the bashrc profile for all users on the system when the **root** user is provided or can install it on a per-user basis.

The system-wide installation puts the profile under `/etc/bash` and the per-user installation puts the profile under the user's `$HOME` directory in `.bash`.

The `:install` action installs the profile, which is the default (and only) action.

#### Example

```ruby
bashrc "system-wide installation" do
  user "root"
  action :install
end

# short form of above example
bashrc "root"

bashrc "install only for jdoe user" do
  user "jdoe"
  action :install
end

# short form of above example
bashrc "jdoe"
```

Note that for per-user installations, the user must already exist with their home directory created and appropriate permissions assigned (i.e. the user must be able to write in their own home directory).

#### Attributes

* `user` - The user that the profile will be installed under. If `"root"` is provided, a system-wide installation will be performed, setting up under `/etc/bash`. Defaults to the resource name.

#### Actions

* `:install` - Downloads, extracts, and initializes the profile for the given user.

## Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every seperate change you make.

## License and Author

Author:: [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>) [![endorse](http://api.coderwall.com/fnichol/endorsecount.png)](http://coderwall.com/fnichol)

Contributors:: https://github.com/ut-cookbooks/bashrc/contributors

Copyright:: 2010, 2011, 2015 Fletcher Nichol

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
[repo]:         https://github.com/ut-cookbooks/bashrc
[issues]:       https://github.com/ut-cookbooks/bashrc/issues
[example_cb]:   https://github.com/ut-cookbooks/bashrc/tree/master/example
