# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require_relative '../lib/tmdb.rb'
require 'webmock/rspec'
require 'vcr'
require 'coveralls'

VCR.configure do |c|
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr'
  # your HTTP request service. You can also use fakeweb, webmock, and more
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each, delete_api_key: true) do
    Tmdb::Api.key(nil)
  end

  config.after(:each, delete_api_key: true) do
    Tmdb::Api.key(TmdbDefaultApiKey)
  end
end

# Defaults for tests
TmdbDefaultApiKey   = 'c29379565234e20d7cbf4f2e835c3e41'
TmdbDefaultLanguage = 'en'
