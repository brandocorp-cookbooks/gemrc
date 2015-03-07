#
# Cookbook Name:: gemrc
# Resource:: system_gemrc
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

require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class SystemGemrc < Chef::Resource::LWRPBase
      resource_name :system_gemrc

      actions :create, :delete

      default_action :create

      attribute :path,
                kind_of: String,
                default: '/etc/gemrc' # /etc/gemrc

      attribute :source,
                kind_of: String,
                default: nil

      # http://guides.rubygems.org/command-reference/#gem-environment
      attribute :sources,
                kind_of: Array,
                default: nil

      attribute :verbose,
                kind_of: String,
                regex: /true|false|:really/,
                default: nil

      attribute :update_sources,
                kind_of: String,
                regex: /true|false/,
                default: nil

      attribute :backtrace,
                kind_of: String,
                regex: /true|false/,
                default: nil

      attribute :gempath,
                kind_of: Array,
                default: nil

      attribute :disable_default_gem_server,
                kind_of: String,
                regex: /true|false/,
                default: nil

      attribute :command_options,
                kind_of: Hash,
                default: nil

      def after_created
        Array(@action).each do |action|
          run_action(action)
          ##
          # @note  This will force the Gem module to re-read all gemrc config files
          # @see RubyGems source
          #   https://github.com/rubygems/rubygems/blob/master/lib/rubygems.rb
          #   https://github.com/rubygems/rubygems/blob/master/lib/rubygems/config_file.rb
          Gem.configuration = Gem::ConfigFile.new([])
          Gem.clear_paths
        end
      end
    end
  end
end

Chef::Platform.set(
  resource: :system_gemrc,
  provider: Chef::Provider::SystemGemrc
)
