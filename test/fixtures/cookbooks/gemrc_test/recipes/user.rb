cmd_opts = {
  'install' => '--no-rdoc --no-ri',
  'update' => '--no-rdoc --no-ri'
}

gem_paths = [
  '/home/foobar/.gem/ruby/2.1.0',
  '/usr/local/lib/ruby/gems/2.1.0'
]

user 'foobar' do
  supports manage_home: true
  home '/home/foobar'
end

gemrc 'foobar' do
  sources ['https://gems.example.com', 'https://gemserver.company.com']
  update_sources true
  verbose true
  backtrace false
  gempath gem_paths
  disable_default_gem_server true
  command_options cmd_opts
end
