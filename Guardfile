ignore([%r{^.gem/*}, %r{^tmp/*}, %r{^vendor/*}])

group :red_green_refactor, :halt_on_fail => true do
  guard :rspec, :cmd => "bundle exec rspec", :spec_paths => ["test/unit"] do
    watch(%r{^test/unit/.+_spec\.rb$})
    watch(%r{^(libraries|providers|recipes|resources)/(.+)\.rb$}) do |m|
      "test/unit/#{m[1]}/#{m[2]}_spec.rb"
    end
    watch("test/unit/spec_helper.rb") { "test/unit" }
  end

  guard :rubocop, :all_on_start => false, :keep_failed => false, :cli => "-r finstyle" do
    watch(%r{.+\.rb$})
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
  end
end
