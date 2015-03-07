#
# Cookbook Name:: gemrc
# Resource:: gemrc
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
actions :create, :delete

default_action :create

attribute :user,
          name_attribute: true,
          kind_of: String,
          required: true

attribute :source,
          kind_of: String,
          default: nil

# http://guides.rubygems.org/command-reference/#gem-environment
attribute :sources,
          kind_of: Array,
          default: nil

attribute :verbose,
          kind_of: [String, TrueClass, FalseClass],
          regex: /true|false|:really/,
          default: nil

attribute :update_sources,
          kind_of: [String, TrueClass, FalseClass],
          regex: /true|false/,
          default: nil

attribute :backtrace,
          kind_of: [String, TrueClass, FalseClass],
          regex: /true|false/,
          default: nil

attribute :gempath,
          kind_of: Array,
          default: nil

attribute :disable_default_gem_server,
          kind_of: [String, TrueClass, FalseClass],
          regex: /true|false/,
          default: nil

attribute :command_options,
          kind_of: Hash,
          default: nil
