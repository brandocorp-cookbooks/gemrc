#
# Cookbook Name:: gemrc
# Matchers:: gemrc, system_gemrc
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

if defined?(ChefSpec)
  def create_gemrc(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:gemrc, :create, resource_name)
  end

  def delete_gemrc(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:gemrc, :delete, resource_name)
  end

  def create_system_gemrc(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:system_gemrc, :create, resource_name)
  end

  def delete_system_gemrc(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:system_gemrc, :delete, resource_name)
  end
end
