# Cookbook Name:: bashrc
# Provider:: bashrc
#
# Copyright 2015, Fletcher Nichol
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

require "chef/provider/lwrp_base"

class Chef

  class Provider

    class Bashrc < Chef::Provider::LWRPBase

      provides :bashrc

      use_inline_resources

      def whyrun_supported?
        true
      end

      def action_install
        download_file
        base_directory
        extract_tar
        tip_date
        bashrc_init
        fix_debian_skel_profiles if !user_install? && platform_family?("debian")
      end

      def download_file
        remote_file tar_src do
          source "http://github.com/#{repo}/tarball/master"
          not_if { ::File.exist?(::File.join(dst_dir, "bashrc")) }
        end
      end

      def base_directory
        directory dst_dir do
          owner bashrc_user
          group bashrc_group
          recursive true
          mode "0755"
        end
      end

      def extract_tar
        execute "tar xvzf #{tar_src} --strip 1 && rm -f #{dst_dir}/tip.date" do
          user bashrc_user
          group bashrc_group
          cwd dst_dir
          creates ::File.join(dst_dir, "bashrc")
        end
      end

      def tip_date
        ruby_block "Create #{dst_dir}/tip.date" do
          block do
            ::File.open(::File.join(dst_dir, "tip.date"), "wb") do |file|
              file.write(tip_date_content)
            end
          end
          not_if { ::File.exist?(::File.join(dst_dir, "tip.date")) }
        end

        file ::File.join(dst_dir, "tip.date") do
          owner bashrc_user
          group bashrc_group
          mode "0644"
        end
      end

      def bashrc_init
        execute "Run bashrc init for #{dst_dir}" do
          user bashrc_user
          group bashrc_group
          command <<-COMMAND
            bash -c "shopt -s expand_aliases \
              && source ${bashrc_prefix}/bashrc \
              && bashrc init \
            "
          COMMAND
          environment init_env
          creates ::File.join(dst_dir, "bashrc.local")
        end
      end

      def fix_debian_skel_profiles
        # shortcut the sourcing of ${HOME}/.profile which on Ubuntu sources
        # ${HOME}/.bashrc which sets prompts (again!) and other undesirables
        file "/etc/skel/.bash_login" do
          owner "root"
          group "root"
          mode "0644"
        end

        file "/root/.bash_login" do
          owner "root"
          group "root"
          mode "0644"
        end
      end

      def dst_dir
        if user_install?
          ::File.join(user_home, ".bash")
        else
          "/etc/bash"
        end
      end

      def user_install?
        bashrc_user != "root"
      end

      def bashrc_user
        new_resource.user
      end

      def bashrc_group
        @bashrc_group ||= Etc.getgrgid(Etc.getpwnam(bashrc_user).gid).name
      end

      def user_home
        @user_home ||= Etc.getpwnam(bashrc_user).dir
      end

      def repo
        "fnichol/bashrc"
      end

      def tar_src
        ::File.join(Chef::Config[:file_cache_path], "bashrc.tar.gz")
      end

      def init_env
        env = {
          "USER" => bashrc_user,
          "HOME" => user_home,
          "bashrc_prefix" => dst_dir
        }
        env["bashrc_local_install"] = "1" if user_install?
        env
      end

      def tip_date_content
        api_url = "https://api.github.com/repos/#{repo}/git/refs/heads/master"
        ref = JSON.parse(Chef::HTTP.new(nil).get(api_url))
        commit_url = ref.fetch("object").fetch("url")
        commit = JSON.parse(Chef::HTTP.new(nil).get(commit_url))
        sha = commit.fetch("sha")[0, 7]
        time = DateTime.parse(commit.fetch("committer").fetch("date")).to_time

        "#{sha} #{time}\n"
      end
    end
  end
end
