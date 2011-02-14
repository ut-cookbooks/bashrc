#
# Cookbook Name:: bashrc
# Recipe:: default
#
# Copyright 2010, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "git"

package "curl"

bash "update_bashrc" do
  user "root"
  cwd "/etc/bash"
  code %{bash -i -c "source /etc/bash/bashrc && bashrc update"}
  only_if %{test -d /etc/bash && test -f /etc/bash/bashrc}
end

bash "install_bashrc" do
  user "root"
  code %{bash < <( curl -L http://bit.ly/bashrc-install-system-wide )}
  creates "/etc/bash/bashrc"
end

if platform?("ubuntu") 
  # shortcut the sourcing of ${HOME}/.profile which on Ubuntu sources
  # ${HOME}/.bashrc which sets prompts (again!) and other undesirables
  file "/etc/skel/.bash_login" do
    owner   "root"
    group   "root"
    mode    "0644"
    action  :create
  end

  file "/root/.bash_login" do
    owner   "root"
    group   "root"
    mode    "0644"
    action  :create
  end

  # support for vagrant user if using vagrant
  file "/home/vagrant/.bash_login" do
    owner   "root"
    group   "root"
    mode    "0644"
    action  :create
    only_if %{test -d /home/vagrant}
  end
end
