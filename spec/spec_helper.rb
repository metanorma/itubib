require "bundler/setup"
require 'vcr'
require 'webmock/rspec'
require 'simplecov'
require 'equivalent-xml'

SimpleCov.start do
  add_filter '/spec/'
end

require "relaton_itu"

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    WebMock.reset!
    WebMock.disable_net_connect!
  end
end
