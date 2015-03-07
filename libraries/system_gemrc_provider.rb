#
# Cookbook Name:: gemrc
# Provider:: system_gemrc
#
# Copyright (C) 2015 Brandon Raabe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class SystemGemrc < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create  do
        template new_resource.path do
          if new_resource.source.nil?
            source 'gemrc.erb'
            cookbook 'gemrc'
          else
            source new_resource.source
          end
          mode '0600'
          variables(config: new_resource)
        end
      end

      action :delete do
        file new_resource.path do
          action :delete
        end
      end
    end
  end
end
