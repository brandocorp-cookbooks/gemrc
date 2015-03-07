options = {
  'install' => '--no-rdoc --no-ri',
  'update' => '--no-rdoc --no-ri'
}

gemrc 'root' do
  command_options options
end
