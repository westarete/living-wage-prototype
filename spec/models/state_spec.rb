require 'spec_helper'

describe State do
  
  before { @state = State.new(  region_id: 1,
                         statefips: 13,
                         state_name: "Alabama"
                       ) }
                        
  subject { @state }

  it { should be_valid }

  it { should respond_to(:region_id ) }
  it { should respond_to(:statefips ) }
  it { should respond_to(:state_name) }

  describe "when region_id is not present" do
    before { @state.region_id = " " }
    it { should_not be_valid }
  end

  describe "when statefips is not present" do
    before { @state.statefips = " " }
    it { should_not be_valid }
  end

  describe "when statefips is not one of the correct IDs" do
    before { @state.statefips = 57 }
    it { should_not be_valid }
  end

  describe "when state_name is not present" do
    before { @state.state_name = " " }
    it { should_not be_valid }
  end

end
