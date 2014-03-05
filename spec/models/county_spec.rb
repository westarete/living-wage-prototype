require 'spec_helper'

describe County do

  before { @county = County.new( state_id: 13,
                                 countyfips: 17980,
                                 countyname: "Columbus"
                       ) }

  subject { @county }

  it { should be_valid }

  describe "when state_id is not present" do
    before { @county.state_id = " " }
    it { should_not be_valid }
  end

  describe "when state_id is not a correct id" do
    before { @county.state_id = 57 }
    it { should_not be_valid }
  end

  describe "when countyfips is not present" do
    before { @county.countyfips = nil }
    it { should_not be_valid }
  end

  describe "when countyname is not present" do
    before { @county.countyname = " " }
    it { should_not be_valid }
  end
end
