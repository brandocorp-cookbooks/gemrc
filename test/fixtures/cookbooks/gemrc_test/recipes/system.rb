options = {
  'install' => '--no-rdoc --no-ri',
  'update' => '--no-rdoc --no-ri'
}

system_gemrc 'system-wide gemrc' do
  sources ['https://gems.example.com', 'https://gemserver.company.com']
  command_options options
end
