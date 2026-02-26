# frozen_string_literal: true

require 'rspec-puppet-facts'
require 'voxpupuli/test/spec_helper'

ENV['STRICT_VARIABLES'] = 'no'

# rails-type helper to open up fixture files
RSpec.configure do |config|
  def file_fixture(fixture_name)
    Pathname.new(File.join('spec', 'fixtures', 'files', fixture_name))
  end
end
