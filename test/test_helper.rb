ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
if( ENV['COVERAGE'] == 'on' ) 
  require 'simplecov'
  require 'simplecov-rcov'
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.start do
    add_filter "test/controllers/"
    add_filter "test/models/"
  end
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
