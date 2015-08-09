require "chefspec"
require "chefspec/librarian"
require_relative "support/example_groups/provider_example_group"
require_relative "support/example_groups/resource_example_group"

RSpec.configure do |config|
  config.log_level = :fatal

  config.include Chef::ProviderExampleGroup,
    :type => :provider,
    :file_path => %r{test/unit/libraries/*/provider_*}

  config.include Chef::ResourceExampleGroup,
    :type => :resource,
    :file_path => %r{test/unit/libraries/*/resource_*}
end
