require_relative "../spec_helper"
require_relative "../../../libraries/resource_bashrc"
require_relative "../../../libraries/provider_bashrc"

describe Chef::Provider::Bashrc do

  let(:resource_name) { "jdoe" }

  before do
    allow(Etc).to receive(:getpwnam).with("jdoe") do
      double(:gid => 101, :dir => "/export/homes/jdoe")
    end
    allow(Etc).to receive(:getgrgid).with(101) do
      double(:name => "ppl")
    end
  end

  it "is whyrun support" do
    expect(provider).to be_whyrun_supported
  end

  context "for :install action" do

    let(:action) { :install }

    before { new_resource.action(action) }
  end
end
