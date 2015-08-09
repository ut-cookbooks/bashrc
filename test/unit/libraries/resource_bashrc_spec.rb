require_relative "../spec_helper"
require_relative "../../../libraries/resource_bashrc"

describe Chef::Resource::Bashrc do

  let(:resource_name) { "betta" }

  it "sets the default attribute to user" do
    expect(resource.user).to eq("betta")
  end

  it "action defaults to :install" do
    expect(resource.action).to eq([:install])
  end
end
