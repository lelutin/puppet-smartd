source 'https://rubygems.org'

gem 'rake'

group :development, :test do
  unless ENV.fetch('OPENVOX_GEM_VERSION', nil) then
    gem 'puppet', ENV['PUPPET_GEM_VERSION'], require: false
  else
    gem 'openvox', ENV.fetch('OPENVOX_GEM_VERSION', [">= 8.19.0", "< 9"]), :require => false
  end

  # This draws in rubocop and other useful gems for puppet tests
  gem 'voxpupuli-test', '~> 13.2.0', require: false
  # Use info from metadata.json for tests
  gem 'puppet_metadata', '< 7.0', require: false
end

group :beaker do
  gem 'beaker',                   require: false
  gem 'beaker-rspec',             require: false
  gem 'pry',                      require: false
  gem 'puppet-blacksmith',        require: false
  gem 'serverspec',               require: false
end

group :docs do
  gem 'puppet-strings', '< 6.0.0'
end

# vim:ft=ruby
