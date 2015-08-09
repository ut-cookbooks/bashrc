#
# Cookbook Name:: bashrc
# Resource:: bashrc
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

require "chef/resource/lwrp_base"

class Chef

  class Resource

    class Bashrc < Chef::Resource::LWRPBase

      provides :bashrc

      self.resource_name = :bashrc
      actions :install
      default_action :install

      attribute :user, :kind_of => String, :name_attribute => true
    end
  end
end
