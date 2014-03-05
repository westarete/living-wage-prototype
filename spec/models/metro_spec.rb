require 'spec_helper'

describe Metro do

  before { @metro = Metro.new( state_id: 13,
                               cbsa: 17980,
                               cbsa_name: "Columbus, GA-AL") }

  subject { @metro }

  it { should be_valid }

  describe "when state_id is not present" do
    before { @metro.state_id = " " }
    it { should_not be_valid }
  end

  describe "when state_id is not a correct id" do
    before { @metro.state_id = 57 }
    it { should_not be_valid }
  end

  describe "when cbsa is not present" do
    before { @metro.cbsa = nil }
    it { should_not be_valid }
  end

  describe "when cbsa is not present" do
    before { @metro.cbsa_name = " " }
    it { should_not be_valid }
  end
end
