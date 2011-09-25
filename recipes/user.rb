#
# Cookbook Name:: bashrc
# Recipe:: user
#
# Copyright 2010, 2011, Fletcher Nichol
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

include_recipe "bashrc"

Array(node['bashrc']['user_installs']).each do |bashrc_user|
  user_dir      = "#{node['bashrc']['user_home_root']}/#{bashrc_user['user']}"
  bash_dir      = "#{user_dir}/.bash"
  installer_url = bashrc_user['installer_url'] || node['bashrc']['user_installer_url']
  update        = if bashrc_user['update'].nil?
                    node['bashrc']['user_update']
                  else
                    bashrc_user['update']
                  end

  execute "update_bashrc" do
    user      bashrc_user['user']
    cwd       bash_dir
    command   %{bash -i -c "source /etc/bash/bashrc && bashrc update"}
    command   <<-CMD
      bash -i -c "\
        bashrc_local_install=1 \
        bashrc_prefix="#{bash_dir}" \
        source #{bash_dir}/bashrc && bashrc update \
      "
    CMD
    only_if   { update && ::File.exists?("#{bash_dir}/bashrc") }
  end

  execute "install_bashrc" do
    user      bashrc_user['user']
    command   %{bash -c "bash <( curl -L #{installer_url} )"}
    creates   "#{bash_dir}/bashrc"
  end
end
