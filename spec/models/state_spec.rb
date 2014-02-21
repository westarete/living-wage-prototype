require 'spec_helper'

describe State do
  
  before { @state = State.new(  region_id: 1,
                         statefips: 13,
                         state_name: "Alabama",
                         geography: "State",
                         familycomposition: "2A1LF0C",
                         familysize: 2,
                         house_cost: 6626,
                         childcare_cost: 0,
                         health_cost: 4560,
                         food_cost: 5381,
                         trans_cost: 8693,
                         other_cost: 4201,
                         income: 29460,
                         income_pretax: 24888,
                         tax: 4572,
                         poverty: 14937,
                         minwage_hrly: 7.25,
                         minwage: 15080,
                         income_hrly: 14.16,
                         income_pretax_hrly: 14.16,
                         poverty_hrly: 7.1799998
                       ) }
                        
  subject { @state }

  it { should be_valid }

  it { should respond_to(:region_id ) }
  it { should respond_to(:statefips ) }
  it { should respond_to(:state_name) }
  it { should respond_to(:geography ) }
  it { should respond_to(:familycomposition ) }
  it { should respond_to(:familysize) }
  it { should respond_to(:house_cost) }
  it { should respond_to(:childcare_cost) }
  it { should respond_to(:health_cost) }
  it { should respond_to(:food_cost) }
  it { should respond_to(:trans_cost) }
  it { should respond_to(:other_cost) }
  it { should respond_to(:income) }
  it { should respond_to(:income_pretax) }
  it { should respond_to(:tax) }
  it { should respond_to(:poverty) }
  it { should respond_to(:minwage_hrly) }
  it { should respond_to(:minwage) }
  it { should respond_to(:income_hrly) }
  it { should respond_to(:income_pretax_hrly) }
  it { should respond_to(:poverty_hrly ) }

  describe "when region_id is not present" do
    before { @state.region_id = " " }
    it { should_not be_valid }
  end

  describe "when region_id is too long" do
    before { @state.region_id = 22 }
    it { should_not be_valid }
  end

  describe "when region_id is not one of the correct keys" do
    before { @state.region_id = 5 }
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

  describe "when geography is not present" do
    before { @state.geography = " " }
    it { should_not be_valid }
  end

  describe "when familycomposition is not present" do
    before { @state.familycomposition = " " }
    it { should_not be_valid }
  end

  describe "when familysize is not present" do
    before { @state.familysize = " " }
    it { should_not be_valid }
  end  

  describe "when house_cost is not present" do
    before { @state.house_cost = " " }
    it { should_not be_valid }
  end  

  describe "when childcare_cost is not present" do
    before { @state.childcare_cost = " " }
    it { should_not be_valid }
  end  

  describe "when health_cost is not present" do
    before { @state.health_cost = " " }
    it { should_not be_valid }
  end  

  describe "when food_cost is not present" do
    before { @state.food_cost = " " }
    it { should_not be_valid }
  end  

  describe "when trans_cost is not present" do
    before { @state.trans_cost = " " }
    it { should_not be_valid }
  end  

  describe "when other_cost is not present" do
    before { @state.other_cost = " " }
    it { should_not be_valid }
  end  

  describe "when income is not present" do
    before { @state.income = " " }
    it { should_not be_valid }
  end  

  describe "when income_pretax is not present" do
    before { @state.income_pretax = " " }
    it { should_not be_valid }
  end  

  describe "when tax is not present" do
    before { @state.tax = " " }
    it { should_not be_valid }
  end  

  describe "when poverty is not present" do
    before { @state.poverty = " " }
    it { should_not be_valid }
  end  

  describe "when minwage_hrly is not present" do
    before { @state.minwage_hrly = " " }
    it { should_not be_valid }
  end  

  describe "when minwage is not present" do
    before { @state.minwage = " " }
    it { should_not be_valid }
  end  

  describe "when income_hrly is not present" do
    before { @state.income_hrly = " " }
    it { should_not be_valid }
  end  

  describe "when income_pretax_hrly is not present" do
    before { @state.income_pretax_hrly = " " }
    it { should_not be_valid }
  end  

  describe "when poverty_hrly is not present" do
    before { @state.poverty_hrly = " " }
    it { should_not be_valid }
  end  
end
