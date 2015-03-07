options = {}

%w(
  build cert check cleanup contents dependency environment fetch
  generate_index help install list lock mirror open outdated owner pristine
  push query rdoc search server source specification stale uninstall unpack
  update which yank
).each do |cmd|
  options[cmd] = "--quiet"
end

user 'foobar' do
  supports manage_home: true
  home '/home/foobar'
end

gemrc 'foobar' do
  command_options options
end
