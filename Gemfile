source "https://rubygems.org"

gem "chefspec"
gem "emeril"
gem "finstyle",   "= 1.4.0"
gem "foodcritic", "= 4.0.0"
gem "librarian-chef"
gem "rake"

# allow CI to override the version of Chef for matrix testing
gem "chef", (ENV["CHEF_VERSION"] || ">= 0.10.10")

group :development do
  gem "guard-rspec"
  gem "guard-rubocop"
end

group :integration do
  gem "kitchen-docker"
  gem "kitchen-vagrant"
  gem "test-kitchen"
end
