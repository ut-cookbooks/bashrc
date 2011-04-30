# DESCRIPTION

Installs a bash profile from http://github.com/fnichol/bashrc. Currently only
targetting Ubuntu platform due to using the git cookbook. It's not complicated
and would work on other platforms, but that can come later.

# REQUIREMENTS

## Supported Platforms

The following platforms are supported by this cookbook, meaning that the
recipes run on these platforms without error:

* Ubuntu
* SUSE

## Cookbooks

Opscode Cookbooks (http://github.com/opscode/cookbooks/tree/master):

* git

# ATTRIBUTES

## `update`

Whether or not to update *bashrc* on every Chef execution.

The default is `false`.

## `install_url`

The URL containing the installer script.

The default is `http://bit.ly/bashrc-install-system-wide`.

# USAGE

This cookbook installs the bashrc if not present and pulls updates if it is
installed on the system.

# LICENSE and AUTHOR:

Author:: Fletcher Nichol (<fnichol@nichol.ca>)

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
