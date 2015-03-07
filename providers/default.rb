#
# Cookbook Name:: gemrc
# Provider:: gemrc
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

use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

# Build a user resource, and then get that users info
def current_user(username = nil)
  return @current_user if username.nil?
  user = Chef::Resource::User.new(username)
  @current_user = Chef::Provider::User.new(user, nil)
  @current_user.load_current_resource
  @current_user
end

# validate the user is an existing user
def user_exists?
  @current_user.user_exists
end

# return the user's home directory
def user_home
  @current_user.current_resource.home
end

action :create  do
  current_user(new_resource.user)
  # ensure the user exists
  unless user_exists?
    Chef::Application.fatal!("User #{new_resource.user} does not exist!")
  end

  template "#{user_home}/.gemrc" do
    if new_resource.source.nil?
      source 'gemrc.erb'
      cookbook 'gemrc'
    else
      source new_resource.source
    end
    owner new_resource.user
    mode '0600'
    variables(config: new_resource)
  end

  Gem.configuration = Gem::ConfigFile.new([])
  Gem.clear_paths
end

action :delete do
  user_info = load_user(new_resource.user)
  file "#{user_info.home}/.gemrc" do
    action :delete
  end
end
